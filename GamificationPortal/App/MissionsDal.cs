using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Xml;

namespace GamificationPortal.App
{
    internal class MissionsDal : BaseDal
    {
        internal void CreateMission(string name, string descr, string skills, int type, int complexity, DateTime startDate, DateTime endDate, string playerType, Guid ownerId, Guid creatorKey)
        {
            Database.ExecuteNonQuery("USP_MISSION_CREATE", new object[] { name, descr, skills, type, complexity, startDate, endDate, playerType, ownerId, creatorKey });
        }

        internal void UpdateMission(int missionId, string name, string description, int reward, string playerType, Guid ownerId,
           DateTime startDate, DateTime endDate, string skillsRequired, int statusId, int typeId, int complexityId, int? stageId)
        {
            Database.ExecuteNonQuery("USP_MISSION_UPDATE", new object[] { missionId, name, description, playerType, ownerId,
            startDate, endDate, skillsRequired, statusId, typeId, complexityId, stageId });
        }

        internal DataSet GetAllMissionsList()
        {
            return Database.ExecuteDataSet(CommandType.StoredProcedure, "USP_MISSIONS_GET_ALL");
        }

        internal DataSet GetMissionsListForCurrentStage()
        {
            return Database.ExecuteDataSet(CommandType.StoredProcedure, "USP_MISSIONS_GET_FOR_CURRENT_STAGE");
        }

        internal DataSet GetMissionsListByUser(Guid userKey)
        {
            return Database.ExecuteDataSet("USP_MISSIONS_GET_BY_USER", new object[]{userKey});
        }

        internal DataSet GetMissionsListByUserAndStatus(Guid userKey, string missionStatus)
        {
            return Database.ExecuteDataSet("USP_MISSIONS_GET_BY_USER_AND_STATUS", new object[] { userKey, missionStatus });
        }

        internal void AssignMissionToUser(string missionId, Guid userId)
        {
            Database.ExecuteNonQuery("USP_MISSION_ASSIGN_TO_USER", new object[] { missionId, userId });
        }

        internal DataSet GetMissionTypes()
        {
            return Database.ExecuteDataSet(CommandType.Text, "SELECT TypeId, Description FROM dbo.MissionType");
        }

        internal DataSet GetMissionComplexityList()
        {
            return Database.ExecuteDataSet(CommandType.Text, "SELECT ComplexityId, Description FROM dbo.MissionComplexity");
        }

        internal DataSet GetMissionStatuses(int statusId)
        {
            return Database.ExecuteDataSet("USP_MISSIONS_GET_STATUS_LIST", new object[]{ statusId});
        }

        internal string GetMissionsListInXmlFormat()
        {
            var result = string.Empty;
            var resultset = GetMissionsListForCurrentStage();
            if (resultset != null && resultset.Tables.Count > 0)
            {
                var xmlDoc = new XmlDocument();
                XmlNode rootNode = xmlDoc.CreateElement("missionsList");
                xmlDoc.AppendChild(rootNode);

                foreach (DataRow row in resultset.Tables[0].Rows)
                {
                    XmlNode userNode = xmlDoc.CreateElement("mission");

                    var attributeMissionId = xmlDoc.CreateAttribute("MissionId");
                    attributeMissionId.Value = row["MissionId"].ToString();
                    userNode.Attributes.Append(attributeMissionId);

                    var attributeName = xmlDoc.CreateAttribute("Name");
                    attributeName.Value = row["Name"].ToString();
                    userNode.Attributes.Append(attributeName);

                    XmlAttribute attributeDescription = xmlDoc.CreateAttribute("Description");
                    attributeDescription.Value = row["Description"].ToString();
                    userNode.Attributes.Append(attributeDescription);

                    var attributeType = xmlDoc.CreateAttribute("TypeId");
                    attributeType.Value = row["TypeId"].ToString();
                    userNode.Attributes.Append(attributeType);

                    var attributeTypeDescr = xmlDoc.CreateAttribute("TypeDescription");
                    attributeTypeDescr.Value = row["TypeDescription"].ToString();
                    userNode.Attributes.Append(attributeTypeDescr);

                    var attributeReward = xmlDoc.CreateAttribute("Reward");
                    attributeReward.Value = row["Reward"].ToString();
                    userNode.Attributes.Append(attributeReward);

                    var attributeStartDate = xmlDoc.CreateAttribute("StartDate");
                    attributeStartDate.Value = row["StartDate"].ToString();
                    userNode.Attributes.Append(attributeStartDate);

                    var attributeEndDate = xmlDoc.CreateAttribute("EndDate");
                    attributeEndDate.Value = row["EndDate"].ToString();
                    userNode.Attributes.Append(attributeEndDate);

                    var attributeComplexity = xmlDoc.CreateAttribute("ComplexityId");
                    attributeComplexity.Value = row["ComplexityId"].ToString();
                    userNode.Attributes.Append(attributeComplexity);

                    var attributeComplexityDescr = xmlDoc.CreateAttribute("ComplexityDescription");
                    attributeComplexityDescr.Value = row["ComplexityDescription"].ToString();
                    userNode.Attributes.Append(attributeComplexityDescr);

                    var attributeStatusDescr = xmlDoc.CreateAttribute("StatusDescription");
                    attributeStatusDescr.Value = row["StatusDescription"].ToString();
                    userNode.Attributes.Append(attributeStatusDescr);

                    var attributeOwner = xmlDoc.CreateAttribute("Owner");
                    attributeOwner.Value = row["Owner"].ToString();
                    userNode.Attributes.Append(attributeOwner);

                    var attributeSkills = xmlDoc.CreateAttribute("SkillsRequired");
                    attributeSkills.Value = row["SkillsRequired"].ToString();
                    userNode.Attributes.Append(attributeSkills);
                    
                    rootNode.AppendChild(userNode);
                }
                result = xmlDoc.OuterXml;
            }
            return result;
        }

