using System;
using System.Globalization;
using GamificationPortal.Account;
using GamificationPortal.App;

namespace GamificationPortal.Controls
{
    public partial class UserStatistic : System.Web.UI.UserControl
    {
        readonly BadgesDal _dal = new BadgesDal();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            LblTotalBadges.Text = _dal.GetTotalBadgesCount().ToString(CultureInfo.InvariantCulture);
            LblUnlockedBadges.Text = _dal.GetUnlockedBadgesCount(AuthProvider.UserKey(Session)).ToString(CultureInfo.InvariantCulture);
        }
    }
}