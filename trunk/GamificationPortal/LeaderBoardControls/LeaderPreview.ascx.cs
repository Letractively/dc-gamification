using System;

namespace GamificationPortal.LeaderBoardControls
{
    public partial class LeaderPreview : System.Web.UI.UserControl
    {
        public string UserFullName
        {
            get { return lblUserName.Text; }
            set { lblUserName.Text = value; }
        }

        public string Title
        {
            get { return lblTitale.Text; }
            set { lblTitale.Text = value; }
        }

        public string ImageUrl
        {
            get { return imgUser.ImageUrl; }
            set { imgUser.ImageUrl = string.Format("~/Images/Users/{0}", value); }
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
                    imgUserEmblem.ImageUrl = string.Format("~/Images/Users/{0}/{1}", Page.User.Identity.Name, value);
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}