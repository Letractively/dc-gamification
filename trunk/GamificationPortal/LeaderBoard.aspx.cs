using System;
using GamificationPortal.Account;
using GamificationPortal.App;

namespace GamificationPortal
{
    public partial class LeaderBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dal = new UsersDal();
            GridViewMLeaderBoard.DataSource = dal.GetUserLeaderBordList();
            GridViewMLeaderBoard.DataBind();
            pbStageProgress.Value = (new StagesDal()).GetCurrentStageProgress();

            var devLeader = dal.GetStageLeader("Software Engineering");
            var qcLeader = dal.GetStageLeader("Quality Control");
            var twLeader = dal.GetStageLeader("Technical Communication");

            if (devLeader != null && devLeader.Tables.Count > 0 && devLeader.Tables[0].Rows.Count > 0)
            {
                LeaderPreviewDev.Title = "Software Engineering";
                LeaderPreviewDev.UserName = devLeader.Tables[0].Rows[0].ItemArray[6].ToString();
                LeaderPreviewDev.UserFullName = devLeader.Tables[0].Rows[0].ItemArray[0].ToString();
                LeaderPreviewDev.ImageUrl = devLeader.Tables[0].Rows[0].ItemArray[1].ToString();
                LeaderPreviewDev.EmblemUrl = devLeader.Tables[0].Rows[0].ItemArray[2].ToString();
                LeaderPreviewDev.CountMissionsDoneByUser = Convert.ToInt32(devLeader.Tables[0].Rows[0].ItemArray[3]);
                LeaderPreviewDev.MissionsOnStage = Convert.ToInt32(devLeader.Tables[0].Rows[0].ItemArray[4]);
                LeaderPreviewDev.PercentageOfWork = Convert.ToDecimal(devLeader.Tables[0].Rows[0].ItemArray[5]);
                LeaderPreviewDev.UserName = devLeader.Tables[0].Rows[0].ItemArray[6].ToString();
            }

            if (qcLeader != null && qcLeader.Tables.Count > 0 && qcLeader.Tables[0].Rows.Count > 0)
            {
                LeaderPreviewQC.Title = "Quality Control";
                LeaderPreviewQC.UserName = qcLeader.Tables[0].Rows[0].ItemArray[6].ToString();
                LeaderPreviewQC.UserFullName = qcLeader.Tables[0].Rows[0].ItemArray[0].ToString();
                LeaderPreviewQC.ImageUrl = qcLeader.Tables[0].Rows[0].ItemArray[1].ToString();
                
                LeaderPreviewQC.EmblemUrl = qcLeader.Tables[0].Rows[0].ItemArray[2].ToString();
                LeaderPreviewQC.CountMissionsDoneByUser = Convert.ToInt32(qcLeader.Tables[0].Rows[0].ItemArray[3]);
                LeaderPreviewQC.MissionsOnStage = Convert.ToInt32(qcLeader.Tables[0].Rows[0].ItemArray[4]);
                LeaderPreviewQC.PercentageOfWork = Convert.ToDecimal(qcLeader.Tables[0].Rows[0].ItemArray[5]);
            }

            if (twLeader != null && twLeader.Tables.Count > 0 && twLeader.Tables[0].Rows.Count > 0)
            {
                LeaderPreviewTW.Title = "Technical communication";
                LeaderPreviewTW.UserName = twLeader.Tables[0].Rows[0].ItemArray[6].ToString();
                LeaderPreviewTW.UserFullName = twLeader.Tables[0].Rows[0].ItemArray[0].ToString();
                LeaderPreviewTW.ImageUrl = twLeader.Tables[0].Rows[0].ItemArray[1].ToString();
                LeaderPreviewTW.EmblemUrl = twLeader.Tables[0].Rows[0].ItemArray[2].ToString();
                LeaderPreviewTW.CountMissionsDoneByUser = Convert.ToInt32(twLeader.Tables[0].Rows[0].ItemArray[3]);
                LeaderPreviewTW.MissionsOnStage = Convert.ToInt32(twLeader.Tables[0].Rows[0].ItemArray[4]);
                LeaderPreviewTW.PercentageOfWork = Convert.ToDecimal(twLeader.Tables[0].Rows[0].ItemArray[5]);
            }
        }

        protected string FormatUrl(object bind, object userName)
        {
            if (!string.IsNullOrEmpty(bind.ToString()))
            {
                return string.Format("~/Images/Users/{0}/{1}", AuthProvider.GetNameWithoutDomain(userName.ToString()), bind);
            }
            return "~/Images/EmptyImage.png";
        }
    }
}