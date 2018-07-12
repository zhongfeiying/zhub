#include <stdio.h>
#include <stdlib.h> 
#include "net.h"
#include <winsock2.h>
#include "../include/trace.h"
#define SIO_KEEPALIVE_VALS _WSAIOW(IOC_VENDOR,4)
typedef struct tcp_keepalive {
    u_long  onoff;
    u_long  keepalivetime;
    u_long  keepaliveinterval;
}TCP_KEEPALIVE;

static int get_imp(SOCKET s,char* buf,int max,int* cur)
{
	*cur = 0;
	int count = recv(s,buf,max,0);	
	if(SOCKET_ERROR == count)
		return -1;
	return count; 
}
static int get_char(REDIS redis)
{
	int c ;
	if(redis->size_ == -1)
		return EOF;
	if(redis->size_ == 0 && (redis->size_ = get_imp(redis->s,redis->buf,
					MAX_REDIS,&redis->cur_)) == -1 ){
		return EOF;
	}
	c = redis->buf[redis->cur_++];
	redis->size_--;
	return c;
}
static char* get_line(REDIS redis,char* buf,int lim)
{
	int c;
	char* org = buf;
	while(--lim && (c = get_char(redis)) != EOF )
		if((*buf++ = c) == '\n')
			break;
	*buf = '\0';
	return (c == EOF && org == buf)?NULL:org;
}

int init_net()
{
	WSADATA wsaData;
	int nResult;
	nResult = WSAStartup(MAKEWORD(2,2), &wsaData);
	if (NO_ERROR != nResult){
		printf("error:init net\n");
		return 0;
	}
	return 1;
}
void close_net()
{
	WSACleanup();
}

int connect_server(SOCKET* s,const char* server,int portno)
{
	struct sockaddr_in ServerAddress;
	struct hostent *Server;

	//Create a socket
	*s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

	if (INVALID_SOCKET == *s) {
			printf("\nError occurred while opening socket: %d.", WSAGetLastError());
		return 0; //error
	}

	//Get the server details
	Server = gethostbyname(server);

	if (Server == NULL) {
		closesocket(*s);
			printf("\nError occurred no such host.");
		return 0; //error
	}

	//Cleanup and Init with 0 the ServerAddress
	ZeroMemory((char *) &ServerAddress, sizeof(ServerAddress));

	ServerAddress.sin_family = AF_INET;

	//Assign the information received from gethostbyname()
	CopyMemory((char *)&ServerAddress.sin_addr.s_addr, 
			(char *)Server->h_addr,
			Server->h_length);

	ServerAddress.sin_port = htons(portno);

	//Establish connection with the server
	if (SOCKET_ERROR == connect(*s, (const struct sockaddr *)(&ServerAddress),sizeof(ServerAddress))) {
		closesocket(*s);
		printf("\nError occurred while connecting.");
		return 0; //error
	}
	return 1;
}
static int send_data(SOCKET s,const char* buf)
{
	int sent_bytes = send(s, buf, strlen(buf), 0);
	if (SOCKET_ERROR == sent_bytes) {
		//			printf("\nError occurred while writing to socket %ld.\n", WSAGetLastError());
		return 0; //error
	}
	return sent_bytes;
}

