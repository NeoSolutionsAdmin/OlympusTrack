using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    
    public class Sprint
    {
        /* [Id] [bigint] IDENTITY(1,1) NOT NULL,

     [IdUser] [bigint]
         NOT NULL,

     [IdProject] [bigint]
         NOT NULL,

     [Created] [datetime]
         NOT NULL,

     [Description] [varchar] (255) NOT NULL,

      [EstimatedDays] [bigint]
         NOT NULL,*/
         public static string EstadoPausado="Pausado";
         public static string EstadoAnalisis = "Analisis";
         public static string EstadoDesarrollo = "Desarrollo";
         public static string EstadoFinalizado = "Finalizado";
        public static string EstadoFeature = "Feature";

         private int i_id;
         private int i_UserId;
         private int i_ProjectId;
         private DateTime i_Created;
         private string i_Description;
         private int i_EstimatedDays;
         private string i_Estado;

         public int ID { get { return i_id; } }
         public User USER { get { return User.getUserById(i_UserId); } }
         public Project PROJECT { get { return Project.GetProjectById(i_ProjectId); } }
         public DateTime CREATED { get { return i_Created; } }
         public string DESCRIPTION { get { return i_Description; } }
         public int ESTIMATEDTIME { get { return i_EstimatedDays; } }
         public string ESTADO { get { return i_Estado; } } 


         private Sprint(DataRow p_dr)
         {
            i_id = int.Parse(p_dr["Id"].ToString());
            i_UserId = int.Parse(p_dr["IdUser"].ToString());
            i_ProjectId = int.Parse(p_dr["IdProject"].ToString());
            i_Created = DateTime.Parse(p_dr["Created"].ToString());
            i_EstimatedDays = int.Parse(p_dr["EstimatedDays"].ToString());
            i_Description = p_dr["Description"].ToString();
            if (p_dr.IsNull("Estado") == true) { i_Estado = "Pausado"; } else { i_Estado = p_dr["Estado"].ToString(); }
         }

        public void ChangeState(string p_state)
        {
            i_Estado = p_state;
            Connection.Sprint.ChangeSprintState(i_id, i_Estado);

        }

        public static List<Sprint> LoadProjectsSprints(Project p_project)
        {
            DataTable dt = Connection.Sprint.SelectSprintsByProjects(p_project.ID);
            if (dt != null)
            {
                List<Sprint> sprintlist = new List<Sprint>();
                for (int a = dt.Rows.Count-1; a >= 0; a--) {

                    DataRow dr = dt.Rows[a];
                    sprintlist.Add(new Sprint(dr));
                }
                return sprintlist;
            }
            else
            {
                return null;
            }
        }

        public void GetBranch(ref List<Branch> MyBranch)
        {
            MyBranch.Add(new Branch(this));
        }

        public static Sprint SelectById(int p_sprintId)
        {
            DataRow dr = Connection.Sprint.SelectSprintById(p_sprintId);
            if (dr != null)
            {
                return new Sprint(dr);
            }
            else
            {
                return null;
            }

        }

        public static Sprint CreateNewSprint(User CreatedBy, Project ParentProject, string Description, int EstimatedDays)
        {
            Connection.Sprint.InsertSprint(CreatedBy.ID, ParentProject.ID, DateTime.Now, Description, EstimatedDays);
            DataRow dr = Connection.Sprint.SelectLastSprint();
            if (dr != null)
            {
                return new Sprint(dr);
            }
            else
            {
                return null;
            }

        }
    }
}
