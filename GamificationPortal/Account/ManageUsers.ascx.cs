using System;
using System.Web.Security;
using DevExpress.Web.ASPxEditors;
using GamificationPortal.App;

namespace GamificationPortal.Account
{
    public partial class ManageUsers : System.Web.UI.UserControl
    {
        readonly UsersDal  _dal = new UsersDal();

        protected void Page_Load(object sender, EventArgs e)
        {
            ReloadData();
           
        }

        private void ReloadData()
        {
            UsersGrid.DataSource = _dal.LoadUsersWithRoles();
            UsersGrid.DataBind();
        }

        protected void UsersGrid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            var userName = e.NewValues["UserName"].ToString();

            var oldIsSysAdmin = Convert.ToBoolean(e.OldValues[AuthRoles.SystemAdmin]);
            var oldIsAdmin = Convert.ToBoolean(e.OldValues[AuthRoles.Admin]);
            var oldIsModerator = Convert.ToBoolean(e.OldValues[AuthRoles.Moderator]);
            var oldIsMissionsCreator = Convert.ToBoolean(e.OldValues[AuthRoles.MissionsCreator]);
            var oldIsUser = Convert.ToBoolean(e.OldValues[AuthRoles.User]);

            var isSysAdmin = Convert.ToBoolean(e.NewValues[AuthRoles.SystemAdmin]);
            var isAdmin = Convert.ToBoolean(e.NewValues[AuthRoles.Admin]);
            var isModerator = Convert.ToBoolean(e.NewValues[AuthRoles.Moderator]);
            var IsMissionsCreator = Convert.ToBoolean(e.NewValues[AuthRoles.MissionsCreator]);
            var isUser = Convert.ToBoolean(e.NewValues[AuthRoles.User]);
            
            if (oldIsSysAdmin != isSysAdmin)
            {
                if (isSysAdmin)
                {
                    Roles.AddUserToRole(userName, AuthRoles.SystemAdmin);
                }
                else
                {
                    Roles.RemoveUserFromRole(userName, AuthRoles.SystemAdmin);
                }
            }

            if (oldIsAdmin != isAdmin)
            {
                if (isAdmin)
                {
                    Roles.AddUserToRole(userName, AuthRoles.Admin);
                }
                else
                {
                    Roles.RemoveUserFromRole(userName, AuthRoles.Admin);
                }
            }

            if (oldIsModerator != isModerator)
            {
                if (isModerator)
                {
                    Roles.AddUserToRole(userName, AuthRoles.Moderator);
                }
                else
                {
                    Roles.RemoveUserFromRole(userName, AuthRoles.Moderator);
                }
            }

            if (oldIsMissionsCreator != IsMissionsCreator)
            {
                if (IsMissionsCreator)
                {
                    Roles.AddUserToRole(userName, AuthRoles.MissionsCreator);
                }
                else
                {
                    Roles.RemoveUserFromRole(userName, AuthRoles.MissionsCreator);
                }
            }

            if (oldIsUser != isUser)
            {
                if (isUser)
                {
                    Roles.AddUserToRole(userName, AuthRoles.User);
                }
                else
                {
                    Roles.RemoveUserFromRole(userName, AuthRoles.User);
                }
            }
            
            if (e.NewValues["SpecializationId"] != null)
            {
                (new UsersDal()).UpdateUserSpecialization(Convert.ToInt32(e.NewValues["SpecializationId"]), (Guid)e.NewValues["UserId"]);
            }
        }

        protected void UsersGrid_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            e.ExceptionHandled = true;
            ReloadData();

        }

        protected void BtnFindUser_Click(object sender, EventArgs e)
        {
            var user = AuthProvider.FindUserByLogin(TbUserLogin.Text);
            if (user != null)
            {
                lblUserName.Text = user.Name;
                LblDepartment.Text = user.Department;
                LblEmail.Text = user.Mail;
                LblOffice.Text = user.Office;
            }
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TbUserLogin.Text))
            {
                var dal = new UsersDal();
                if (!dal.IsUserExists(TbUserLogin.Text))
                {
                    dal.RegisterNewUser(AuthProvider.LoginWithDomain(TbUserLogin.Text),
                                        AuthProvider.GetUserFullNameByDomainIdentity(TbUserLogin.Text));
                    TbUserLogin.Text = string.Empty;
                    lblUserName.Text = string.Empty;
                    LblDepartment.Text = string.Empty;
                    LblEmail.Text = string.Empty;
                    LblOffice.Text = string.Empty;

                    ReloadData();
                }
            }
          
        }

        protected void UsersGrid_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditorEventArgs e)
        {
            switch (e.Column.Name)
            {
                case AuthRoles.SystemAdmin:
                    e.Column.ReadOnly =
                        AuthProvider.IsUserInRole(Session, AuthRoles.SystemAdmin);
                    break;
                case "SpecializationId":
                    if (e.Editor != null)
                    {
                        var editor = (e.Editor as ASPxComboBox);

                        editor.ValueField = "SpecializationId";
                        editor.TextField = "Description";
                        editor.DataSource = (new UsersDal()).GetUsersSpecializationList();
                        editor.DataBind();
                    }
                    break;
            }

        }

        protected void UsersGrid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            var dal = new UsersDal();
            if (!dal.UserHasActiveMissions((Guid)e.Values["UserId"]))
            {
                dal.DeleteUser((Guid) e.Values["UserId"]);
            }
            else
            {
                //todo create message
            }
        }

        protected void UsersGrid_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            e.ExceptionHandled = true;
            ReloadData();
        }

        

       
    }
}