using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TestDlg
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        static public double get_scale_std(double val)
        {
            //把传入值进行取整，按照10为一个单位
            double scale = 0;
            if (val <= 5)
                return 5;
            else if (val > 5 && val <= 10)
                return 10;
            else
            {
                val = val / 10;
                val = Math.Ceiling(val);
                scale = val * 10;
            }
            return scale; ;

        } 
        private void button1_Click(object sender, EventArgs e)
        {
            double scale = 0;
            scale = get_scale_std(0.1);
            scale = get_scale_std(2.1);
            scale = get_scale_std(6.5);
            scale = get_scale_std(11.52);
            scale = get_scale_std(24);
            scale = get_scale_std(19);
            scale = get_scale_std(45);
            scale = get_scale_std(30);
            scale = get_scale_std(92);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            NetConnect net = new NetConnect();
            net.connect("127.0.0.1", 8000, "zgb", "123456", "link server");
        }
    }
}
