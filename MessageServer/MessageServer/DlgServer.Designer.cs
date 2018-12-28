namespace MessageServer
{
    partial class DlgServer
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.but_start = new System.Windows.Forms.Button();
            this.text_ip = new System.Windows.Forms.TextBox();
            this.text_port = new System.Windows.Forms.TextBox();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.but_send = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // but_start
            // 
            this.but_start.Location = new System.Drawing.Point(12, 12);
            this.but_start.Name = "but_start";
            this.but_start.Size = new System.Drawing.Size(75, 23);
            this.but_start.TabIndex = 0;
            this.but_start.Text = "启动服务";
            this.but_start.UseVisualStyleBackColor = true;
            this.but_start.Click += new System.EventHandler(this.but_start_Click);
            // 
            // text_ip
            // 
            this.text_ip.Location = new System.Drawing.Point(94, 13);
            this.text_ip.Name = "text_ip";
            this.text_ip.Size = new System.Drawing.Size(217, 21);
            this.text_ip.TabIndex = 1;
            // 
            // text_port
            // 
            this.text_port.Location = new System.Drawing.Point(335, 13);
            this.text_port.Name = "text_port";
            this.text_port.Size = new System.Drawing.Size(75, 21);
            this.text_port.TabIndex = 2;
            // 
            // richTextBox1
            // 
            this.richTextBox1.Location = new System.Drawing.Point(11, 58);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(403, 262);
            this.richTextBox1.TabIndex = 3;
            this.richTextBox1.Text = "";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 336);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 12);
            this.label1.TabIndex = 4;
            this.label1.Text = "选择客户端";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(87, 331);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(224, 20);
            this.comboBox1.TabIndex = 5;
            // 
            // but_send
            // 
            this.but_send.Location = new System.Drawing.Point(323, 331);
            this.but_send.Name = "but_send";
            this.but_send.Size = new System.Drawing.Size(87, 23);
            this.but_send.TabIndex = 6;
            this.but_send.Text = "发送消息";
            this.but_send.UseVisualStyleBackColor = true;
            this.but_send.Click += new System.EventHandler(this.but_send_Click);
            // 
            // DlgServer
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(427, 369);
            this.Controls.Add(this.but_send);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.text_port);
            this.Controls.Add(this.text_ip);
            this.Controls.Add(this.but_start);
            this.Name = "DlgServer";
            this.Text = "Server";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button but_start;
        private System.Windows.Forms.TextBox text_ip;
        private System.Windows.Forms.TextBox text_port;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Button but_send;
    }
}

