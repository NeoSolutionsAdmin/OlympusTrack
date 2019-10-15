<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrl_LastComments.ascx.cs" Inherits="ctrl_LastComments" %>
<div>
    Ultimos Comentarios;
</div>
<div id="MinipostCointainer">
    <%
        if (Session[Entities.Constants.Key_Sessions.ProjectKey] != null)
        {
            Entities.Models.Project P = Session[Entities.Constants.Key_Sessions.ProjectKey] as Entities.Models.Project;

            List<Entities.Models.SimplifyModels.MinPost> MPL = Entities.Models.Post.GetLastMiniPosts(P.ID, 5);
            if (MPL != null)
            {
                foreach (Entities.Models.SimplifyModels.MinPost mp in MPL)
                {
                    if (mp!=null && mp.minibody!=null && mp.minibody.Trim() != "") {
                        Response.Write("<div Id=\"Post" + mp.id + "\" class=\"TabPost\">");
                        Response.Write("<div class=\"TabPostTitle\">");
                        Response.Write("("+  mp.date+") " + mp.user + "[ " + mp.userrol + "]");
                        Response.Write("</div>");
                        Response.Write("<div class=\"TabPostMiniBody\">");
                        Response.Write(mp.minibody + " ");
                        Response.Write("<span class=\"LinkSpan\" onclick=\"JsonAndTable(" + mp.id + ")\">[ver]</span>");
                        Response.Write("</div>");
                        Response.Write("</div>");
                    }
                }

            }

        }

        %>
</div>