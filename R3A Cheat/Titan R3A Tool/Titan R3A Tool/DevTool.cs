using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace Titan_R3A_Tool
{
    class DevTool
    {
        [DllImport("kernel32.dll")]
        static extern IntPtr OpenProcess(ProcessAccessFlags dwDesiredAccess, [MarshalAs(UnmanagedType.Bool)] bool bInheritHandle, int dwProcessId);

        [DllImport("kernel32.dll", SetLastError = true)]
        static extern bool WriteProcessMemory(IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, uint nSize, out IntPtr lpNumberOfBytesWritten);
        [DllImport("kernel32.dll")]
        static extern bool ReadProcessMemory(IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, uint dwSize, out IntPtr lpNumberOfBytesRead);

        [DllImport("kernel32.dll")]
        public static extern Int32 CloseHandle(IntPtr hProcess);

        int pID;
        IntPtr pHandle;


        [Flags]
        public enum ProcessAccessFlags : uint
        {
            All = 0x001F0FFF,
            Terminate = 0x00000001,
            CreateThread = 0x00000002,
            VMOperation = 0x00000008,
            VMRead = 0x00000010,
            VMWrite = 0x00000020,
            DupHandle = 0x00000040,
            SetInformation = 0x00000200,
            QueryInformation = 0x00000400,
            Synchronize = 0x00100000
        }

        public DevTool(string name)
        {
            pID = Process.GetProcessesByName(name)[0].Id;
            pHandle = OpenProcess(ProcessAccessFlags.All, false, pID);
        }

        public int Read(long address)
        {
            byte[] buffer = new byte[sizeof(int)];
            IntPtr bytesRead;
            ReadProcessMemory(pHandle, new IntPtr(address), buffer, sizeof(int), out bytesRead);
            return BitConverter.ToInt32(buffer, 0);
        }

        public void WriteInt(long address, int value)
        {
            IntPtr bytesWrt;
            WriteProcessMemory(pHandle, new IntPtr(address), BitConverter.GetBytes(value), sizeof(int), out bytesWrt);
        }

    }
}
