using System;
using System.Globalization;
using DevExpress.Web.ASPxGridView;
using GamificationPortal.Account;
using GamificationPortal.App;

namespace GamificationPortal.Controls
{
    public partial class UsersMissions : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dal = new MissionsDal();

            lblNumberOfCompletedMission.Text = dal.GetMissionsCountByUserAndRule(AuthProvider.UserKey(Session), 1).ToString(CultureInfo.InvariantCulture);
            lblNumberOfCompletedInCurrentStage.Text = dal.GetMissionsCountByUserAndRule(AuthProvider.UserKey(Session), 1).ToString(CultureInfo.InvariantCulture);

            GridViewInProgress.DataSource = dal.GetMissionsListByUserAndStatus(AuthProvider.UserKey(Session),
                                                                  MissionStatus.InProgress);
            GridViewInProgress.DataBind();

            GridViewUnderReview.DataSource = dal.GetMissionsListByUserAndStatus(AuthProvider.UserKey(Session),
                                                                  MissionStatus.Submited);
            GridViewUnderReview.DataBind();

            GridViewCompleted.DataSource = dal.GetMissionsListByUserAndStatus(AuthProvider.UserKey(Session),
                                                                  MissionStatus.Completed);
            GridViewCompleted.DataBind();

            GridViewFailed.DataSource = dal.GetMissionsListByUserAndStatus(AuthProvider.UserKey(Session),
                                                                  MissionStatus.Failed);
            GridViewFailed.DataBind();
        }

        protected void GridViewInProgress_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

        }

        protected void GridViewInProgress_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            e.ExceptionHandled = true;
        }

        protected object GetComplexity(GridViewDataItemTemplateContainer container)
        {
            
         
            //    Quote quote = (Quote)grid.GetRow(container.VisibleIndex);
            return ""; //String.Format("Images/{0}.gif", quote.Change > 0 ? "Up" : "Down");
        }
        

       
    }
}