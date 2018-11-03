using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Connection
{
    public static class Sprint
    {
        public static void ChangeSprintState(int IdSprint, string State)
        {
            TrackerDataSetTableAdapters.QueriesTableAdapter QTA = new TrackerDataSetTableAdapters.QueriesTableAdapter();
            QTA.ChangeSprintState(IdSprint, State);
        }

        public static Boolean InsertSprint(int UserId, int ProjectId, DateTime Created, string Description, int EstimatedDays)
        {
            TrackerDataSetTableAdapters.QueriesTableAdapter QTA = new TrackerDataSetTableAdapters.QueriesTableAdapter();
            if (QTA.InsertSprint(UserId, ProjectId, Utilities.DateTimeToSQLDateTime(Created), Description, EstimatedDays) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static DataRow SelectSprintById(int SprintId)
        {
            TrackerDataSet.SelectSprintByIdDataTable DT = new TrackerDataSet.SelectSprintByIdDataTable();
            TrackerDataSetTableAdapters.SelectSprintByIdTableAdapter TA = new TrackerDataSetTableAdapters.SelectSprintByIdTableAdapter();
            TA.Fill(DT,SprintId);
            if (DT.Rows.Count > 0)
            {
                return DT.Rows[0];
            }
            else
            {
                return null;
            }
        }

        public static DataTable SelectSprintsByProjects(int IdProject)
        {
            TrackerDataSet.SelectSprintsByProjectIdDataTable DT = new TrackerDataSet.SelectSprintsByProjectIdDataTable();
            TrackerDataSetTableAdapters.SelectSprintsByProjectIdTableAdapter TA = new TrackerDataSetTableAdapters.SelectSprintsByProjectIdTableAdapter();
            TA.Fill(DT, IdProject);
            if (DT.Rows.Count > 0)
            {
                return DT;
            }
            else
            {
                return null;
            }
        }

        public static DataRow SelectLastSprint()
        {
            TrackerDataSet.SelectLastSprintDataTable DT = new TrackerDataSet.SelectLastSprintDataTable();
            TrackerDataSetTableAdapters.SelectLastSprintTableAdapter TA = new TrackerDataSetTableAdapters.SelectLastSprintTableAdapter();
            TA.Fill(DT);
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
