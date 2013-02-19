using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GamificationPortal.App;

namespace GamificationPortal
{
    public partial class Promo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BannerSlider.Items[0].Text = Const.BeTheFirstBannerText;
            BannerSlider.Items[1].Text = Const.ContributionBannerText;
            BannerSlider.Items[2].Text = Const.BadgesBannerText;
            BannerSlider.Items[3].Text = Const.AchievementsBannerText;
        }
    }
}