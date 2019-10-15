using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Project : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkforurlcommand();
        BuildProject();
        BuildStatsCounters();
    }

    public int CountTask=0;
    public int CountDone=0;
    public int CountComment=0;
    public int CountBug=0;

    public int CountPaused=0;
    public int CountAnalyze = 0;
    public int CountDevelopment = 0;
    public int CountFinalize = 0;
    public int CountFeature = 0;

    private void BuildStatsCounters()
    {
        ctrl_Stats StatsCounter = LoadControl("TrackControls/ctrl_Stats.ascx") as ctrl_Stats;
        StatsCounter.SetCountersPost(CountComment, CountBug, CountTask, CountDone);
        StatsCounter.SetCountersSprint(CountPaused, CountAnalyze, CountDevelopment, CountFinalize, CountFeature);
        DivStats.Controls.Add(StatsCounter);
    }

    private void BuildProject()
    {
        if (Session[Entities.Constants.Key_Sessions.ProjectKey] != null)
        {
            Entities.Models.Project p = Session[Entities.Constants.Key_Sessions.ProjectKey] as Entities.Models.Project;
            if (p.SPRINTS != null)
            {
                
                List<Entities.Models.Sprint> sprintlist = p.SPRINTS;
                foreach (Entities.Models.Sprint s in sprintlist)
                {
                    if (s.ESTADO == Sprint.EstadoPausado) CountPaused++;
                    if (s.ESTADO == Sprint.EstadoAnalisis) CountAnalyze++;
                    if (s.ESTADO == Sprint.EstadoDesarrollo) CountDevelopment++;
                    if (s.ESTADO == Sprint.EstadoFinalizado) CountFinalize++;
                    if (s.ESTADO == Sprint.EstadoFeature) CountFeature++;


                    ctrl_SprintItem2 spritem = LoadControl("TrackControls/ctrl_SprintItem2.ascx") as ctrl_SprintItem2;
                    spritem.setSprint(s,ref CountComment,ref CountBug,ref CountTask, ref CountDone);
                    SprintsLists.Controls.Add(spritem);
                }
            }
        }

        

    }

    private void RedirectTome()
    {
        Response.Redirect("/Project.aspx");
    }

    private void removeProjectFromSession()
    {
        Session.Remove(Entities.Constants.Key_Sessions.ProjectKey);
    }

    private void checkforurlcommand()
    {
        if (Request["openproject"] != null)
        {
            int idproject = int.Parse(Request["openproject"].ToString());
            Entities.Models.Project p = Entities.Models.Project.GetProjectById(idproject);
            Entities.Models.User u = Session[Entities.Constants.Key_Sessions.UserKey] as Entities.Models.User;
            if (p != null)
            {
                if (u != null)
                {
                    if (p.CheckUserAuth(u) == true)
                    {
                        removeProjectFromSession();
                        Session.Add(Entities.Constants.Key_Sessions.ProjectKey, p);
                        RedirectTome();
                    }
                    else
                    {
                        Estado.InnerText = "No esta autorizado para este proyecto";
                        removeProjectFromSession();
                    }
                }
                else
                {
                    Estado.InnerText = "Usted no esta autenticado en el sistema";
                    removeProjectFromSession();
                }
            }
            else
            {
                Estado.InnerText = "el proyecto no existe";
                removeProjectFromSession();
            }

        }
    }

    protected void btnNuevoSprint_Click(object sender, EventArgs e)
    {
        Entities.Models.Sprint.CreateNewSprint(Session[Entities.Constants.Key_Sessions.UserKey] as Entities.Models.User,Session[Entities.Constants.Key_Sessions.ProjectKey] as Entities.Models.Project,txtNuevoSprint.Text,0);
        Response.Redirect("/Project.aspx");

    }
}