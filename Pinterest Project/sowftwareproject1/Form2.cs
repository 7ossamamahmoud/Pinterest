using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace sowftwareproject1
{
    public partial class Form2 : Form
    {
        string ordb = "Data source=orcl;User Id=scott;Password=tiger;";
        OracleConnection conn;
        public Form2()
        {
            InitializeComponent();
        }

        private void user_ID_TextChanged(object sender, EventArgs e)
        {


        }

        private void button1_Click(object sender, EventArgs e)
        {
            OracleCommand c = new OracleCommand();
            c.Connection = conn;
            c.CommandText = "insert into Sys_User values (:User_ID,:User_Name,:User_Email,:User_Password)";
            c.Parameters.Add("User_ID", user_ID.Text);
            c.Parameters.Add("User_Name", user_name.Text);
            c.Parameters.Add("User_Email", textBox2.Text);
            c.Parameters.Add("User_Password", textBox1.Text);
            int r = c.ExecuteNonQuery();
            if (r != -1)
            {

                MessageBox.Show("New account has been successfully created");

            }


        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form1 f = new Form1();
            f.Show();
        }

        private void Form2_Load(object sender, EventArgs e)
        {

            conn = new OracleConnection(ordb);
            conn.Open();
            int id, maxid;
            OracleCommand c = new OracleCommand();
            c.Connection = conn;
            c.CommandText = "Getuserid";
            c.CommandType = CommandType.StoredProcedure;
            c.Parameters.Add("id", OracleDbType.Int32, ParameterDirection.Output);
            c.ExecuteNonQuery();
            try
            {
                maxid = Convert.ToInt32(c.Parameters["id"].Value.ToString());
                id = maxid + 1;
            }
            catch
            {
                id = 1;
            }
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            conn.Open();
            int id, maxid;
            OracleCommand c = new OracleCommand();
            c.Connection = conn;
            c.CommandText = "Getuserid";
            c.CommandType = CommandType.StoredProcedure;
            c.Parameters.Add("id", OracleDbType.Int32, ParameterDirection.Output);
            c.ExecuteNonQuery();
            try
            {
                maxid = Convert.ToInt32(c.Parameters["id"].Value.ToString());
                id = maxid + 1;
                user_ID.Text = id.ToString();
            }
            catch
            {
                id = 1;
                user_ID.Text = id.ToString();
            }
        }
    }
}