static int rcv_data(SOCKET s,char* buf,DWORD bytes)
{
	int nBytesRecv = recv(s, buf, bytes, 0);

	if (SOCKET_ERROR == nBytesRecv) {
		//			printf("\nError occurred while reading from socket %ld.\n", WSAGetLastError());
		buf[0] = 0;
		return 0; //error
	}
	*(buf + nBytesRecv) = 0;
	/*		if(strstr(buf,"$\n") == 0){
				nBytesRecv += rcv_data(s,buf+nBytesRecv,bytes);
				}
				*/
	return nBytesRecv;
}
NET_API void number_model(char* value)
{
	SOCKET s;
	if(connect_server(&s,"www.qqft.com",50001) == 0){
		closesocket(s);
		return ;
	}
	send_data(s,value);
	closesocket(s);
}
REDIS get_redis(const char* server,int portno)
{
	REDIS redis = (REDIS)malloc(sizeof(struct _redis_type_));
	if(redis == NULL)
		return NULL;
	memset(redis,0,sizeof(struct _redis_type_));
	if(connect_server(&redis->s,server,portno) == 0){
		free_redis(redis);
		return NULL;
	}
	return redis;
}
void close_redis(REDIS redis)
{
	closesocket(redis->s);
}
void free_redis(REDIS redis)
{
	closesocket(redis->s);
	free(redis);
}
int redis_set(REDIS redis,const char* key,const char* value)
{
	int result = 0;
	char* buf = (char*)malloc(MAX_REDIS);
	if(buf == NULL)
		return 0;
	sprintf(buf,"*3\r\n$3\r\nSET\r\n$%d\r\n%s\r\n$%d\r\n%s\r\n",strlen(key),key,strlen(value),value);
	result = send_data(redis->s,buf);

	get_line(redis,buf,MAX_REDIS_STR);
	if(strstr(buf,"+OK") == buf)
		result = 1;
	else
		result = 0;
	free(buf);

	return result;
}
int redis_incr(REDIS redis,const char* key,char* error)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"*2\r\n$4\r\nINCR\r\n$%d\r\n%s\r\n",strlen(key),key);
	result = send_data(redis->s,buf);
	if(result = 0)
		return result;
	get_line(redis,buf,MAX_REDIS_STR);
	if(strstr(buf,"-ERR") == buf && error){
		strcpy(error,buf);
		return 0;
	}
	else if(strstr(buf,":") == buf){
		char* rt = strchr(buf,'\r');
		if(rt) *rt = '\0';
		result = atoi(buf+1);
	}
	return result;
}
int redis_get(REDIS redis,const char* key,char* value)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"*2\r\n$3\r\nGET\r\n$%d\r\n%s\r\n",strlen(key),key);
	result = send_data(redis->s,buf);
	if(result == 0)
		return result;
	get_line(redis,value,MAX_REDIS_STR);
	if(strstr(value,"$-1") == value){
		*value = '\0';
		return 0;
	}
	get_line(redis,value,MAX_REDIS);
	char* rt = strchr(value,'\r');
	if(rt) { *rt = '\0';result = 1;}
	return result;

}
int redis_hset(REDIS redis,const char* key,const char* field,const char* value)
{
	int result = 0;
	char* buf = (char*)malloc(MAX_REDIS);
	if(buf == NULL)
		return 0;
	sprintf(buf,"*4\r\n$4\r\nHSET\r\n$%d\r\n%s\r\n$%d\r\n%s\r\n$%d\r\n%s\r\n",
			strlen(key),key,
			strlen(field),field,
			strlen(value),value);
	result = send_data(redis->s,buf);

	get_line(redis,buf,MAX_REDIS_STR);
	if(strstr(buf,":") == buf)
		result = atoi(buf+1);
	free(buf);
	return result;
}
int redis_hgetall(REDIS redis,const char* key)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"*2\r\n$7\r\nHGETALL\r\n$%d\r\n%s\r\n",
			strlen(key),key);
	result = send_data(redis->s,buf);
	return result;
}
int redis_hget(REDIS redis,const char* key,const char* field,char* value)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"*3\r\n$4\r\nHGET\r\n$%d\r\n%s\r\n$%d\r\n%s\r\n",
			strlen(key),key,
			strlen(field),field);
	result = send_data(redis->s,buf);
	if(result == 0)
		return result;
	get_line(redis,value,MAX_REDIS_STR);
	if(strstr(value,"$-1") == value){
		*value = '\0';
		return 0;
	}
	get_line(redis,value,MAX_REDIS);
	char* rt = strchr(value,'\r');
	if(rt) { *rt = '\0';result = 1;}
	return result;
}
int redis_hincr(REDIS redis,const char* key,const char* field,char* error)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"*4\r\n$7\r\nHINCRBY\r\n$%d\r\n%s\r\n$%d\r\n%s\r\n$1\r\n1\r\n",
			strlen(key),key,
			strlen(field),field);
	result = send_data(redis->s,buf);
	if(result == 0)
		return result;
	get_line(redis,buf,MAX_REDIS_STR);
	if(strstr(buf,"-ERR") == buf && error){
		strcpy(error,buf);
		return 0;
	}
	else if(strstr(buf,":") == buf){
		char* rt = strchr(buf,'\r');
		if(rt) *rt = '\0';
		result = atoi(buf+1);
	}
	return result;
}
int redis_hkeys(REDIS redis,const char* key)
{
	int result = 0;
	char buf[MAX_REDIS_STR] = {0};
	sprintf(buf,"*1\r\n$5\r\nhkeys\r\n$%d\r\n%s\r\n",strlen(key),key);
	result = send_data(redis->s,buf);
	return result;
}
int redis_info(REDIS redis,char* buf)
{
	int result = 0;
	int max_ = 0;
	int rcv_ = 0;
	if(redis->s == 0)
		return 0;
	sprintf(buf,"*1\r\n$4\r\ninfo\r\n");
	result = send_data(redis->s,buf);
	get_line(redis,buf,MAX_REDIS);
	if(buf[0] == '$'){
		max_ = atoi(&buf[1]);
	}
	buf += strlen(buf);
	while(rcv_ < max_){
		get_line(redis,buf,MAX_REDIS);
		rcv_ += strlen(buf);
		buf += strlen(buf);
	}
	return result;
}
int redis_ping(REDIS redis)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	if(redis->s == 0)
		return 0;
	sprintf(buf,"*1\r\n$4\r\nping\r\n");
	result = send_data(redis->s,buf);
	if(result == 0)
		return result;
	get_line(redis,buf,MAX_REDIS_STR);
	if(strstr(buf,"+PONG") == buf)
		result = 1;
	else
		result = 0;
	return result;
}
int redis_del(REDIS redis,const char* key)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"*2\r\n$3\r\nDEL\r\n$%d\r\n%s\r\n",strlen(key),key);
	result = send_data(redis->s,buf);
	if(result == 0)
		return result;
	get_line(redis,buf,MAX_REDIS_STR);
	if(strstr(buf,"+OK") == buf)
		result = 1;
	else
		result = 0;
	return result;
}
int redis_hdel(REDIS redis,const char* key,const char* field)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"*3\r\n$4\r\nHDEL\r\n$%d\r\n%s\r\n$%d\r\n%s\r\n",
			strlen(key),key,
			strlen(field),field);
	result = send_data(redis->s,buf);
	if(result == 0)
		return result;
	get_line(redis,buf,MAX_REDIS_STR);
	if(strstr(buf,":") == buf){
		char* rt = strchr(buf,'\r');
		if(rt) *rt = '\0';
		result = atoi(buf+1);
	}
	return result;
}
int redis_subscribe(REDIS redis)
{
	char str[MAX_REDIS_STR];
	sprintf(str,"subscribe gserver\r\n");
	return send_data(redis->s,str);
}
char* redis_getline(REDIS redis,char* out,int size)
{
	return get_line(redis,out,size);
}
/*
int ap_get(REDIS redis,const char* prj,const char* filename)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"get %s %s\n",prj,filename);
	result = send_data(redis->s,buf);
	if(result == 0)
		return 0;
	return 1;	
}
int ap_passwd(REDIS redis,const char* pass)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"passwd %s\n",pass);
	result = send_data(redis->s,buf);
	if(result == 0)
		return 0;
	return 1;	
}
int ap_crtprj(REDIS redis,const char* prj)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"crtprj %s\n",prj);
	result = send_data(redis->s,buf);
	if(result == 0)
		return 0;
	return 1;	
}
int ap_put(REDIS redis,const char* prj,const char* filename)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"put %s %s\n",filename,prj);
	result = send_data(redis->s,buf);
	if(result == 0)
		return 0;
	return 1;	

}
char* ap_pwd(REDIS redis,char* out)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"pwd\n");
	result = send_data(redis->s,buf);
	if(result == 0)
		return NULL;
	if(get_line(redis,out,MAX_REDIS_STR) == NULL)
		return 0;
	return out;	
}
char* ap_getftp(REDIS redis,char* out)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"getftp\n");
	result = send_data(redis->s,buf);
	if(result == 0)
		return NULL;
	if(get_line(redis,out,MAX_REDIS_STR) == NULL)
		return 0;
	return out;	
}
char* ap_help(REDIS redis,char* out)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"help\n");
	result = send_data(redis->s,buf);
	if(result == 0)
		return NULL;
	if(get_line(redis,out,MAX_REDIS_STR) == NULL)
		return 0;
	return out;	
}
int ap_login(REDIS redis,const char* usr,const char* pass)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"login %s %s\n",usr,pass);
	result = send_data(redis->s,buf);
	if(result == 0)
		return 0;
	return 1;	
}
int ap_ls(REDIS redis,const char* path)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"ls %s\n",path);
	result = send_data(redis->s,buf);
	if(result == 0)
		return 0;
	return 1;	
}
char* ap_quit(REDIS redis,char* out)
{
	int result = 0;
	char buf[MAX_REDIS_STR];
	sprintf(buf,"quit\n");
	result = send_data(redis->s,buf);
	if(result == 0)
		return NULL;
	if(get_line(redis,out,MAX_REDIS_STR) == NULL)
		return 0;
	return out;	
}
*/
int settimeout(REDIS redis,u_long timeout)
{
	ioctlsocket(redis->s,FIONBIO,&timeout);
	return 0;
}
int ap_cmd(REDIS redis,const char* cmd)
{
	int result = 0;
	result = send_data(redis->s,cmd);
	return result;
}
int redis_keep_alive(REDIS redis)
{
	int result = 1;
	int keepalive = 1;
	int nRet = setsockopt(redis->s,SOL_SOCKET,SO_KEEPALIVE,
			(char*)&keepalive,sizeof(keepalive)); 
	if(nRet != 0) {
		printf("set socktopt failer\n");
		fflush(stdout);
		return 0;
	}
	TCP_KEEPALIVE inKeepAlive = {0};
	unsigned long ulInLen = sizeof(TCP_KEEPALIVE);     

	TCP_KEEPALIVE outKeepAlive = {0};
	unsigned long ulOutLen = sizeof(TCP_KEEPALIVE);     

	unsigned long ulBytesReturn = 0; 

	inKeepAlive.onoff   =   1;   
	inKeepAlive.keepaliveinterval   =   10000;   
	inKeepAlive.keepalivetime   =   3;   
	nRet = WSAIoctl(redis->s,   
			SIO_KEEPALIVE_VALS,
			(LPVOID)&inKeepAlive, 
			ulInLen, 
			(LPVOID)&outKeepAlive, 
			ulOutLen, 
			&ulBytesReturn, 
			NULL, 
			NULL); 
	if(SOCKET_ERROR == nRet) 
		return 0; 
	return result;
}
