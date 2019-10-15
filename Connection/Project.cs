using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Connection
{
    public static class Project
    {
        public static DataTable SelectAllProjects()
        {
            TrackerDataSet.SelectAllProjectsDataTable DT = new TrackerDataSet.SelectAllProjectsDataTable();
            TrackerDataSetTableAdapters.SelectAllProjectsTableAdapter TA = new TrackerDataSetTableAdapters.SelectAllProjectsTableAdapter();
            TA.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                return DT;
            }
            else
            {
                return null;
            }
        }

        public static DataTable SelectIdUsersByProjectId(int p_ProjectId)
        {
            TrackerDataSet.SelectUsersByIdProjectDataTable DT = new TrackerDataSet.SelectUsersByIdProjectDataTable();
            TrackerDataSetTableAdapters.SelectUsersByIdProjectTableAdapter TA = new TrackerDataSetTableAdapters.SelectUsersByIdProjectTableAdapter();
            TA.Fill(DT, p_ProjectId);
            if (DT.Rows.Count > 0)
            {
                return DT;
            }
            else
            {
                return null;
            }

        }

        public static DataRow SelectProjectById(int p_ProjectId)
        {
            TrackerDataSet.SelectProjectByIdDataTable DT = new TrackerDataSet.SelectProjectByIdDataTable();
            TrackerDataSetTableAdapters.SelectProjectByIdTableAdapter TA = new TrackerDataSetTableAdapters.SelectProjectByIdTableAdapter();
            TA.Fill(DT, p_ProjectId);
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
