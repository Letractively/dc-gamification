using System;
using System.DirectoryServices.AccountManagement;
using System.Web.UI;
using System.Web.UI.WebControls;
using GamificationPortal.App;

namespace GamificationPortal.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          //  OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            if (Session["RedirectedFromUrl"] != null)
            {
                Login1.DestinationPageUrl = Session["RedirectedFromUrl"].ToString();
            }
        }

        protected void Unnamed1_LoggingIn(object sender, LoginCancelEventArgs e)
        {
           
        }

        protected void Unnamed1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            bool valid = false;
            using (var context = new PrincipalContext(ContextType.Domain))
            {
                var login = sender as System.Web.UI.WebControls.Login;
                if (login != null)
                {
                    valid = context.ValidateCredentials(login.UserName, login.Password);
                    if (valid)
                    {
                        var dal = new UsersDal();
                        var loginWithDomain = AuthProvider.LoginWithDomain(login.UserName);

                        if (!dal.IsUserExists(AuthProvider.LoginWithDomain(login.UserName)))
                        {
                            Session["CurrentUserId"] = dal.RegisterNewUser(loginWithDomain,
                                                         AuthProvider.GetUserFullNameByDomainIdentity(login.UserName));
                            Login1.DestinationPageUrl = "Profile.aspx";
                            //e.Authenticated = false;
                            //return;
                        }
                        else
                        {
                            Session["CurrentUserId"] = (new UsersDal()).GetUserGUIDByLogin(loginWithDomain);    
                        }
                        Session["CurrentUser"] = loginWithDomain;
                       
                        dal.UsersStatisticsUpdateLoginCount(AuthProvider.UserKey(Session));

                    }
                }
            }
            e.Authenticated = valid;
          
        }

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
    }
}