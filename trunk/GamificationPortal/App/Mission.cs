using System;

namespace GamificationPortal.App
{
    public class Mission
    {
        public int MissionId;
        public string Name;
        public string Description;
        public int Reward;
        public string PlayerType;
        public string Owner;
        public DateTime StartDate;
        public DateTime EndDate;
        public string SkillsRequired;
        public int Status;
        public int Type;
        public int Complexity;
    }
}