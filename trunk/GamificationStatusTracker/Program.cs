using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GamificationStatusTracker
{
    static class Program
    {
        [DllImport("Kernel32.dll")]
        private static extern IntPtr GetConsoleWindow();
        [DllImport("user32.dll")]
        private static extern Boolean ShowWindow(IntPtr hWnd, Int32 nCmdShow);
        private const Int32 SW_HIDE = 0;
        private static Mutex _mutex;

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            ServiceBase[] servicesToRun;
           
            bool newMutex;
            try
            {
                _mutex = new Mutex(true, @"Global\" + System.Reflection.Assembly.GetExecutingAssembly().GetName().Name, out newMutex);
            }
            catch (UnauthorizedAccessException)
            {
                ShowWarningMessage();
                return;
            }
            if (!newMutex)
            {
                ShowWarningMessage();
                return;
            }

            if (IsWindowsApp(args))
            {
                HideConsole();
                InitializeApplication();
                Application.Run(new Form1());
            }
            else if (IsHelpRequest(args))
            {
                Console.WriteLine("Help Text");
            }
            else
            {
                HideConsole();
                servicesToRun = new ServiceBase[] 
                                                  { 
                                                       new Service1() 
                                                  };
                ServiceBase.Run(servicesToRun);
            }
            if (null != _mutex)
            {
                _mutex.ReleaseMutex();
            }
        }

        private static void HideConsole()
        {
            IntPtr hwnd = GetConsoleWindow();
            ShowWindow(hwnd, SW_HIDE);
        }

        private static void ShowWarningMessage()
        {
            MessageBox.Show("The DC Dafimication Status Tracker is already running!", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private static bool IsWindowsApp(string[] args)
        {
            if (args.Length == 0)
                return false;

            return args.Any(arg => arg.ToUpperInvariant().Contains("APP"));
        }

        private static bool IsHelpRequest(string[] args)
        {
            if (args.Length == 0)
                return false;

            return args.Any(arg => arg.ToUpperInvariant().Contains("?"));
        }

        private static void InitializeApplication()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.ThreadException += Application_ThreadException;
        }

        static void Application_ThreadException(object sender, ThreadExceptionEventArgs e)
        {

        }
    }
}
