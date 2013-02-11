using System;
using System.Web.UI;
using DevExpress.Web.ASPxEditors;
using GamificationPortal.Account;
using GamificationPortal.App;

namespace GamificationPortal
{
    public partial class Missions : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReloadData();
        }

        private void ReloadData()
        {
            XmlDataSource1.Data = (new MissionsDal()).GetMissionsListInXmlFormat();
                if (!string.IsNullOrEmpty(XmlDataSource1.Data) && XmlDataSource1.Data != "<missionsList />")
                {
                    MissionsNavigationBar.DataBind();
                    MissionsNavigationBar.Groups.CollapseAll();
                    MissionsContainer.Visible = true;
                    MissionsContainerNoMissions.Visible = false;
                }
                else
                {
                    MissionsContainer.Visible = false;
                    MissionsContainerNoMissions.Visible = true;
                }
        }
        protected void MissionsNavigationBar_GroupDataBound(object source, DevExpress.Web.ASPxNavBar.NavBarGroupEventArgs e)
        {
            
          
        }

        protected void BtnTakeMission_Click(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                Session["RedirectedFromUrl"] = "../Missions.aspx";
                Response.Redirect("Account/Login.aspx");
            }
            else
            {
                if ((sender as ASPxButton).CommandArgument != null)
                {
                    var missionId = (sender as ASPxButton).CommandArgument;
                    var dal = new MissionsDal();
                    var isLimitDepleted = dal.IsMissionsLimitForUserDepleted(AuthProvider.UserKey(Session));
                    if (!isLimitDepleted)
                    {
                        dal.AssignMissionToUser(missionId, AuthProvider.UserKey(Session));
                        string takenBy = AuthProvider.GetUserFullName(Session);
                        MailController.NotifyMissionOwnerMissionWasTaken(Convert.ToInt32(missionId), takenBy);
                    }
                    else
                    {
                        ((SiteMaster)Page.Master).ShowErrorMessage("You are not allowed to take more then one mission at the same time!", this, GetType());
                    }
                }
                ReloadData();
                
            }
        }

        protected bool IsMissionInProgress(object evalDataItem)
        {
            if (evalDataItem != null && evalDataItem.ToString() == "In Progress")
                return true;
            return false;
        }
    }
}