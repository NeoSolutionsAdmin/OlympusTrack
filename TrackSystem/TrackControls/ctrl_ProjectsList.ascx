<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrl_ProjectsList.ascx.cs" Inherits="ctrl_ProjectsList" %>
<%@ Import Namespace="Entities.Models" %>
<div class="Page_SubTitle NormalFontColor">
<% 
    if (Session[Entities.Constants.Key_Sessions.UserKey] != null)
    {
        Response.Write("Listado de proyectos");
    }
    %>    
</div>
<div>

<ul runat="server"  id="ProjectList">
    <%
        List<Project> projectlist = Project.GetAllProjects();
        if (Session[Entities.Constants.Key_Sessions.UserKey] != null && projectlist != null)
        {
            foreach (Project p in projectlist)
            {
                Response.Write("<li onclick=\"OpenProject('" + p.ID.ToString() + "')\">" + p.NAME + "</li>");
            }
        }
        %>
</ul>
</div>
<script>
    function OpenProject(project_id)
    {
        window.location.href = "/Project.aspx?openproject=" + project_id;
    }
</script>
