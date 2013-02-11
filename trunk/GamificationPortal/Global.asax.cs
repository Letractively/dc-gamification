using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Security;
using System.Web.UI;
using GamificationPortal.Account;
using GamificationPortal.App;

namespace GamificationPortal
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();
            

            ThemeAssembly.ThemesProviderEx.Register();
            

        }

        protected void Session_Start(Object sender, EventArgs e)
        {
            if (HttpContext.Current.User != null)
            {
                // see if this user is authenticated, any authenticated cookie (ticket) exists for this user 

                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    // see if the authentication is done using FormsAuthentication 

                    if (HttpContext.Current.User.Identity is FormsIdentity)
                    {
                        Session["CurrentUser"] = AuthProvider.LoginWithDomain(HttpContext.Current.User.Identity.Name);
                        Session["CurrentUserId"] =
                            (new UsersDal()).GetUserGUIDByLogin(AuthProvider.LoginWithDomain(HttpContext.Current.User.Identity.Name));

                        var dal = new UsersDal();
                        dal.UsersStatisticsUpdateLoginCount(AuthProvider.UserKey(Session));
                    }
                }
            }

            // LoadBackGround
            var random = new Random();
            int randomNumber = random.Next(1, 8);
            Session["bg_image_url"] = string.Format("Images/layout/theme/bg{0}.jpg", randomNumber);
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }




        protected void Session_End(Object sender, EventArgs e)
        {

        }
        protected void Application_Disposed(Object sender, EventArgs e)
        {

        }


        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

    }
}
