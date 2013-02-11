using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace GamificationStatusTracker
{
    internal class TrackerDal
    {
        internal const string ConnectionString =
            "Data Source=SCIENCE;Initial Catalog=DC_Gamification;User ID=sa;Password=Password1;Application Name=DC Gamification Service;";
       
        public DataSet GetListCompletedNotVerifiedMission()
        {
            using (var conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                    using (SqlCommand sqlCommand = conn.CreateCommand())
                    {
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        sqlCommand.CommandText = "USP_MISSIONS_GET_SUBMITED_NOT_VERIFIED";

                        var result = new DataSet();
                        using (var adapter = new SqlDataAdapter())
                        {
                            adapter.SelectCommand = sqlCommand;
                            adapter.Fill(result);

                            return result;
                        }
                    }

            }


        }

        internal DataSet GetListFailedMission()
        {
            using (var conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (SqlCommand sqlCommand = conn.CreateCommand())
                {
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.CommandText = "USP_MISSIONS_CHECK_DEAD_LINE";

                    var result = new DataSet();
                    using (var adapter = new SqlDataAdapter())
                    {
                        adapter.SelectCommand = sqlCommand;
                        adapter.Fill(result);

                        return result;
                    }
                }

            }
        }
    }
}
