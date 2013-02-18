using System;
using System.Data;
using System.Web;
using System.Web.Providers.Entities;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxEditors;
using GamificationPortal.Account;
using GamificationPortal.App;


namespace GamificationPortal
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected string BodyBackgroundImageUrl
        {
            get
            {
                if (Session["bg_image_url"] != null)
                {
                    return Session["bg_image_url"].ToString();
                }
                return "../Images/layout/theme/bg1.jpg";
            }
          
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
              //      throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }

            
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            UserFullNameSection.Visible = false;
           
            NavigationMenu.Items.FindByName("Administration").Visible = Request.IsAuthenticated && (AuthProvider.IsUserInRole(Session, AuthRoles.SystemAdmin)
                                                                    || AuthProvider.IsUserInRole(Session, AuthRoles.Admin)
                                                                    || AuthProvider.IsUserInRole(Session, AuthRoles.Moderator)
                                                                    || AuthProvider.IsUserInRole(Session, AuthRoles.MissionsCreator));
            NavigationMenu.Items.FindByName("Profile").Visible = Request.IsAuthenticated && Page.User.Identity.IsAuthenticated;
            if (Page.User.Identity.IsAuthenticated)
            {
                UserFullNameSection.Visible = true;
                UserFullNameSection.InnerHtml = "Hello, " + AuthProvider.GetUserFullName(Session);
               
                CheckRewardsNotification();
            }
           
        }

        private void CheckRewardsNotification()
        {
            var rewardsList  = (new UsersDal()).GetRewardsNotificationList(AuthProvider.UserKey(Session));
            if (rewardsList.Tables.Count > 0 && rewardsList.Tables[0].Rows.Count> 0)
            {
                foreach (DataRow row in rewardsList.Tables[0].Rows)
                {
                    var scriptName = "ShowRewarScreen_" + row.ItemArray[0].ToString();
                    var rewardMessageLabel = RewardsNotification.FindControl("rewardMessage");
                    var rewardImage = RewardsNotification.FindControl("rewardImage");
                    if (rewardMessageLabel != null)
                    {
                        (rewardMessageLabel as HtmlGenericControl).InnerHtml = row.ItemArray[5].ToString();
                        (rewardImage as HtmlImage).Src = string.Format("../Images/Badges/{0}.png", row.ItemArray[6]);
                        
                        ScriptManager.RegisterStartupScript(this, GetType(), scriptName, "NotificationPopupScreen.Show();", true);      
                    }
                  
                }
               
               
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        public void ShowErrorMessage(string message, Control control, Type type)
        {
            ScriptManager.RegisterStartupScript(control, type, "ShowErrorControlScript", string.Format("ShowErrorControl('{0}');", message), true);
        }

        protected void LoginStatusControl_LoggingOut(object sender, System.Web.UI.WebControls.LoginCancelEventArgs e)
        {

        }

        internal void ShowWelcomeScreen(Control control, Type type)
        {
            ScriptManager.RegisterStartupScript(control, type, "ShowWelcomeScreen", "PopupProfileWelcomeScreen.Show();", true);
        }
        
    }
}