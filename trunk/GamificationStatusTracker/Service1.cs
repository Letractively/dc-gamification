using System;
using System.ServiceProcess;
using Quartz;
using Quartz.Impl;

namespace GamificationStatusTracker
{
    public partial class Service1 : ServiceBase
    {
        private TrackerController _trackerController;
        public IScheduler Scheduler { get; set; }

        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            StartScheduler();
            StartJobs();
        }

        protected override void OnStop()
        {
            base.OnStop();

            if (null != Scheduler)
            {
                Scheduler.Shutdown(true);
            }
        }

        private void StartScheduler()
        {
            try
            {
                ISchedulerFactory schedFact = new StdSchedulerFactory();

                Scheduler = schedFact.GetScheduler();
                Scheduler.Start();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void StartJobs()
        {

            try
            {
                _trackerController = new TrackerController();
                _trackerController.Start(Scheduler);


            }
            catch (Exception ex)
            {
                throw;
            }

        }
    }
}