        internal bool IsMissionsLimitForUserDepleted(Guid userId)
        {
            return Convert.ToBoolean(Database.ExecuteScalar("USP_MISSIONS_IS_USER_LIMIT_DEPLETED", new object[] { userId }));
        }

        public Mission GetMissionCurrentByUser(Guid userKey)
        {
            Mission result = null;
            var dataset = Database.ExecuteDataSet("USP_MISSIONS_GET_BY_USER_AND_STATUS", new object[] { userKey, MissionStatus.InProgress });
            if (dataset != null && dataset.Tables.Count > 0 && dataset.Tables[0].Rows.Count > 0)
            {
                var row = dataset.Tables[0].Rows[0];
                result = new Mission
                    {
                        MissionId = Convert.ToInt32(row.ItemArray[0]),
                        Name = row.ItemArray[1].ToString(),
                        Description = row.ItemArray[2].ToString(),
                        SkillsRequired = row.ItemArray[3].ToString(),
                        Owner = row.ItemArray[4].ToString(),
                        Complexity = Convert.ToInt32(row.ItemArray[5]),
                        Reward = Convert.ToInt32(row.ItemArray[6]),
                        StartDate = Convert.ToDateTime(row.ItemArray[7]),
                        EndDate = Convert.ToDateTime(row.ItemArray[8])
                    };


            }
            return result;
        }

        internal void DropCurrentMission(Guid userKey)
        {
            Database.ExecuteNonQuery("USP_MISSION_DROP_BY_USER", new object[] {userKey});
        }

        public void SubmitCurrentMission(int missionId, Guid userKey)
        {
            Database.ExecuteNonQuery("USP_MISSION_SUBMIT_BY_USER", new object[] { missionId, userKey });
            
        }

        internal DataSet GetMissionsListByStatus(string statusDescription)
        {
            return Database.ExecuteDataSet("USP_MISSIONS_GET_BY_STATUS", new object[] { statusDescription });
        }

        public int GetMissionsCountByStatus(string statusDescription)
        {
            return Convert.ToInt32(Database.ExecuteScalar("USP_MISSIONS_GET_COUNT_BY_STATUS", new object[] { statusDescription }));
        }

        public int GetMissionsCountByUserAndRule(Guid userKey, int ruleId)
        {
            return
                Convert.ToInt32(Database.ExecuteScalar("USP_MISSIONS_GET_COUNT_BY_USER_AND_RULE",
                                                       new object[] {userKey, ruleId}));
        }

        internal string GetMissionOwnerLoginName(int missionId)
        {
            return Database.ExecuteScalar("USP_MISSIONS_GET_OWNER_LOGIN", new object[] {missionId}).ToString();

        }

        internal string GetMissionName(int missionId)
        {
            return Database.ExecuteScalar(CommandType.Text, string.Format("SELECT Name FROM dbo.Missions WHERE MissionId = {0}", missionId)).ToString();
        }
    }
}