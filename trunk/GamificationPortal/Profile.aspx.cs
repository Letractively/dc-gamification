using System;
using GamificationPortal.Account;
using GamificationPortal.App;

namespace GamificationPortal
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && Page.User.Identity.IsAuthenticated)
            {
               
                var isMissionsManageAvailable = (AuthProvider.IsUserInRole(Session, AuthRoles.SystemAdmin) ||
                                                 AuthProvider.IsUserInRole(Session, AuthRoles.Admin) ||
                                                 AuthProvider.IsUserInRole(Session, AuthRoles.Moderator) ||
                                                 AuthProvider.IsUserInRole(Session, AuthRoles.MissionsCreator));

                PageControlProfile.TabPages.FindByName("Manage Missions").Visible = isMissionsManageAvailable;
                PageControlProfile.TabPages.FindByName("Manage Missions").Enabled = isMissionsManageAvailable;

            }
            else
            {
                Session["RedirectedFromUrl"] = "../Profile.aspx";
                Response.Redirect("Account/Login.aspx");
            }
        }
    }
}