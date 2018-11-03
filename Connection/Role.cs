using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Connection
{
    public static class Role
    {
        public static DataRow SelectRoleById(int p_RoleId)
        {
            TrackerDataSet.SelectRoleByIdDataTable DT = new TrackerDataSet.SelectRoleByIdDataTable();
            TrackerDataSetTableAdapters.SelectRoleByIdTableAdapter TA = new TrackerDataSetTableAdapters.SelectRoleByIdTableAdapter();
            TA.Fill(DT, p_RoleId);
            if (DT.Rows.Count > 0)
            {
                return DT.Rows[0];
            }
            else
            {
                return null;
            }
        }
    }
}
