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
using CrystalDecisions.CrystalReports;
using CrystalDecisions.Shared;
namespace sowftwareproject1
{
    public partial class Form5 : Form
    {
        CrystalReport2 cr2;
        public Form5()
        {
            InitializeComponent();
        }

        private void crystalReportViewer1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form5_Load(object sender, EventArgs e)
        {
            cr2 = new CrystalReport2();
            foreach (ParameterDiscreteValue v2 in cr2.ParameterFields[0].DefaultValues)
                Board_ID.Items.Add(v2.Value);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            cr2.SetParameterValue(0, Board_ID.Text);
            crystalReportViewer1.ReportSource = cr2;
        }
    }
}
