using System;
using GamificationPortal.Account;

namespace GamificationPortal
{
    public partial class Administration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var isAdminUser = (AuthProvider.IsUserInRole(Session, AuthRoles.SystemAdmin) ||
                 AuthProvider.IsUserInRole(Session, AuthRoles.Admin));

            PageControlAdministration.TabPages.FindByName("Portal Configuration").Enabled = isAdminUser;
            PageControlAdministration.TabPages.FindByName("Users Manage").Enabled = isAdminUser;
            PageControlAdministration.TabPages.FindByName("Badges Manage").Enabled = isAdminUser;
            if (!isAdminUser)
            {
                PageControlAdministration.ActiveTabIndex = 0;
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewMission.aspx");
        }
    }
}