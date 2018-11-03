using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    public class Project
    {
        int i_id;
        string i_name;

        public string NAME { get { return i_name; } }
        public int ID { get { return i_id; } }
        public List<Sprint> SPRINTS { get { return Sprint.LoadProjectsSprints(this); } }

        private Project(DataRow p_dr)
        {
            i_id = int.Parse(p_dr["Id"].ToString());
            i_name = p_dr["Name"].ToString();
        }

        public bool CheckUserAuth(User p_user)
        {
            return Connection.User.CheckAuthorizationThrowProjectId(i_id, p_user.ID);
        }

        public static Project GetProjectById(int p_ProjectId)
        {
            DataRow dr = Connection.Project.SelectProjectById(p_ProjectId);
            if (dr != null)
            {
                return new Project(dr);
            }
            else
            {
                return null;
            }
        }

        

        public static List<Project> GetAllProjects()
        {
            DataTable dt = Connection.Project.SelectAllProjects();
            if (dt != null)
            {
                List<Project> projectlist = new List<Project>();
                foreach (DataRow dr in dt.Rows)
                {
                    projectlist.Add(new Project(dr));
                }
                return projectlist;
            }
            else
            {
                return null;
            }
        }
    }
}
