using System;
using System.Collections.Generic;

namespace GamificationPortal.Account
{
    public class UserEntity
    {
        public string UserId;
        public string Login;
        public string Name;
        public DateTime LastActivityDate;
        public string Mail;
        public string Department;
        public string Office;

        private List<string> _list = null;

        public List<string> List
        {
            get
            {
                if (_list == null)
                {
                    _list = new List<string> {Login, Name, Mail, Department, Office};
                }

                return _list;
            }
            set
            {
                _list = value;
            }
        }
    }
}