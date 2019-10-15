<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrl_PostViewer.ascx.cs" Inherits="ctrl_PostViewer" %>
<div id="viewerwindow" style="
    position:fixed;
    display:none;
    top:0;
    left:0;
    background-color:rgba(40, 11, 72, 0.51);
    border-radius:10px;
    padding-left:20px;
    padding-right:20px;
    width: 20%;
	max-height: 500px;
	overflow: hidden;
	overflow-y: scroll;">
    <span onclick="CloseViewer()" style="background-color:#062b41;font-family: Roboto Mono, monospace;color:#808080"> CERRAR </span>
<div id="postviewer">
</div>
</div>