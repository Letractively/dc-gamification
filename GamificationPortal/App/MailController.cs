using System.Net;
using System.Net.Mail;
using System.Net.Mime;

namespace GamificationPortal.App
{
    public class MailController
    {
        public static void NotifyMissionOwnerMissionCompleted(int missionId, string completedBy)
        {
            var missionDal = new MissionsDal();
            string ownerLogin = missionDal.GetMissionOwnerLoginName(missionId);
            string missionName = missionDal.GetMissionName(missionId);
            var ownerMail = Account.AuthProvider.GetMailByLogin(ownerLogin);
            var ownerName = Account.AuthProvider.GetUserFullNameByDomainIdentity(ownerLogin);
            SendMail(ownerMail, "Your mission has been completed", string.Format(MailTemplates.MissionCompleted, ownerName, completedBy, missionName));

        }

        public static void NotifyMissionOwnerMissionWasTaken(int missionId, string takenBy)
        {
            var missionDal = new MissionsDal();
            string ownerLogin = missionDal.GetMissionOwnerLoginName(missionId);
            string missionName = missionDal.GetMissionName(missionId);
            var ownerMail = Account.AuthProvider.GetMailByLogin(ownerLogin);
            var ownerName = Account.AuthProvider.GetUserFullNameByDomainIdentity(ownerLogin);
            SendMail(ownerMail, "Your mission was taken for completion", string.Format(MailTemplates.MissionTakenForCompletion, ownerName, takenBy, missionName));

        }

        public static void SendMail(string mailTo, string title, string messageBody)
        {
            MailAddress from = new MailAddress("ssadur@softserveinc.com");
            MailAddress to = new MailAddress(mailTo);
            MailMessage message = new MailMessage(from, to);
            message.Subject = title;
            message.IsBodyHtml = true;

            string contentId = "image1";
           // string path = Server.MapPath(@"Images/layout/theme/mailPageBg.jpg"); // my logo is placed in images folder
          //  LinkedResource bg = new LinkedResource(path);
//            bg.ContentId = "supportPageBg";

            AlternateView av1 = AlternateView.CreateAlternateViewFromString(messageBody, null, MediaTypeNames.Text.Html);
       //     av1.LinkedResources.Add(bg);


            message.AlternateViews.Add(av1);
            //  message.Body = messageBody;


            SmtpClient client = new SmtpClient();
            client.Host = "smtp.softservecom.com";
            client.EnableSsl = false;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("ssadur", "Fkg7h4f3v6", "SOFTSERVE");

            client.Send(message);
        }
    }
}