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


        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}