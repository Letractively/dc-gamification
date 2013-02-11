using System;
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

            var devLeader = dal.GetStageLeader("Software Engineering");
            var qcLeader = dal.GetStageLeader("Quality Control");
            var twLeader = dal.GetStageLeader("Technial Communication");

            if (devLeader != null && devLeader.Tables.Count > 0 && devLeader.Tables[0].Rows.Count > 0)
            {
                LeaderPreviewDev.Title = "Software Engineering";
                LeaderPreviewDev.UserFullName = devLeader.Tables[0].Rows[0].ItemArray[0].ToString();
                LeaderPreviewDev.ImageUrl = devLeader.Tables[0].Rows[0].ItemArray[1].ToString();
            }

            if (qcLeader != null && qcLeader.Tables.Count > 0 && qcLeader.Tables[0].Rows.Count > 0)
            {
                LeaderPreviewQC.Title = "Quality Control";
                LeaderPreviewQC.UserFullName = qcLeader.Tables[0].Rows[0].ItemArray[0].ToString();
                LeaderPreviewQC.ImageUrl = qcLeader.Tables[0].Rows[0].ItemArray[1].ToString();
            }

            if (twLeader != null && twLeader.Tables.Count > 0 && twLeader.Tables[0].Rows.Count > 0)
            {
                LeaderPreviewTW.Title = "Technial Communication";
                LeaderPreviewTW.UserFullName = twLeader.Tables[0].Rows[0].ItemArray[0].ToString();
                LeaderPreviewTW.ImageUrl = twLeader.Tables[0].Rows[0].ItemArray[1].ToString();
            }
        }
    }
}