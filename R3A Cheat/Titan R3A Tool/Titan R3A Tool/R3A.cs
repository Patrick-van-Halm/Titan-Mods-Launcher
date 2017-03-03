using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Threading;

namespace Titan_R3A_Tool
{
    public partial class R3A : Form
    {
        DevTool devTool;
        int data;
        int aFunds;
        int pPoints;
        InfoForm infoForm;


        public R3A()
        {
            InitializeComponent();
        }

        private async void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            devTool = new DevTool("ra3_1.12.game");
            long baseAddress = Process.GetProcessesByName("ra3_1.12.game")[0].MainModule.BaseAddress.ToInt64();
            data = devTool.Read(baseAddress + 0x8D7B78);
            data = devTool.Read(data);
            data = devTool.Read(data + 0x3C0);
            aFunds = data + 0x4;

            do
            {
                devTool.WriteInt(aFunds, 10000);
                await Task.Delay(800);
            } while (UF.Checked);
        }
        private async void UPP_CheckedChanged(object sender, EventArgs e)
        {
            devTool = new DevTool("ra3_1.12.game");
            long baseAddress = Process.GetProcessesByName("ra3_1.12.game")[0].MainModule.BaseAddress.ToInt64();
            data = devTool.Read(baseAddress + 0x008D8CE4);
            data = devTool.Read(data + 0x88);
            data = devTool.Read(data + 0x70);
            data = devTool.Read(data + 0x9C);
            data = devTool.Read(data + 0x30);
            pPoints = data + 0x34;

            do
            {
                devTool.WriteInt(pPoints, 10);
                await Task.Delay(800);
            } while (UPP.Checked);
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            infoForm = new InfoForm();
            infoForm.Show();
        }
    }
}
