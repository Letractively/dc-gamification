using System;
using System.Data;

namespace GamificationPortal.App
{
    internal class UsersDal : BaseDal
    {
        public bool IsUserExists(string userName)
        {
            return Convert.ToBoolean(Database.ExecuteScalar("USP_IS_USER_EXISTS", new object[] { userName }));
        }

        public Guid RegisterNewUser(string loginWithDomain, string getUserFullNameByDomainIdentity)
        {
            var result =  Database.ExecuteScalar("USP_USERS_REGISTER_NEW",
                                          new object[] {loginWithDomain, getUserFullNameByDomainIdentity});
            Guid returnGuid;
            if (Guid.TryParse(result.ToString(), out returnGuid))
            {
                return returnGuid;
            }
            throw new Exception("User Registration failed.");
        }

        public void InsertUserWithDefaultRole(string userFullName)
        {
            Database.ExecuteNonQuery("USP_ADD_USER_WITH_DEFAULT_ROLE", new object[] { userFullName });
        }

        internal DataSet LoadUsersWithRoles()
        {
            return Database.ExecuteDataSet(CommandType.StoredProcedure, "USP_USERS_GET_WITH_ROLES");
        }

        public Guid GetUserGUIDByLogin(string loginWithDomain)
        {
            var id = Database.ExecuteScalar(CommandType.Text,
                                            String.Format("SELECT UserId FROM dbo.Users WHERE UserName = '{0}'",
                                                          loginWithDomain)).ToString();
            Guid userGUID;
            if (Guid.TryParse(id, out userGUID))
            {
                return userGUID;
            }
            throw new Exception("Failed to get user Identifier.");
        }


        internal void DeleteUser(Guid guid)
        {
            Database.ExecuteNonQuery("USP_DELETE_USER", new object[] { guid });
        }

        public bool UserHasActiveMissions(Guid guid)
        {
            return Convert.ToBoolean(Database.ExecuteScalar("USP_HAS_USER_ACTIVE_MISSIONS", new object[] { guid }));
        }

        public DataSet GetUserLeaderBordList()
        {
            return Database.ExecuteDataSet("USP_USER_GET_LEADER_BOARD_LIST", new object[] {0, 1});
        }

        internal UserProfileEntity GetUserProfile(Guid userKey)
        {
            UserProfileEntity result = null;
            var dataset = Database.ExecuteDataSet("USP_USER_GET_PROFILE", new object[] {userKey});
            if (dataset != null && dataset.Tables.Count > 0 && dataset.Tables[0].Rows.Count > 0)
            {
                result = new UserProfileEntity()
                    {
                        FullName = dataset.Tables[0].Rows[0].ItemArray[2].ToString(),
                        UserAvatarUrl = dataset.Tables[0].Rows[0].ItemArray[3].ToString(),
                        Expirience = Convert.ToInt32(dataset.Tables[0].Rows[0].ItemArray[4]),
                        PrevLevelExp= Convert.ToInt32(dataset.Tables[0].Rows[0].ItemArray[5]),
                        NextLevelExp = Convert.ToInt32(dataset.Tables[0].Rows[0].ItemArray[6]),
                      RankDescription = dataset.Tables[0].Rows[0].ItemArray[7].ToString(),
                        CompletedMissions = Convert.ToInt32(dataset.Tables[0].Rows[0].ItemArray[8]),
                        FailedMissions = Convert.ToInt32(dataset.Tables[0].Rows[0].ItemArray[9]),
                        Specialization = dataset.Tables[0].Rows[0].ItemArray[10].ToString()
                       
                    };
            }
            return result;
        }

        public void RegisterNewUserAvatar(string fileName, Guid userKey)
        {
            Database.ExecuteNonQuery(CommandType.Text,
                                     string.Format(@"UPDATE dbo.Users SET Image_key = '{0}' WHERE UserId = '{1}'", fileName, userKey.ToString()));
        }

        public DataSet GetOwnersList()
        {
            return Database.ExecuteDataSet("USP_USERS_GET_OWNERS");
        }
        
        public int GetUsersCount()
        {
            return Convert.ToInt32(Database.ExecuteScalar(CommandType.Text, "SELECT COUNT(*) as UsersCount FROM dbo.Users"));
        }

       
        internal DataSet GetUsersSpecializationList()
        {
            return Database.ExecuteDataSet(CommandType.Text,
                                           "SELECT SpecializationId, Description FROM dbo.UserSpecialization");
        }

        internal void UpdateUserSpecialization(int specializationId, Guid guid)
        {
            Database.ExecuteNonQuery(CommandType.Text,
                                     string.Format("UPDATE dbo.Users SET SpecializationId = {0} WHERE UserId = '{1}'",
                                                   specializationId, guid));
        }

        internal string GetUserSpecialization(Guid guid)
        {
            var result = Database.ExecuteScalar(CommandType.Text,
                                                string.Format(
                                                    @"SELECT us.Description as SpecializationDescription
    FROM dbo.Users u 
    JOIN dbo.UserSpecialization us ON
		us.SpecializationId = u.SpecializationId
        AND u.UserId = '{0}'", guid));
            return result != null ? result.ToString() : string.Empty;
        }

        public void UsersStatisticsUpdateLoginCount(Guid userKey)
        {
            Database.ExecuteNonQuery(CommandType.Text,
                                     string.Format(
                                         "EXEC dbo.USP_STATISTICS_UPDATE @UserId = '{0}', @LoginsCount = 1",
                                         userKey));
        }

        internal DataSet GetStageLeader(string p)
        {
            return Database.ExecuteDataSet("USP_STAGE_LEADER_GET", new object[] { p });
        }

        internal DataSet GetRewardsNotificationList(Guid guid)
        {
            return Database.ExecuteDataSet("USP_REWARDS_GET_NOTIFICATIONS", new object[] { guid });
        }
    }
}