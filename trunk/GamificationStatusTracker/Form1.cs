using System;
using System.Windows.Forms;
using Quartz;
using Quartz.Impl;

namespace GamificationStatusTracker
{
    public partial class Form1 : Form
    {
        private readonly TrackerController _trackerController = new TrackerController();
        public IScheduler Scheduler { get; set; }

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            InitService();
        }

        private void InitService()
        {
            try
            {
                StartScheduler();
                StartJobs();
            }
            catch (Exception exc)
            {

            }
        }

        private void StartScheduler()
        {
            
                ISchedulerFactory schedFact = new StdSchedulerFactory();

                Scheduler = schedFact.GetScheduler();
                Scheduler.Start();
           
            
        }

        private void StartJobs()
        {



            _trackerController.Start(Scheduler);




        }
    }
}
