using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Net;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class Form1 : Form
    {
        private const string _12ID_URL = "https://12id.eu/p/embed$?redirect_uri=http://localhost:80/&client_id=test";

        public Form1()
        {
            InitializeComponent();
            this.ClientSize = new System.Drawing.Size(400, 400);
            this.Text = "Auth";
            this.textBox1.Text = "Connecting to server...";
        }

        private void Form1_Load(object sender, System.EventArgs ea)
        {
            this.textBox1.Text = "";

            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                using (WebClient client = new WebClient())
                {
                    string[] s = System.Text.Encoding.UTF8.GetString(client.DownloadData(_12ID_URL)).Split(new char[] { '\n' });
                    string l = s[0], url = s[1];
                    for (int i = 2; i < s.Length; this.textBox1.Text += (s[i++] + "\r\n"));
                    this.textBox1.Text += (l + "\r\n");

                    new Thread(() =>
                    {
                        while ((l = client.DownloadString(url)).Length == 0)
                        {
                            Thread.Sleep(1000);
                            this.textBox1.Text +=  '.';
                        }
                        this.textBox1.Text += "\r\n";
                        this.textBox1.Text += "R: " + l;

                        Thread.CurrentThread.IsBackground = true;
                    }).Start();
                }
            } catch(WebException wex)
            {
                string responseStr = "Error: " + wex.Message;
                this.textBox1.Text += "\n" + responseStr;
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
