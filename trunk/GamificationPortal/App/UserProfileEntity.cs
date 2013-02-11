namespace GamificationPortal.App
{
    public class UserProfileEntity
    {
        private string _userAvatar;

        public string Login;
        public string FullName;
        public int Expirience;
        public int NextLevelExp;
        public int PrevLevelExp;
        public int ExpToNextLevel
        {
            get { return NextLevelExp - Expirience; }
        }

      
        public string RankDescription;

        public string UserAvatarUrl 
        { 
            get
            {
                return _userAvatar;
            }
            set { _userAvatar = string.Format("~/Images/Users/{0}", value); }
        }

        public int CompletedMissions;
        public int FailedMissions;
        public string Specialization;
    }
}