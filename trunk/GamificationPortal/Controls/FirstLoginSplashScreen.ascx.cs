using System;
using GamificationPortal.Account;
using GamificationPortal.App;

namespace GamificationPortal.Controls
{
    public partial class FIrstLoginSplashScreen : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (Request.IsAuthenticated && Page.User.Identity.IsAuthenticated)
            {
                cbSpecialization.DataSource = (new UsersDal()).GetUsersSpecializationList();
                cbSpecialization.DataBind();

                var specialization = (new UsersDal()).GetUserSpecialization(AuthProvider.UserKey(Session));
                if (string.IsNullOrEmpty(specialization) && cbSpecialization.SelectedIndex == -1)
                {
                    
                    ((SiteMaster) Page.Master).ShowWelcomeScreen(this, GetType());
                }
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            (new UsersDal()).UpdateUserSpecialization(Convert.ToInt32(cbSpecialization.SelectedItem.Value), AuthProvider.UserKey(Session));
        }

        protected void ASPxComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnProceenToRoom.Enabled = true;
        }
    }
}