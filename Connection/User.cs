using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Connection
{
    public static class User
    {


        public static DataRow SelectUserById(int p_userid)
        {
            TrackerDataSet.SelectUserByIdDataTable DT = new TrackerDataSet.SelectUserByIdDataTable();
            TrackerDataSetTableAdapters.SelectUserByIdTableAdapter TA = new TrackerDataSetTableAdapters.SelectUserByIdTableAdapter();
            TA.Fill(DT, p_userid);
            if (DT.Rows.Count > 0)
            {
                return DT.Rows[0];
            }
            else
            {
                return null;
            }
        }

        public static DataRow Login(string user, string password)
        {
            TrackerDataSet.LoginUserDataTable DT = new TrackerDataSet.LoginUserDataTable();
            TrackerDataSetTableAdapters.LoginUserTableAdapter TA = new TrackerDataSetTableAdapters.LoginUserTableAdapter();
            TA.Fill(DT, user, password);
            if (DT.Rows.Count > 0)
            {
                return DT.Rows[0];
            }
            else
            {
                return null;
            }



        }

        public static Boolean CheckAuthorizationThrowProjectId(int ProjectId, int UserId)
        {
            TrackerDataSet.SelectProjectAuthorizationDataTable DT = new TrackerDataSet.SelectProjectAuthorizationDataTable();
            TrackerDataSetTableAdapters.SelectProjectAuthorizationTableAdapter TA = new TrackerDataSetTableAdapters.SelectProjectAuthorizationTableAdapter();
            TA.Fill(DT, UserId, ProjectId);
            if (DT.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

    }
}
