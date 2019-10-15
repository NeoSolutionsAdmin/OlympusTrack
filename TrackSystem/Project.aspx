<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Project.aspx.cs" Inherits="Project" %>

<%@ Register Src="~/TrackControls/ctrl_LoginBar.ascx" TagPrefix="TrackControls" TagName="ctrl_LoginBar" %>
<%@ Register Src="~/TrackControls/ctrl_ProjectsList.ascx" TagPrefix="TrackControls" TagName="ctrl_ProjectsList" %>
<%@ Register Src="~/TrackControls/ctrl_SprintItem2.ascx" TagPrefix="TrackControls" TagName="ctrl_SprintItem2" %>
<%@ Register Src="~/TrackControls/ctrl_Stats.ascx" TagPrefix="TrackControls" TagName="ctrl_Stats" %>
<%@ Register Src="~/TrackControls/ctrl_PostViewer.ascx" TagPrefix="TrackControls" TagName="ctrl_PostViewer" %>
<%@ Register Src="~/TrackControls/ctrl_LastComments.ascx" TagPrefix="TrackControls" TagName="ctrl_LastComments" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="Scripts/Chart.bundle.min.js"></script>
    <script src="Scripts/Main.js"></script>
    <link rel="stylesheet" href="Css/main.css" />
    <link href="https://fonts.googleapis.com/css?family=Charm" rel="stylesheet"> 
    <script src='js/snowfall.jquery.js'></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Page_Title" class="XmasFont"><img src="/Icons/Muerdago.png" width="64px" height="64px" /> Olympus Software - Track <img src="/Icons/Muerdago.png" width="64px" height="64px" /></div>
        <div id="PlaceHolderControlBar">
            <TrackControls:ctrl_LoginBar runat="server" ID="ctrl_LoginBar" />
        </div>
        <div runat="server" id="Estado" class="Page_SubTitle NormalFontColor"></div>
        <div id="PlaceHolderProject" class="NormalFontColor Page_SubTitle">
            <div>
                Proyecto: <% 
                              if (Session[Entities.Constants.Key_Sessions.ProjectKey] != null)
                              {
                                  Response.Write((Session[Entities.Constants.Key_Sessions.ProjectKey] as Entities.Models.Project).NAME);

                              }
                              else
                              {
                                  Response.Write("Ninguno");
                              }
                %>
            </div>
        </div>
        <div>
            <span class="NormalFontColor NormalFont">Nuevo Sprint: </span><asp:TextBox runat="server" Id="txtNuevoSprint"></asp:TextBox><asp:Button runat="server" ID="btnNuevoSprint" Text="Crear Nuevo Sprint"  OnClick="btnNuevoSprint_Click"/>
        </div>
        <table style="width:100%">
            <tr>
                <td style="vertical-align:top;width:75%">
                    <div id="SprintsLists" runat="server">
                    </div>
                </td>
                <td style="vertical-align:top;width:25%">
                    <div id="DivStats" runat="server"></div>
                    <TrackControls:ctrl_LastComments runat="server" id="ctrl_LastComments" />
                    <TrackControls:ctrl_PostViewer runat="server" ID="ctrl_PostViewer" />
                </td>
            </tr>
        </table>


    </form>
    <script>
        ContractAllSprints();
        ContractAllComments();
        $(document).ready(function(){
			
$(document).snowfall({deviceorientation : true, round : true, minSize: 1, maxSize:8,  flakeCount : 250});

});
    </script>
</body>
</html>
