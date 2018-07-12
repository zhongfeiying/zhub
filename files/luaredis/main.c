#include <windows.h>
#include "include/lua.h"
#include "include/lauxlib.h"
#include "net.h"
static int new_redis(lua_State* L)
{
	const char* server = lua_tostring(L,1);
	int portno = lua_tointeger(L,2);
	REDIS redis = (REDIS)lua_newuserdata(L,sizeof(struct _redis_type_));
	memset(redis,0,sizeof(struct _redis_type_));
	if(connect_server(&redis->s,server,portno) == 0){
		close_redis(redis);
		lua_pop(L,1);
		return 0;
	}
	redis_keep_alive(redis);
	luaL_getmetatable(L,"rei.redis");
	lua_setmetatable(L,-2);
	return 1;
}
static int info(lua_State* L)
{
	char* buf = (char*)calloc(MAX_REDIS,sizeof(char));
	REDIS redis = (REDIS)lua_touserdata(L,1);
	redis_info(redis,buf);
	lua_pushstring(L,buf);
	free(buf);
	return 1;
}
static int close(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	close_redis(redis);
	return 0;
}
static int ping(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	int result = redis_ping(redis);
	lua_pushinteger(L,result);
	return 1;
}
static int del(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* key = lua_tostring(L,2);
	int result = redis_del(redis,key);
	return 1;
}
static int hdel(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* key = lua_tostring(L,2);
	const char* field = lua_tostring(L,3);
	int result = redis_hdel(redis,key,field);
	return 1;
}
static int get(lua_State* L)
{
	char* buf = (char*)calloc(MAX_REDIS,sizeof(char));
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* key = lua_tostring(L,2);
	int result = redis_get(redis,key,buf);
	lua_pushstring(L,buf);
	lua_pushinteger(L,result);
	free(buf);
	return 2;
}
static int incr(lua_State* L)
{
	char error[MAX_REDIS_STR] = {0};
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* key = lua_tostring(L,2);
	int result = redis_incr(redis,key,error);
	lua_pushinteger(L,result);
	lua_pushstring(L,error);
	return 2;
}
static int set(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* key = lua_tostring(L,2);
	const char* value = lua_tostring(L,3);
	int result = redis_set(redis,key,value);
	lua_pushinteger(L,result);
	return 1;
}
static int hset(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* key = lua_tostring(L,2);
	const char* field = lua_tostring(L,3);
	const char* value = lua_tostring(L,4);
	int result = redis_hset(redis,key,field,value);
	lua_pushinteger(L,result);
	return 1;
}
static int hkeys(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* key = lua_tostring(L,2);
	int result = redis_hkeys(redis,key);
	lua_pushinteger(L,result);
	return 1;
}
static int hget(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* key = lua_tostring(L,2);
	const char* field = lua_tostring(L,3);
	char* value = (char*)calloc(MAX_REDIS,sizeof(char));
	int result = redis_hget(redis,key,field,value);
	lua_pushstring(L,value);
	lua_pushinteger(L,result);
	free(value);
	return 2;
}
static int getline_imp(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	int size = lua_tointeger(L,2);
	char* out = (char*)calloc(size,sizeof(char));
	char* rs = redis_getline(redis,out,size);
	if(rs)
		lua_pushstring(L,rs);
	else
		lua_pushnil(L);
	free(out);
	return 1;
}
static int hgetall(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* key = lua_tostring(L,2);
	int result = redis_hgetall(redis,key);
	lua_pushinteger(L,result);
	return 1;
}
static int hincr(lua_State* L)
{
	char error[MAX_REDIS_STR] = {0};
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* key = lua_tostring(L,2);
	const char* field = lua_tostring(L,3);
	int result = redis_hincr(redis,key,field,error);
	lua_pushinteger(L,result);
	lua_pushstring(L,error);
	return 2;
}
static int subscribe(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	int result = redis_subscribe(redis);
	lua_pushinteger(L,result);
	return 1;
}
static int timeout(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	int interval = lua_tonumber(L,2);
	settimeout(redis,interval);
	return 0;
}
static int apcmd(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* cmd = lua_tostring(L,2);
	ap_cmd(redis,cmd);
	return 0;
}
/*
static int aphelp(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	char out[MAX_REDIS_STR] = {0};
	char* result = ap_help(redis,out);
	if(result)
		lua_pushstring(L,result);
	return 1;
}
static int apls(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	const char* path = lua_tostring(L,2);
	if(path) ap_ls(redis,path);
	else ap_ls(redis,"./");
	return 0;
}
static int apquit(lua_State* L)
{
	REDIS redis = (REDIS)lua_touserdata(L,1);
	char out[MAX_REDIS_STR] = {0};
	char* result = ap_quit(redis,out);
	if(result)
		lua_pushstring(L,result);
	return 1;
}
*/
static const struct luaL_Reg luaredis_f[] = {
	{"new",new_redis},
	{NULL,NULL}
};
static const struct luaL_Reg luaredis_m[] = {
	{"info",info},
	{"close",close},
	{"ping",ping},
	{"set",set},
	{"get",get},
	{"incr",incr},
	{"del",del},
	{"hdel",hdel},
	{"hset",hset},
	{"hget",hget},
	{"hkeys",hkeys},
	{"hincr",hincr},
	{"hgetall",hgetall},
	{"getline",getline_imp},
	{"subscribe",subscribe},
	{"apcmd",apcmd},
	{"timeout",timeout},
	{NULL,NULL}
};
int luaopen_luaredis(lua_State *L){
	init_net();
	luaL_newmetatable(L,"rei.redis");
	lua_pushvalue(L,-1);
	lua_setfield(L,-2,"__index");
	luaL_register(L,NULL,luaredis_m);
//	lua_pop(L,1);
	luaL_register(L,"luaredis",luaredis_f);
	return 1;
};

