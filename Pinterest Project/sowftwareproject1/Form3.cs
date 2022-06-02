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
    public partial class Form3 : Form
    {
        string ordb = "Data source=orcl;User Id=scott;Password=tiger;";
        OracleDataAdapter adapter;
        OracleConnection conn;
        DataSet ds;
        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            conn.Open();
            OracleCommand c = new OracleCommand();
            c.Connection = conn;
            c.CommandText = "select Board_Name from Pin where Pin_Name =:pname";
            c.CommandType = CommandType.Text;
            c.Parameters.Add("pname", comboBox1.Text);
            OracleDataReader dr = c.ExecuteReader();
            if (dr.Read())
            {
                textBox2.Text = dr[0].ToString();

            }
            dr.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string constr = "Data source=orcl;User Id=scott;Password=tiger;";
            string cmdstr = @"select Board_Name , User_ID , Description ,board_ID,Category_ID
                                from Board  where Board_Name =: board_name ";
            adapter = new OracleDataAdapter(cmdstr, constr);
            adapter.SelectCommand.Parameters.Add("board_name", textBox2.Text);
            ds = new DataSet();
            adapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button3_Click(object sender, EventArgs e)
        {
            OracleCommandBuilder builder = new OracleCommandBuilder(adapter);
            adapter.Update(ds.Tables[0]);
            MessageBox.Show("New data has been successfully saved!");

        }

        private void Form3_Load(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            conn.Open();
        }

        private void button4_Click_1(object sender, EventArgs e)
        {
            OracleCommand c = new OracleCommand();
            c.Connection = conn;
            c.CommandText = "Get_pin_name";
            c.CommandType = CommandType.StoredProcedure;
            c.Parameters.Add("pin_name", OracleDbType.RefCursor, ParameterDirection.Output);
            OracleDataReader dr = c.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr[0]);
            }
            dr.Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Form1 f = new Form1();
            f.Show();
        }
    }
}
