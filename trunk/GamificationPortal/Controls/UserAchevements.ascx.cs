using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web.UI;
using GamificationPortal.Account;
using GamificationPortal.App;

namespace GamificationPortal.Controls
{
    public partial class UserAchevements : UserControl
    {
        private const string BadgesDirectory = "~/Images/Badges/";
        private string BadgesLogoDirectory
        {
            get { return "~/Images/Users/" + Page.User.Identity.Name; }
        }

        private string EmblemKey;
   
        private readonly BadgesDal _dal = new BadgesDal();

        protected void Page_Load(object sender, EventArgs e)
        {
            gvUnique.DataSource = _dal.GetBadgesByUserAndType(AuthProvider.UserKey(Session), BadgesType.Unique);
            gvUnique.DataBind();

            gvBackgrounds.DataSource = _dal.GetBadgesByUserAndType(AuthProvider.UserKey(Session), BadgesType.Background);
            gvBackgrounds.DataBind();
            gvTitles.DataSource = _dal.GetBadgesByUserAndType(AuthProvider.UserKey(Session), BadgesType.Title);
            gvTitles.DataBind();
            gvMisc.DataSource = _dal.GetBadgesByUserAndType(AuthProvider.UserKey(Session), BadgesType.Misc);
            gvMisc.DataBind();

            CombineLogo();
            if (Session["CurrentEmplem"] != null)
            {
                Image1.ImageUrl = Session["CurrentEmplem"].ToString();
            }
        }

        private void CombineLogo()
        {
           
            var dal = new BadgesDal();
            if (gvUnique.FocusedRowIndex > 0)
            {
                var key = gvUnique.GetRowValues(gvUnique.FocusedRowIndex, new string[] {"FileGroupId"}).ToString();
                var isLocked = Convert.ToBoolean(gvUnique.GetRowValues(gvUnique.FocusedRowIndex, new string[] { "IsLocked" }));
                if (!isLocked)
                {
                    string filename = dal.GetUnlockedBadgeFileName(AuthProvider.UserKey(Session), Convert.ToInt32(key));
                    CombineBitmap(new[] {filename});
                }
            }
            else
            {
                //combined

                string imgBackground = string.Empty;
                string imgMisk = string.Empty;
                string imgTitle = string.Empty;
                string key = string.Empty;
                if (gvBackgrounds.FocusedRowIndex > 0)
                {
                    key = gvBackgrounds.GetRowValues(gvBackgrounds.FocusedRowIndex, new string[] { "FileGroupId" }).ToString();

                    imgBackground = dal.GetUnlockedBadgeFileName(AuthProvider.UserKey(Session),
                                                                        Convert.ToInt32(key));
                }
                if (gvMisc.FocusedRowIndex > 0)
                {
                    key = gvMisc.GetRowValues(gvMisc.FocusedRowIndex, new string[] { "FileGroupId" }).ToString();
                    imgMisk = dal.GetUnlockedBadgeFileName(AuthProvider.UserKey(Session),
                                                           Convert.ToInt32(key));
                }
                if (gvTitles.FocusedRowIndex > 0)
                {
                    key = gvTitles.GetRowValues(gvTitles.FocusedRowIndex, new string[] { "FileGroupId" }).ToString();
                    imgTitle = dal.GetUnlockedBadgeFileName(AuthProvider.UserKey(Session),
                                                            Convert.ToInt32(key));
                }
                CombineBitmap(new[] { imgBackground, imgMisk, imgTitle });
            }
        }

