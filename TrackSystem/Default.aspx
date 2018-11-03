<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Src="~/TrackControls/ctrl_LoginBar.ascx" TagPrefix="TrackControls" TagName="ctrl_LoginBar" %>
<%@ Register Src="~/TrackControls/ctrl_ProjectsList.ascx" TagPrefix="TrackControls" TagName="ctrl_ProjectsList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="Css/main.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="Page_Title" class="NormalFontColor">OLYMPUS SOFTWARE - TRACK</div>
        <div id="PlaceHolderControlBar">
            <TrackControls:ctrl_LoginBar runat="server" ID="ctrl_LoginBar" />
        </div>
        <div id="PlaceHolderProjects">
            <TrackControls:ctrl_ProjectsList runat="server" ID="ctrl_ProjectsList" />
        </div>
    </form>
</body>
</html>
