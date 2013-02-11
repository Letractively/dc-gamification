using System;
using System.Globalization;
using DevExpress.Web.ASPxEditors;
using GamificationPortal.Account;
using GamificationPortal.App;

namespace GamificationPortal.Controls
{
    public partial class ManageMissions : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReloadData();
            LoadParameters();
        }

        private void ReloadData()
        {
            var dal = new MissionsDal();
            var isAccessibleForModerateMissions = AuthProvider.IsUserInRole(Session, AuthRoles.SystemAdmin) ||
                                                AuthProvider.IsUserInRole(Session, AuthRoles.Admin) ||
                                                AuthProvider.IsUserInRole(Session, AuthRoles.Moderator);

            GridViewMissionsList.DataSource = isAccessibleForModerateMissions ? dal.GetAllMissionsList() : dal.GetMissionsListByUser(AuthProvider.UserKey(Session));
            GridViewMissionsList.DataBind();

            lblPendingMissionsCount.Text = dal.GetMissionsCountByStatus(MissionStatus.Pending).ToString(CultureInfo.InvariantCulture);
           
        }

        protected void GridViewMissionsList_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditorEventArgs e)
        {
            var statusType = GridViewMissionsList.GetRowValuesByKeyValue(e.KeyValue, new string[] { "StatusDescription" });
            var dal = new MissionsDal();
            switch (e.Column.Name)
            {
                case "Name":
                    if (e.Editor != null)
                    {
                        var editorName = (e.Editor as ASPxTextEdit);
                        editorName.ReadOnly = (string)statusType == "In Progress";
                        editorName.Enabled = (string)statusType != "In Progress";
                    }
                    break;

                case "Description":
                    if (e.Editor != null)
                    {
                        var editorDescr = (e.Editor as ASPxMemo);
                        editorDescr.ReadOnly = (string)statusType == "In Progress";
                        editorDescr.Enabled = (string)statusType != "In Progress";
                    }
                    break;

                case "SkillsRequired":
                    if (e.Editor != null)
                    {
                        var editorSkills = (e.Editor as ASPxMemo);
                        editorSkills.ReadOnly = (string)statusType == "In Progress";
                        editorSkills.Enabled = (string)statusType != "In Progress";
                    }
                    break;
                case "StartDate":
                    if (e.Editor != null)
                    {
                        var editorStartDate = (e.Editor as ASPxDateEdit);
                        editorStartDate.ReadOnly = (string)statusType == "In Progress";
                        editorStartDate.Enabled = (string)statusType != "In Progress";
                    }
                    break;

                case "TypeId":
                    if (e.Editor != null)
                    {
                        var editorType = (e.Editor as ASPxComboBox);
                        editorType.ValueField = "TypeId";
                        editorType.TextField = "Description";

                        editorType.DataSource = dal.GetMissionTypes();
                        editorType.DataBind();
                        editorType.ReadOnly = (string) statusType == "In Progress";
                        editorType.Enabled = (string)statusType != "In Progress";
                    }
                    break;
                    
                case "ComplexityId":
                    if (e.Editor != null)
                    {
                        var editorComplexity= (e.Editor as ASPxComboBox);
                        editorComplexity.ValueField = "ComplexityId";
                        editorComplexity.TextField = "Description";

                        editorComplexity.DataSource = dal.GetMissionComplexityList();
                        editorComplexity.DataBind();
                        editorComplexity.ReadOnly = (string)statusType == "In Progress";
                        editorComplexity.Enabled = (string)statusType != "In Progress";
                    }
                    break;
                case "PlayerType":
                    break;
                case "StatusId":
                    if (e.Editor != null)
                    {
                        var editorStatus= (e.Editor as ASPxComboBox);
                        editorStatus.ValueField = "StatusId";
                        editorStatus.TextField = "Description";
                        editorStatus.Enabled = AuthProvider.IsUserInRole(Session, AuthRoles.SystemAdmin) ||
                                               AuthProvider.IsUserInRole(Session, AuthRoles.Admin) ||
                                               AuthProvider.IsUserInRole(Session, AuthRoles.Moderator);
                        editorStatus.DataSource = dal.GetMissionStatuses(Convert.ToInt32(e.Editor.Value));
                        editorStatus.DataBind();
                    }
                    break;
                case "OwnerId":
                    if (e.Editor != null)
                    {
                        var editorOwner = (e.Editor as ASPxComboBox);
                        editorOwner.Enabled = AuthProvider.IsUserInRole(Session, AuthRoles.SystemAdmin) ||
                                              AuthProvider.IsUserInRole(Session, AuthRoles.Admin) ||
                                              AuthProvider.IsUserInRole(Session, AuthRoles.Moderator);

                        editorOwner.ValueField = "UserId";
                        editorOwner.TextField = "FullName";
                        editorOwner.DataSource = (new UsersDal()).GetOwnersList();
                        editorOwner.DataBind();
                    }
                    break;
                case "StageId":
                     if (e.Editor != null)
                    {
                        var editorStage = (e.Editor as ASPxComboBox);
                        editorStage.Enabled = AuthProvider.IsUserInRole(Session, AuthRoles.SystemAdmin) ||
                                              AuthProvider.IsUserInRole(Session, AuthRoles.Admin) ||
                                              AuthProvider.IsUserInRole(Session, AuthRoles.Moderator);

                        editorStage.ValueField = "StageId";
                        editorStage.TextField = "Description";
                        editorStage.DataSource = (new StagesDal()).GetNotCompletedStagesList();
                        editorStage.DataBind();
                        editorStage.ReadOnly = (string)statusType == "In Progress";
                        editorStage.Enabled = (string)statusType != "In Progress";
                    }
                    break;
            }
                
        }

        protected void GridViewMissionsList_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            
            e.ExceptionHandled = true;
            ReloadData();
        }

        protected void GridViewMissionsList_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            var dal = new MissionsDal();
            dal.UpdateMission(Convert.ToInt32(e.Keys["MissionId"])
                , e.NewValues["Name"].ToString()
                , e.NewValues["Description"].ToString()
           
                , Convert.ToInt32(e.NewValues["Reward"])
                , e.NewValues["PlayerType"] == null ? string.Empty : e.NewValues["PlayerType"].ToString()
                , Guid.Parse(e.NewValues["OwnerId"].ToString())
                , Convert.ToDateTime(e.NewValues["StartDate"])
                , Convert.ToDateTime(e.NewValues["EndDate"])
                , e.NewValues["SkillsRequired"] == null ? string.Empty : e.NewValues["SkillsRequired"].ToString()
             
                , Convert.ToInt32(e.NewValues["StatusId"])
                , Convert.ToInt32(e.NewValues["TypeId"])
                , Convert.ToInt32(e.NewValues["ComplexityId"])
                , e.NewValues["StageId"] == null ? (int?)null : Convert.ToInt32(e.NewValues["StageId"]));
        }

        private void LoadParameters()
        {
            var dal = new MissionsDal();
            tbMissionType.DataSource = dal.GetMissionTypes();
            tbMissionType.DataBind();
          

            tbMissionComplexity.DataSource = dal.GetMissionComplexityList();
            tbMissionComplexity.DataBind();
           

            tbMissionStartDate.Date = DateTime.Now;
            tbMissionEndDate.Date = DateTime.Now;
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && Page.User.Identity.IsAuthenticated)
            {
                var dal = new MissionsDal();

                var name = tbMissionName.Text;
                var descr = editorDescription.Html;
                var skills = editorSkillsRequired.Html;
                var type = Convert.ToInt32(tbMissionType.Value);
                var complexity = Convert.ToInt32(tbMissionComplexity.Value);
                var startDate = tbMissionStartDate.Date;
                var endDate = tbMissionEndDate.Date;
                
                var playerType = string.Empty;
                var ownerId = AuthProvider.UserKey(Session);

                dal.CreateMission(name, descr, skills, type, complexity, startDate, endDate, playerType, ownerId, AuthProvider.UserKey(Session));
                ClearFields();
                ReloadData();
            }
        }

        private void ClearFields()
        {
            tbMissionName.Text = string.Empty;
            editorDescription.Html = string.Empty;
            editorSkillsRequired.Html = string.Empty;
            
            tbMissionStartDate.Date = DateTime.Now;
            tbMissionEndDate.Date = DateTime.Now;
            tbMissionType.Items[0].Selected = true;
            tbMissionComplexity.Items[0].Selected = true;

        }

        protected void GridViewMissionsList_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            //var visibleIndex = GridViewMissionsList.FindVisibleIndexByKeyValue(e.EditingKeyValue);
            
            //var row = GridViewMissionsList.GetRow(visibleIndex);
            //var dataRow = GridViewMissionsList.GetDataRow(visibleIndex);
        }
    }
}
