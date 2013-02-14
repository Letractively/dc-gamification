using System;
using System.Drawing;
using System.Globalization;
using System.IO;
using DevExpress.Web.ASPxUploadControl;
using GamificationPortal.Account;
using GamificationPortal.App;

namespace GamificationPortal.Controls
{
    public partial class UserProfile : System.Web.UI.UserControl
    {
        const string UploadDirectory = "~/Images/Users/";
        readonly BadgesDal _dal = new BadgesDal();
        protected void Page_Load(object sender, EventArgs e)
        {
            ReloadData();
        }

        private void ReloadData()
        {
            var profile = (new UsersDal()).GetUserProfile(AuthProvider.UserKey(Session));
            if (profile != null)
            {
                lblUserFullName.InnerText = profile.FullName;
                imgUserAvatar.ImageUrl = profile.UserAvatarUrl;
                if (!string.IsNullOrEmpty(profile.UserEmblemUrl))
                {
                    imgUserEmblem.ImageUrl = string.Format("~/Images/Users/{0}/{1}", Page.User.Identity.Name,  profile.UserEmblemUrl);    
                }
                
                imgAvatarPreview.ImageUrl = profile.UserAvatarUrl;
                lblSpecialization.InnerText = profile.Specialization;
                lblRankDescription.Text = profile.RankDescription;

                pbExpirience.DisplayFormatString = "{0}/" + profile.NextLevelExp.ToString(CultureInfo.InvariantCulture);
                pbExpirience.Maximum =  profile.NextLevelExp;
                
                pbExpirience.Value = profile.Expirience;
                pbExpirience.Position = profile.Expirience;

                lblCompletedMissionsCount.Text = profile.CompletedMissions.ToString();
                lblFailedMissionsCount.Text = profile.FailedMissions.ToString();
                
                lblTotalBadges.Text = _dal.GetTotalBadgesCount().ToString(CultureInfo.InvariantCulture);
                lblUnlockedBadges.Text = _dal.GetUnlockedBadgesCount(AuthProvider.UserKey(Session)).ToString(CultureInfo.InvariantCulture);

                
            }
            if (Session["ErrorText"] != null)
            {

                lblError.Text = Session["ErrorText"].ToString();
            }
        }

       
        protected void UploadControlAvatar_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            Session["ErrorText"] =  SavePostedFile(e.UploadedFile);
            lblError.Text =  SavePostedFile(e.UploadedFile);
            
        }

        private string SavePostedFile(UploadedFile uploadedFile)
        {
            if (!uploadedFile.IsValid)
                return "File is not valid";

         
            var fileExtension = GetExtension(uploadedFile.FileName);
           
            var guid = Guid.NewGuid();

            string fileName = Path.Combine(MapPath(UploadDirectory), guid.ToString() + fileExtension);
            uploadedFile.SaveAs(fileName, true);

            //create a Bitmap from the file and add it to the list
            var bitmap = new Bitmap(fileName);
            if (bitmap.Height > 128 || bitmap.Width > 128)
            {

                return "File size is invalid. Image can not be bigger than 128x128 pixels.";
            }


            (new UsersDal()).RegisterNewUserAvatar(guid.ToString() + fileExtension, AuthProvider.UserKey(Session));
            return string.Empty;
        }

        private object GetExtension(string p)
        {
            var index = p.LastIndexOf('.');
            return p.Substring(index);

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            (new UsersDal()).RegisterNewUserAvatar("default.jpeg", AuthProvider.UserKey(Session));
            ReloadData();
        }
    }
}