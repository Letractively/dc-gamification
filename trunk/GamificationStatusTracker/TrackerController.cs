using System;
using System.Data;
using System.DirectoryServices;
using System.Net;
using System.Net.Mail;
using Quartz;

namespace GamificationStatusTracker
{
    internal class TrackerController : IStatefulJob
    {
        readonly TrackerDal _dal = new TrackerDal();

        internal void Start(Quartz.IScheduler scheduler)
        {
            Register(scheduler);
        }

        private static void Register(IScheduler scheduler)
        {
            var jobDetail = new JobDetail("GamificationCheckStatusJob", null, typeof(TrackerController));
            Trigger trigger = TriggerUtils.MakeMinutelyTrigger(30);
            trigger.Name = "GamificationCheckStatus";
            scheduler.ScheduleJob(jobDetail, trigger);
        }

        public void Execute(JobExecutionContext context)
        {
            CheckMissionsDeadLine();
        }

        private void CheckMissionsDeadLine()
        {
            var missionsList = _dal.GetListFailedMission();
            if (missionsList.Tables.Count > 0 && missionsList.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow row in missionsList.Tables[0].Rows)
                {
                 //   var ownerName = row.ItemArray[3].ToString();
                    var ownerLogin = row.ItemArray[3].ToString();
                    var mail = GetMailByLogin(ownerLogin);
                    if (row.ItemArray[4].ToString() == "Failed")
                    {
                        SendMail(mail, "Your mission has been failed", "Your mission has been failed");
                    }
                    else
                    {
                        SendMail(mail, "Your mission has been canceled", "Your mission has been canceled");
                    }
                }
            }
        }

       

        private void SendMail(string mailTo, string title, string messageBody)
        {
            MailAddress from = new MailAddress("ssadur@softserveinc.com");
            MailAddress to = new MailAddress(mailTo);
            MailMessage message = new MailMessage(from, to);
            message.Subject = title;
            message.Body = messageBody;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.softservecom.com";
            client.EnableSsl = false;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("ssadur", "Fkg7h4f3v6", "SOFTSERVE");

            client.Send(message); 
        }

        public static string GetMailByLogin(string login)
        {
            // Parse the string to check if domain name is present.
            int idx = login.IndexOf('\\');
            if (idx == -1)
            {
                idx = login.IndexOf('@');
            }

            string strName = idx != -1 ? login.Substring(idx + 1) : login;


            const string connection = "LDAP://softserveinc.com";
            var dssearch = new DirectorySearcher(connection) { Filter = "(sAMAccountName=" + strName + ")" };
            var sresult = dssearch.FindOne();

            DirectoryEntry dsresult = sresult.GetDirectoryEntry();
           
            return  dsresult.Properties["mail"][0].ToString();


        }
    }
}
