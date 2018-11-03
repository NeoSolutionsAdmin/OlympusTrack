<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Project.aspx.cs" Inherits="Project" %>

<%@ Register Src="~/TrackControls/ctrl_LoginBar.ascx" TagPrefix="TrackControls" TagName="ctrl_LoginBar" %>
<%@ Register Src="~/TrackControls/ctrl_ProjectsList.ascx" TagPrefix="TrackControls" TagName="ctrl_ProjectsList" %>
<%@ Register Src="~/TrackControls/ctrl_SprintItem2.ascx" TagPrefix="TrackControls" TagName="ctrl_SprintItem2" %>

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
</head>
<body>
    <form id="form1" runat="server">
        <div id="Page_Title" class="NormalFontColor">OLYMPUS SOFTWARE - TRACK</div>
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
                </td>
            </tr>
        </table>


    </form>
    <script>
        ContractAllSprints();
        ContractAllComments();
    </script>
</body>
</html>
