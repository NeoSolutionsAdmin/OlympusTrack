using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Connection
{
    public static class Post
    {
        public static DataTable SelectPostBySprint(int p_SptintId)
        {
            TrackerDataSet.Select_PostBySprintDataTable DT = new TrackerDataSet.Select_PostBySprintDataTable();
            TrackerDataSetTableAdapters.Select_PostBySprintTableAdapter TA = new TrackerDataSetTableAdapters.Select_PostBySprintTableAdapter();
            TA.Fill(DT, p_SptintId);
            if (DT.Rows.Count > 0)
            {
                return DT;
            }
            else
            {
                return null;
            }
        }

        public static DataRow SelectPostById(int p_PostId)
        {
            TrackerDataSet.SelectPostByIdDataTable DT = new TrackerDataSet.SelectPostByIdDataTable();
            TrackerDataSetTableAdapters.SelectPostByIdTableAdapter TA = new TrackerDataSetTableAdapters.SelectPostByIdTableAdapter();
            TA.Fill(DT, p_PostId);
            if (DT.Rows.Count > 0)
            {
                return DT.Rows[0];
            }
            else
            {
                return null;
            }


        }

        public static DataTable SelectPostByParentpost(int p_ParentPost)
        {
            TrackerDataSet.Select_PostByParentPostDataTable DT = new TrackerDataSet.Select_PostByParentPostDataTable();
            TrackerDataSetTableAdapters.Select_PostByParentPostTableAdapter TA = new TrackerDataSetTableAdapters.Select_PostByParentPostTableAdapter();
            TA.Fill(DT, p_ParentPost);
            if (DT.Rows.Count > 0)
            {
                return DT;
            }
            else
            {
                return null;
            }
        }

        public static void InsertParentPost(int SprintId, int UserId, DateTime Date, string Body,string PostType)
        {
            TrackerDataSetTableAdapters.QueriesTableAdapter QTA = new TrackerDataSetTableAdapters.QueriesTableAdapter();
            QTA.InsertParentPost(SprintId, UserId, Utilities.DateTimeToSQLDateTime(Date), Body,PostType);
        }

        public static void DeletePost(int PostId)
        {
            TrackerDataSetTableAdapters.QueriesTableAdapter QTA = new TrackerDataSetTableAdapters.QueriesTableAdapter();
            QTA.DeletePost(PostId);
        }

        public static void InsertChildPost(int PostId, int UserId, DateTime Date, string Body, string PostType)
        {
            TrackerDataSetTableAdapters.QueriesTableAdapter QTA = new TrackerDataSetTableAdapters.QueriesTableAdapter();
            QTA.InsertChildPost(PostId, UserId, Utilities.DateTimeToSQLDateTime(Date), Body,PostType);
        }

        public static void ChangePostType(int PostId, string PostType)
        {
            TrackerDataSetTableAdapters.QueriesTableAdapter QTA = new TrackerDataSetTableAdapters.QueriesTableAdapter();
            QTA.ChangePostType(PostId, PostType);
        }

    }
}
