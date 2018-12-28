using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Net;
using System.Net.Sockets;

namespace TestDlg
{
    class NetConnect
    {
        public bool connect(string ip, int port, string user, string passwd, string msg)
        {
            //ip地址
            IPAddress ip_address = IPAddress.Parse(ip);
            IPEndPoint point = new IPEndPoint(ip_address, port);
            //IPHostEntry host = Dns.GetHostByName("blog.csdn.net");
             try
            {
                using (Socket sock = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp))
                {
                    sock.Connect(point);
                    if (sock.Connected)
                    {
                        //MessageBox.Show("连接成功!" + " 客户端:" + sock.LocalEndPoint.ToString());
                        //byte[] buffer = Encoding.UTF8.GetBytes("login\r\nzgb\r\n123456\r\n");
                        //byte[] buffer = Encoding.Unicode.GetBytes("login\r\nzgb\r\n123456\r\n");
                        //byte[] buffer = Encoding.ASCII.GetBytes("login\r\nzgb\r\n123456\r\n");                        
                        byte[] data = Encoding.Default.GetBytes("login\r\nzgb\r\n123456\r\n");
                       
                        byte[] result = new byte[data.Length + 1];
                        result[0] = 1;
                        Buffer.BlockCopy(data, 0, result, 1, data.Length);
                       // sock.Send(result, 0, result.Length, SocketFlags.None);


                      // byte[] buffer = Encoding.ASCII.GetBytes("check_rw\r\n share_gid\r\nuser\r\npass");
                        sock.Send(data);
                        //sock.s
                    }
                   
                    sock.Close();
                }
            }
            catch (SocketException ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
            return true;


        }
    }
}
