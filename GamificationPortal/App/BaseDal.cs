using Microsoft.Practices.EnterpriseLibrary.Data;

namespace GamificationPortal.App
{
    internal class BaseDal
    {
        private const string StrConnectionStringName = "GamificationDB";
        private Database _database;

      
         protected Database Database
        {
            get { return _database ?? (_database = DatabaseFactory.CreateDatabase(StrConnectionStringName)); }
        }
    }
}