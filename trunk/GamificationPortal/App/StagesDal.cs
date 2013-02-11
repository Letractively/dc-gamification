using System;
using System.Data;

namespace GamificationPortal.App
{
    internal class StagesDal : BaseDal
    {
        public void InsertNewStage(string descriptions, DateTime starDate, DateTime endDate)
        {
            Database.ExecuteNonQuery("USP_STAGE_CREATE", new object[] {descriptions, starDate, endDate });
        }

        public DataSet GetStagesList()
        {
            return Database.ExecuteDataSet(CommandType.Text,
@"SELECT 
    StageId
    ,Description
    ,Start_Date
    ,End_Date 
    ,CASE 
        WHEN END_DATE < GETDATE() THEN 'Completed'
        WHEN START_DATE > GETDATE() THEN 'Comming Soon'
        ELSE 'In Progress'
    END as Status
FROM  dbo.Stages");
        }

        public bool CheckDates(DateTime date, DateTime dateTime)
        {
            return true;
        }

        public bool TryDelete(int stageId)
        {
            try
            {
                Database.ExecuteNonQuery(CommandType.Text, "DELETE FROM dbo.Stages WHERE StageId = " + stageId.ToString());
            }
            catch (Exception)
            {

                return false;
            }

            return true;
        }
        public DateTime? GetNextStageDate()
        {
            var result = Database.ExecuteScalar(CommandType.Text,
                                                "SELECT TOP 1 Start_Date FROM dbo.Stages WHERE Start_Date > GETDATE() ORDER BY Start_Date");
            if (result != null)
                return
                    Convert.ToDateTime(result);
            else
            {
                return null;
            }
        }

        public DataSet GetNotCompletedStagesList()
        {
            return Database.ExecuteDataSet(CommandType.Text,
                                           "SELECT StageId, Description FROM dbo.Stages WHERE END_Date > GETDATE() ORDER BY Start_Date");

        }
    }
}