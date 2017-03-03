using System.Diagnostics;
using System.Runtime.InteropServices;
using System;
using System.Media;
using System.Text;
using System.Threading;

namespace Titan_R3A_Tool
{
    class CC
    {
        private static string ProcName = "ra3_1.12.game";
        private static IntPtr pHandle = IntPtr.Zero;
        [System.Runtime.InteropServices.DllImport("kernel32.dll", SetLastError = true)]
        static extern bool WriteProcessMemory(IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, int nSize, out IntPtr lpNumberOfBytesWritten);
        [System.Runtime.InteropServices.DllImport("kernel32.dll", SetLastError = true)]
        static extern bool ReadProcessMemory(IntPtr hProcess, IntPtr lpBaseAddress, [System.Runtime.InteropServices.Out] byte[] lpBuffer, int dwSize, out IntPtr lpNumberOfBytesRead);
        


        public class Write
        {
            public static void _Int16(Int64 Address, Int16 Value)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt;
                    WriteProcessMemory(pHandle, new IntPtr(Address), BitConverter.GetBytes(Value), sizeof(Int16), out retByt);
                }
            }
            public static void _Int32(Int64 Address, Int32 Value)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt;
                    WriteProcessMemory(pHandle, new IntPtr(Address), BitConverter.GetBytes(Value), sizeof(Int32), out retByt);
                }
            }
            public static void _Int64(long Address, long Value)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt;
                    WriteProcessMemory(pHandle, new IntPtr(Address), BitConverter.GetBytes(Value), sizeof(long), out retByt);
                }
            }
            public static void _Float(Int64 Address, Single Float)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt;
                    WriteProcessMemory(pHandle, new IntPtr(Address), BitConverter.GetBytes(Float), sizeof(Single), out retByt);
                }
            }
            public static void _String(Int64 Address, String Value)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt;
                    WriteProcessMemory(pHandle, new IntPtr(Address), ASCIIEncoding.ASCII.GetBytes(Value), sizeof(Int64), out retByt);
                }
            }
            public static void _Bytes(Int64 Address, byte[] Value)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt;
                    WriteProcessMemory(pHandle, new IntPtr(Address), Value, Value.Length, out retByt);
                }
            }
        }
        public class Read
        {
            public static Int16 _Int16(Int64 Address)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt; Byte[] buffer = new Byte[sizeof(Int16)];
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, sizeof(Int16), out retByt);
                    return BitConverter.ToInt16(buffer, 0);
                }
                else return 0;
            }
            public static Int32 _Int32(Int64 Address)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt; Byte[] buffer = new Byte[sizeof(Int32)];
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, sizeof(Int32), out retByt);
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, sizeof(Int32), out retByt);
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, sizeof(Int32), out retByt);
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, sizeof(Int32), out retByt);
                    return BitConverter.ToInt32(buffer, 0);
                }
                else
                {
                    IntPtr retByt; Byte[] buffer = new Byte[sizeof(Int32)];
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, sizeof(Int32), out retByt);
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, sizeof(Int32), out retByt);
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, sizeof(Int32), out retByt);
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, sizeof(Int32), out retByt);

                    return BitConverter.ToInt32(buffer, 0);
                }


            }
            public static Int64 _Int64(Int64 Address)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt; Byte[] buffer = new Byte[sizeof(Int32)];
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, sizeof(Int32), out retByt);
                    return BitConverter.ToInt32(buffer, 0);
                }
                else return 0;
            }
            public static Single _Float(Int64 Address)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt; Byte[] buffer = new Byte[sizeof(Single)];
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, sizeof(Single), out retByt);
                    return BitConverter.ToSingle(buffer, 0);
                }
                else return 0;
            }
            public static String _String(Int64 Address, Int32 _Length)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt; Byte[] buffer = new Byte[_Length];
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, _Length, out retByt);
                    return ASCIIEncoding.ASCII.GetString(buffer);
                }
                else return "";
            }
            public static Byte[] _Bytes(Int64 Address, Int32 _Size)
            {
                if (System.Diagnostics.Process.GetProcessesByName(ProcName).Length != 0)
                {
                    IntPtr retByt; Byte[] buffer = new Byte[_Size];
                    ReadProcessMemory(pHandle, new IntPtr(Address), buffer, _Size, out retByt);
                    return buffer;
                }
                else return new byte[0];
            }
        }
    }
}
