using System;
using System.IO;
using DevExpress.Web.ASPxUploadControl;
using GamificationPortal.App;

namespace GamificationPortal.Controls
{
    public partial class ManageBadges : System.Web.UI.UserControl
    {
        const string UploadDirectory = "~/Images/Badges/";
        private int _fileGroupId = 0;
        private readonly BadgesDal _dal = new BadgesDal();

        protected void Page_Load(object sender, EventArgs e)
        {
            ReloadGridData();
        }

        
        private void ReloadGridData()
        {
            GridViewBadgesCollection.DataSource = _dal.GetBadgesCollection();
            GridViewBadgesCollection.DataBind();

            cbGrantRule.DataSource = _dal.GetGrantRules();
            cbGrantRule.DataBind();
        }

        private void SavePostedFile(UploadedFile uploadedFile)
        {
            if (!uploadedFile.IsValid)
                return ;

            var fileOriginalName = uploadedFile.FileName;

            int index;
                for (index = 0; index < UploadControlBudges.UploadedFiles.Length; index++)
                {
                    if (UploadControlBudges.UploadedFiles[index].FileName == fileOriginalName)
                    {
                        break;
                    }
                }
            if (index == 0)
            {
                _fileGroupId = _dal.RegisterNewBadgesFileGroup(tbBadgeGroupName.Text, tbMessage.Text, TbDescription.Text, cbImageType.Text, Convert.ToInt32(cbGrantRule.SelectedItem.Value));
            }
            
            var guid = Guid.NewGuid();
           
            string fileName = Path.Combine(MapPath(UploadDirectory), guid.ToString() + ".png");
            uploadedFile.SaveAs(fileName, true);
            _dal.RegisterNewBadgeInFileGroup(_fileGroupId, guid, index);
         
        }

        protected void UploadControlBudgeFullSize_FileUploadComplete1(object sender, FileUploadCompleteEventArgs e)
        {
            SavePostedFile(e.UploadedFile);
        }

        protected void UploadControlBudges_FilesUploadComplete(object sender, FilesUploadCompleteEventArgs e)
        {
            ReloadGridData();
        }

        protected void GridViewBadgesCollection_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            if (!string.IsNullOrEmpty(e.Values["ImageURL"].ToString()))
                File.Delete(Server.MapPath(e.Values["ImageURL"].ToString()));

            if (!string.IsNullOrEmpty(e.Values["LockedURL"].ToString()))
                File.Delete(Server.MapPath(e.Values["LockedURL"].ToString()));

            _dal.DeleteBadgesFileGroup(Convert.ToInt32(e.Values["FileGroupId"]));
        }

        protected void GridViewBadgesCollection_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            e.ExceptionHandled = true;
            ReloadGridData();
        }

 





    }
}