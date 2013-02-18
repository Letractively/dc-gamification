using System;
using System.Globalization;
using GamificationPortal.Account;

namespace GamificationPortal.LeaderBoardControls
{
    public partial class LeaderPreview : System.Web.UI.UserControl
    {
        private string _userName;
        public int CountMissionsDoneByUser
        {
            get { return 0; }
            set { lblMissionsDone.Text = value.ToString(CultureInfo.InvariantCulture); }
        }
        public int MissionsOnStage
        {
            get { return 0; }
            set { lblMissionsOnStage.Text = value.ToString(CultureInfo.InvariantCulture); }
        }

        public decimal PercentageOfWork
        {
            get { return Convert.ToDecimal(pbStageImpact.Value); }
            set { pbStageImpact.Value = value; }
        }

        public string UserFullName
        {
            get { return lblUserName.InnerHtml; }
            set { lblUserName.InnerHtml = value; }
        }

        public string Title
        {
            get { return lblTitale.Text; }
            set { lblTitale.Text = value; }
        }

        public string ImageUrl
        {
            get { return imgUser.ImageUrl; }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    imgUser.ImageUrl = "~/Images/Users/default.jpeg";
                }
                else
                {
                    imgUser.ImageUrl = string.Format("~/Images/Users/{0}/{1}", _userName, value);    
                }
                
            }
        }

        public string EmblemUrl
        {
            get { return imgUserEmblem.ImageUrl; }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    imgUserEmblem.ImageUrl = "~/Images/EmptyImage.png";
                }
                else
                {
                    imgUserEmblem.ImageUrl = string.Format("~/Images/Users/{0}/{1}", _userName, value);
                }
            }
        }

        public string UserName
        {
            get { return _userName; }
            set { _userName = AuthProvider.GetNameWithoutDomain(value); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}