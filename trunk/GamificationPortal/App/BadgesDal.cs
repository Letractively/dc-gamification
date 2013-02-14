using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace GamificationPortal.App
{
    internal class BadgesDal : BaseDal
    {
        internal int RegisterNewBadgesFileGroup(string name, string message, string description, string badgeType, int ruleId)
        {
            return Convert.ToInt32(Database.ExecuteScalar("USP_BADGES_REGISTER_NEW_GROUP", new object[] { name, message, description, badgeType, ruleId }));
        }

        internal void RegisterNewBadgeInFileGroup(int fileGroup, Guid fileKey, int position)
        {
            switch (position)
            {
                case 0:
                    Database.ExecuteNonQuery(CommandType.Text,
                                     string.Format(
                                         "UPDATE dbo.BadgesCollection SET ImageFileKey = '{0}' WHERE FileGroupId = {1}",
                                         fileKey, fileGroup));
                    break;

                case 1:
                    Database.ExecuteNonQuery(CommandType.Text,
                                     string.Format(
                                         "UPDATE dbo.BadgesCollection SET LockedFileKey = '{0}' WHERE FileGroupId = {1}",
                                         fileKey, fileGroup));
                    break;
            }
        }

        internal DataSet GetBadgesCollection()
        {
            return Database.ExecuteDataSet(CommandType.StoredProcedure, "USP_BADGES_GET_COLLECTION ");
        }

        public void DeleteBadgesFileGroup(int groupId)
        {
            Database.ExecuteNonQuery(CommandType.Text,
                                     string.Format("DELETE FROM dbo.BadgesCollection WHERE FileGroupId = {0}", groupId));
        }

        internal int GetTotalBadgesCount()
        {
            return Convert.ToInt32(Database.ExecuteScalar(CommandType.Text, "SELECT COUNT(*) FROM dbo.BadgesCollection"));
        }

        internal int GetUnlockedBadgesCount(Guid guid)
        {
            return
                Convert.ToInt32(Database.ExecuteScalar(CommandType.Text,
                                                       string.Format(
                                                           "select COUNT(*) FROM dbo.BadgesAssignedToUser WHERE UserId = '{0}'",
                                                           guid)));
        }

        internal DataSet GetBadgesByUserAndType(Guid userKey, string badgesType)
        {
            return Database.ExecuteDataSet("USP_BADGES_GET_BY_USER_AND_TYPE", new object[] { userKey, badgesType });
        }

        public string GetUnlockedBadgeFileName(Guid userKey, int groupId)
        {
            var result = Database.ExecuteScalar("USP_BADGES_GET_UNLOCKED_IMAGE_PATH", new object[] {userKey, groupId});
            if (result != null)
                return result.ToString();
            return null;
        }

        internal DataSet GetGrantRules()
        {
            return Database.ExecuteDataSet(CommandType.Text, @"select gr.* 
from dbo.GrantRulesDictionaty gr
LEFT JOIN dbo.BadgesCollection bg ON
	bg.GrantRuleId = gr.GrantRuleId
");
        }
    }
}