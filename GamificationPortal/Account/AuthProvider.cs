using System;
using System.DirectoryServices;
using System.Web.Security;
using System.Web.SessionState;
using GamificationPortal.App;

namespace GamificationPortal.Account
{
    public class AuthProvider
    {

        public static string GetUserFullNameByDomainIdentity(string login)
        {
            string str;

            // Parse the string to check if domain name is present.
            int idx = login.IndexOf('\\');
            if (idx == -1)
            {
                idx = login.IndexOf('@');
            }

            string strName = idx != -1 ? login.Substring(idx + 1) : login;

            try
            {
                const string connection = "LDAP://softserveinc.com";
                var dssearch = new DirectorySearcher(connection) { Filter = "(sAMAccountName=" + strName + ")" };
                SearchResult sresult = dssearch.FindOne();
                DirectoryEntry dsresult = sresult.GetDirectoryEntry();

                str = dsresult.Properties["displayName"][0].ToString();
            }
            catch (Exception ex)
            {
                str = ex.Message;
            }
            return str;

        }

        public static string GetUserFullName(HttpSessionState session)
        {
            if (session == null )
                return string.Empty;

            if (session["CurrentUserFullName"] == null)
            {
                session["CurrentUserFullName"] = GetUserFullNameByDomainIdentity(session["CurrentUser"].ToString());
            }

            return session["CurrentUserFullName"].ToString();
        }

        public static bool IsUserInRole(HttpSessionState session, string roleName)
        {
            if (session == null || session["CurrentUser"] == null)
                return false;

            return Roles.IsUserInRole(session["CurrentUser"].ToString(), roleName);
        }

        public static void AssignDefaultRoleForUserByLogin(string userName)
        {
            AssignDefaultRoleForUser(userName);

            if (Roles.GetRolesForUser(userName).Length == 0)
            {
                Roles.AddUserToRole(userName, "User");
            }
        }

        public static void AssignDefaultRoleForUser(string userName)
        {
            var dal = new UsersDal();

            if (!dal.IsUserExists(userName))
            {
                //add new user to table
                //and assign User Role to him
                dal.InsertUserWithDefaultRole(userName);
            }
        }

        public static string LoginWithDomain(string login)
        {
            // Parse the string to check if domain name is present.
            int idx = login.IndexOf('\\');
            if (idx == -1)
            {
                login = "SOFTSERVE\\" + login;
            }
            return login;
        }

        public static Guid UserKey(HttpSessionState session)
        {
            if (session == null || session["CurrentUserId"] == null)
            {
                throw new Exception();
            }
            return (Guid)session["CurrentUserId"];
        }

        public static UserEntity FindUserByLogin(string login)
        {
            // Parse the string to check if domain name is present.
            int idx = login.IndexOf('\\');
            if (idx == -1)
            {
                idx = login.IndexOf('@');
            }

            string strName = idx != -1 ? login.Substring(idx + 1) : login;


            const string connection = "LDAP://softserveinc.com";
            var dssearch = new DirectorySearcher(connection) { Filter = "(sAMAccountName=" + strName + ")" };
            var sresult = dssearch.FindOne();


            DirectoryEntry dsresult = sresult.GetDirectoryEntry();
            var result = new UserEntity
                {
                    Login = "SOFTSERVE\\" + login,
                    Name = dsresult.Properties["displayName"][0].ToString(),
                    Mail = dsresult.Properties["mail"][0].ToString(),
                    Department = dsresult.Properties["department"][0].ToString(),
                    Office = dsresult.Properties["physicalDeliveryOfficeName"][0].ToString()
                };

            return result;


        }

        public static string GetMailByLogin(string login)
        {
            // Parse the string to check if domain name is present.
            int idx = login.IndexOf('\\');
            if (idx == -1)
            {
                idx = login.IndexOf('@');
            }

            string strName = idx != -1 ? login.Substring(idx + 1) : login;


            const string connection = "LDAP://softserveinc.com";
            var dssearch = new DirectorySearcher(connection) { Filter = "(sAMAccountName=" + strName + ")" };
            var sresult = dssearch.FindOne();

            DirectoryEntry dsresult = sresult.GetDirectoryEntry();

            return dsresult.Properties["mail"][0].ToString();


        }

        internal static string GetNameWithoutDomain(string login)
        {
            // Parse the string to check if domain name is present.
            int idx = login.IndexOf('\\');
            if (idx == -1)
            {
                idx = login.IndexOf('@');
            }

            string strName = idx != -1 ? login.Substring(idx + 1) : login;
            return strName;
        }
    }
}