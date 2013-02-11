using System;
using System.Globalization;
using GamificationPortal.App;

namespace GamificationPortal.Controls
{
    public partial class CaptainStatistics : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var missionsDal = new MissionsDal();
            lblCrewNumber.Text = (new UsersDal()).GetUsersCount().ToString(CultureInfo.InvariantCulture);
            lblInProgressMissionsCount.Text = missionsDal.GetMissionsCountByStatus(MissionStatus.InProgress).ToString(CultureInfo.InvariantCulture);
            lblCompletedMissions.Text = missionsDal.GetMissionsCountByStatus(MissionStatus.Completed).ToString(CultureInfo.InvariantCulture);

            var stageDate = (new StagesDal()).GetNextStageDate();
            if (stageDate != null)
            {
                lblNextStageDate.Text = ((DateTime) stageDate).ToLongDateString();
            }
            else
            {
                lblNextStageDate.Text = "Not Available";    
            }
            
        }
    }
}