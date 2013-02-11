using System;
using System.Globalization;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using GamificationPortal.Account;
using GamificationPortal.App;

namespace GamificationPortal.Controls
{
    public partial class CurrentMission : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
         
              // SendMail("ssadur@softserveinc.com", "Your Mission has been completed", string.Format(MailTemplates.MissionCompleted, "ssadur"));
        }

        private void LoadData()
        {
            var dal = new MissionsDal();
           Mission curMission = dal.GetMissionCurrentByUser(AuthProvider.UserKey(Session));
            if (curMission != null)
            {
                lblCurrentMissionName.Text = curMission.Name;
                lblCurrentMissionDescr.Text = curMission.Description;
                lblReward.Text = curMission.Reward.ToString(CultureInfo.InvariantCulture);
                lblSkillsRequired.Text = curMission.SkillsRequired;
                rcMissionRatingValue.Value = curMission.Complexity;
                lblOwner.Text = curMission.Owner;
                ProgressBarCurrentMission.Minimum = 0;
                var totalDays = curMission.EndDate.Subtract(curMission.StartDate).Days;
                ProgressBarCurrentMission.Maximum = totalDays;
               // ProgressBarCurrentMission.Position = curMission.EndDate.Subtract(DateTime.Now).Days + 1;
                lblEndDate.Text = curMission.EndDate.ToShortDateString();
                tbMissionId.Value = curMission.MissionId.ToString(CultureInfo.InvariantCulture);
            }
            else
            {
                tblCurrentMissionInfo.Visible = false;
                NoDataAvailableMessage.Visible = true;
                tbMissionId.Value = string.Empty;

            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            (new MissionsDal()).DropCurrentMission(AuthProvider.UserKey(Session));
            LoadData();
        }

        protected void btnCompleteMission_Click(object sender, EventArgs e)
        {
            (new MissionsDal()).SubmitCurrentMission(Convert.ToInt32(tbMissionId.Value), AuthProvider.UserKey(Session));
            string completedBy = AuthProvider.GetUserFullName(Session);
            MailController.NotifyMissionOwnerMissionCompleted(Convert.ToInt32(tbMissionId.Value), completedBy);
            LoadData();
           
        }

       

       
    }
}