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
                if (!string.IsNullOrEmpty(profile.UserAvatarUrl))
                {
                    imgUserAvatar.ImageUrl = string.Format("~/Images/Users/{0}/{1}", Page.User.Identity.Name, profile.UserAvatarUrl);
                    imgAvatarPreview.ImageUrl = string.Format("~/Images/Users/{0}/{1}", Page.User.Identity.Name, profile.UserAvatarUrl); 
                }
                else
                {
                    imgUserAvatar.ImageUrl = "~/Images/Users/default.jpeg";
                    imgAvatarPreview.ImageUrl = "~/Images/Users/default.jpeg";
                }
                
                if (!string.IsNullOrEmpty(profile.UserEmblemUrl))
                {
                    imgUserEmblem.ImageUrl = string.Format("~/Images/Users/{0}/{1}", Page.User.Identity.Name,  profile.UserEmblemUrl);    
                }
                else
                {
                    imgUserEmblem.ImageUrl = "~/Images/EmptyImage.png";
                }
                
                lblSpecialization.InnerText = profile.Specialization;
                lblRankDescription.Text = profile.RankDescription;

                pbExpirience.DisplayFormatString = "{0}/" + profile.NextLevelExp.ToString(CultureInfo.InvariantCulture);
                pbExpirience.Maximum =  profile.NextLevelExp;
                
                pbExpirience.Value = profile.Expirience;
                pbExpirience.Position = profile.Expirience;

                lblCompletedMissionsCount.Text = profile.CompletedMissions.ToString(CultureInfo.InvariantCulture);
                lblFailedMissionsCount.Text = profile.FailedMissions.ToString(CultureInfo.InvariantCulture);
                
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

            var usersDal = new UsersDal();
         
            var fileExtension = GetExtension(uploadedFile.FileName);
           
            var guid = Guid.NewGuid();
           
            var dirPath = MapPath(UploadDirectory + AuthProvider.GetNameWithoutDomain(Page.User.Identity.Name));
            if (!Directory.Exists(dirPath))
            {
                Directory.CreateDirectory(dirPath);

            }

            string fileName = Path.Combine(dirPath, guid.ToString() + fileExtension);
            uploadedFile.SaveAs(fileName, true);

            //create a Bitmap from the file and add it to the list
            var bitmap = new Bitmap(fileName);
            if (bitmap.Height > 128 || bitmap.Width > 128)
            {

                return "File size is invalid. Image can not be bigger than 128x128 pixels.";
            }


            usersDal.RegisterNewUserAvatar(guid.ToString() + fileExtension, AuthProvider.UserKey(Session));

            //clear old Data
           
            var emblemKey = usersDal.GetUserEmblem(AuthProvider.UserKey(Session));
            var avatarKey = usersDal.GetUserAvatar(AuthProvider.UserKey(Session));

            var filePath1 = dirPath + "\\" + (avatarKey ?? string.Empty);
            var filePath2 = dirPath + "\\" + (emblemKey ?? string.Empty);

            foreach (var f in Directory.GetFiles(dirPath))
            {
                try
                {
                    if ((f != filePath1) && (f != filePath2))
                        File.Delete(f);
                }
                catch (Exception)
                {
                }
            }
            return string.Empty;
        }

        private object GetExtension(string p)
        {
            var index = p.LastIndexOf('.');
            return p.Substring(index);

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            (new UsersDal()).RegisterNewUserAvatar(string.Empty, AuthProvider.UserKey(Session));
            ReloadData();
        }
    }
}