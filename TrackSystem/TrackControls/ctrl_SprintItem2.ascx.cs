using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ctrl_SprintItem2 : System.Web.UI.UserControl
{

    private Entities.Models.Sprint i_sprint;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void setSprint(Entities.Models.Sprint p_sprint, ref int CounterComment, ref int CounterBug, ref int CounterTask, ref int CounterDone)
    {
        i_sprint = p_sprint;
        SpanTitle.InnerText = i_sprint.DESCRIPTION;
        SpanDate.InnerText = i_sprint.CREATED.ToShortDateString();
        SpanUser.InnerText = i_sprint.USER.USER;
        jtestado.InnerText = "(" + i_sprint.ESTADO + ")";
        string state;
        
            jtestado.Attributes["class"] = "NormalLabel ST" + i_sprint.ESTADO.ToLower();
        //#666666 pausado
        //#66ff66 desarrollo
        //#6666ff analisis
        //#ffffff finalizado

        List<Post> PostsList = Post.GetPostsFromSprint(i_sprint);
        
        if (PostsList!=null && PostsList.Count > 0)
        {
            CantSprintPosts.InnerText = PostsList.Count.ToString();
        }
        else
        {
            CantSprintPosts.Visible = false;
        }
            if (PostsList != null)
            {
                foreach (Post p in PostsList)
                {
                
                ctrl_Post2 controlpost = LoadControl("ctrl_Post2.ascx") as ctrl_Post2;
                controlpost.setPost(p,1, ref CounterComment, ref CounterBug, ref CounterTask, ref CounterDone);
                POSTS.Controls.Add(controlpost);
                }
            }
        
    }



        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Entities.Models.Post.NewParentPost((Session[Entities.Constants.Key_Sessions.UserKey] as Entities.Models.User), TxtParentPost.Text, i_sprint,Post.PosttypeComment);
            Response.Redirect("/Project.aspx");

        }

    protected void btnPausado_Click(object sender, EventArgs e)
    {
        i_sprint.ChangeState(Sprint.EstadoPausado);
        Response.Redirect("/Project.aspx");
    }

    protected void btnAnalisis_Click(object sender, EventArgs e)
    {
        i_sprint.ChangeState(Sprint.EstadoAnalisis);
        Response.Redirect("/Project.aspx");
    }

    protected void btnDesarrollo_Click(object sender, EventArgs e)
    {
        i_sprint.ChangeState(Sprint.EstadoDesarrollo);
        Response.Redirect("/Project.aspx");
    }

    protected void btnFinalizado_Click(object sender, EventArgs e)
    {
        i_sprint.ChangeState(Sprint.EstadoFinalizado);
        Response.Redirect("/Project.aspx");
    }
}
