using System;
using GamificationPortal.App;

namespace GamificationPortal.Controls
{
    public partial class ManageStages : System.Web.UI.UserControl
    {
        private readonly StagesDal _dal = new StagesDal();
        protected void Page_Load(object sender, EventArgs e)
        {
            ReloadData();
        }

        private void ReloadData()
        {
            gvStages.DataSource = _dal.GetStagesList();
            gvStages.DataBind();
        }

        protected void btnAddStage_Click(object sender, EventArgs e)
        {
            if (_dal.CheckDates(dateEditStartDate.Date, dateEditEndDate.Date))
            {
                _dal.InsertNewStage(tbDescription.Text, dateEditStartDate.Date, dateEditEndDate.Date);
                ReloadData();
            }
        }

        protected void gvStages_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            if (!_dal.TryDelete(Convert.ToInt32(e.Keys[0])))
            {
               //doto errors
                
            }
                
        }

        protected void gvStages_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            e.ExceptionHandled = true;
            ReloadData();
        }
    }
}