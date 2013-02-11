using System;
using System.Web.UI;
using GamificationPortal.App;

namespace GamificationPortal
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
               BannerSlider.Items[0].Text = Const.BeTheFirstBannerText;
               BannerSlider.Items[1].Text = Const.ContributionBannerText;
               BannerSlider.Items[2].Text = Const.BadgesBannerText;
               BannerSlider.Items[3].Text = Const.AchievementsBannerText;
           
        }

        protected void btnPromo_Click(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Missions.aspx");
            }
            else
            {
                Response.Redirect("Account/Login.aspx");
            }
        }

        protected DateTime ConvertToDate(object eval)
        {
            return Convert.ToDateTime(eval.ToString());
        }
    }
}