        public void  CombineBitmap(string[] files)
        {
            //read all images into memory
            var images = new List<Bitmap>();
            Bitmap finalImage = null;

            try
            {
                int width = 0;
                int height = 0;

                foreach (string image in files)
                {
                    if (!string.IsNullOrEmpty(image))
                    {
                        //create a Bitmap from the file and add it to the list
                        var bitmap = new Bitmap(MapPath(BadgesDirectory) + image);

                        //update the size of the final bitmap
                        width = bitmap.Width > width ? bitmap.Width : width;
                        height = bitmap.Height > height ? bitmap.Height : height;

                        images.Add(bitmap);
                    }
                }
                if (images.Count > 0)
                {
                    //create a bitmap to hold the combined image
                    finalImage = new Bitmap(width, height);

                    //get a graphics object from the image so we can draw on it
                    using (Graphics g = Graphics.FromImage(finalImage))
                    {
                        //set background color
                        g.Clear(Color.Transparent);

                        //go through each image and draw it on the final image

                        foreach (Bitmap image in images)
                        {
                            var startPositionX = finalImage.Width / 2 - image.Width / 2;
                            var startPositionY = finalImage.Height / 2 - image.Height / 2;
                            g.DrawImage(image,
                                        new Rectangle(startPositionX, startPositionY, image.Width, image.Height));
                        }
                    }

                   
                    var dirPath = MapPath(BadgesLogoDirectory);
                    if (!Directory.Exists(dirPath))
                    {
                        Directory.CreateDirectory(dirPath);

                    }
                    EmblemKey = Guid.NewGuid().ToString() + "_logo.png";
                    var filePath = dirPath + "\\" + EmblemKey;
                    
                    DeleteAllTempFiles();
                    finalImage.Save(filePath, ImageFormat.Png);

                    Session["CurrentEmplem"] = BadgesLogoDirectory + "\\" + EmblemKey;
                     
                }

            }
            catch (Exception ex)
            {
                if (finalImage != null)
                    finalImage.Dispose();

                throw ex;
            }
            finally
            {
                //clean up memory
                foreach (Bitmap image in images)
                {
                    image.Dispose();
                }
            }
        }

        public void DeleteAllTempFiles()
        {
            var EmblemKey = (new UsersDal()).GetUserEmblem(AuthProvider.UserKey(Session));
            var dirPath = MapPath(BadgesLogoDirectory);
            var filePath = dirPath + "\\" + EmblemKey;

            foreach (var f in System.IO.Directory.GetFiles(MapPath(BadgesLogoDirectory)))
            try
            {
                if (f != filePath)
                    System.IO.File.Delete(f);
            }
            catch (Exception)
            {
            }


        }

        protected void gvBackgrounds_FocusedRowChanged(object sender, EventArgs e)
        {
            if (gvBackgrounds.FocusedRowIndex > 0)
            {
                gvBackgrounds.Selection.SelectRow(gvBackgrounds.FocusedRowIndex);

                gvUnique.FocusedRowIndex = 0;
                gvUnique.Selection.UnselectAll();
            }
           
        }

        protected void gvMisc_FocusedRowChanged(object sender, EventArgs e)
        {
            if (gvMisc.FocusedRowIndex > 0)
            {
                gvUnique.FocusedRowIndex = 0;
            }
           
        }

        protected void gvTitles_FocusedRowChanged(object sender, EventArgs e)
        {
            if (gvTitles.FocusedRowIndex > 0)
            {
                gvUnique.FocusedRowIndex = 0;
            }
           
        }

        protected void gvUnique_FocusedRowChanged(object sender, EventArgs e)
        {
            gvUnique.Selection.UnselectAll();
            if (gvUnique.FocusedRowIndex > 0)
            {
                gvUnique.Selection.SelectRow(gvBackgrounds.FocusedRowIndex);

                gvBackgrounds.FocusedRowIndex = 0;
                gvBackgrounds.Selection.UnselectAll();
                gvTitles.FocusedRowIndex = 0;
                gvTitles.Selection.UnselectAll();
                gvMisc.FocusedRowIndex = 0;
                gvMisc.Selection.UnselectAll();
            }
           
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            (new UsersDal()).RegisterNewUserEmblem(AuthProvider.UserKey(Session), EmblemKey);
        }
    }
}