<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrl_SprintItem2.ascx.cs" Inherits="ctrl_SprintItem2" %>
<%@ Register Src="~/TrackControls/ctrl_Post2.ascx" TagPrefix="TrackControls" TagName="ctrl_Post2" %>
<div class="Sprint" style="margin-bottom:20px;">
    <div class="" id="Header">
        <input class="button" type="button" value="+" onclick="ToggleSprint(this)" /><br />
        <span class="NormalLabel NormalFontColor description">Sprint:</span><span class="NormalLabel HighlightFontColor description" runat="server" id="SpanTitle"></span><justtext id="jtestado" class="NormalLabel" runat="server"></justtext>
        
            <justtext class="CantSubPost" id="CantSprintPosts" runat="server"></justtext><br />
        <span class="NormalLabel NormalFontColor">
        <asp:Button Text="P" runat="server" ID="btnPausado" OnClick="btnPausado_Click"/>
        <asp:Button Text="A" runat="server" ID="btnAnalisis" OnClick="btnAnalisis_Click"/>
        <asp:Button Text="D" runat="server" ID="btnDesarrollo" OnClick="btnDesarrollo_Click" />
        <asp:Button Text="F" runat="server" ID="btnFinalizado" OnClick="btnFinalizado_Click" />
        <asp:Button Text="Ft." runat="server" ID="btnFeature" OnClick="btnFeature_Click" /></span><br />
        <span class="NormalLabel NormalFontColor">Fecha:</span><span class="NormalLabel HighlightFontColor" runat="server" id="SpanDate"></span><br />
        <span class="NormalLabel NormalFontColor">Usuario:</span><span class="NormalLabel HighlightFontColor" runat="server" id="SpanUser"></span><br />
    </div>
    <div class="CommentsPane" runat="server" id="CommentsPane">
        <div runat="server" id="POSTS">

        </div>
        <asp:TextBox TextMode="MultiLine" Width="100%"  runat="server" ID="TxtParentPost" CssClass="response">
            
        </asp:TextBox>
        <br />
        <asp:Button class="Button" Text="Guardar" ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" CssClass="response buttonComment" />
    </div>
</div>
