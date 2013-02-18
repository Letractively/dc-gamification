using GamificationPortal.Account;

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

        public string UserAvatarUrl;
        
        public int CompletedMissions;
        public int FailedMissions;
        public string Specialization;

        public string UserEmblemUrl { get; set; }
    }
}