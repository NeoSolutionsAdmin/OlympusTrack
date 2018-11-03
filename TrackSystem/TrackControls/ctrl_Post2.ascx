<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrl_Post2.ascx.cs" Inherits="ctrl_Post2" %>
<div class="post">
<div class="NormalFont"><img runat="server" id="imgposttype" width="16" height="16" /><span id="nombreusuario" class="NormalFontColor" runat="server"></span></span><span id="rol" class="HighlightFontColor" runat="server"></span>:</div>
<asp:Button ID="btnBorrarComment" Text="Borrar" runat="server" OnClick="btnBorrarComment_Click" />
    <span class="NormalLabel NormalFontColor">Cambiar Tipo de post:</span>
<asp:DropDownList ID="cmbChangePostType" runat="server" OnSelectedIndexChanged="cmbChangePostType_SelectedIndexChanged" AutoPostBack="true">
    <asp:ListItem Selected="True" Text="Comentario" Value="Comment"></asp:ListItem>
    <asp:ListItem Text="Tarea" Value="Task"></asp:ListItem>
    <asp:ListItem Text="Bug" Value="Bug"></asp:ListItem>
    <asp:ListItem Text="Realizado" Value="Done"></asp:ListItem>
</asp:DropDownList>
<div class="NormalLabel NormalFontColor ContentPost" runat="server" id="txtPostContent">
</div>
    
 <div class="NormalFont">
     <span>Archivos adjuntos:</span><span id="fileslist" runat="server"></span>
 </div>
<div><asp:FileUpload runat="server" ID="adjuntarArchivo" CssClass="buttonComment" /><asp:Button ID="btnUploadFile" Text="Subir Archivo" CssClass="buttonComment" runat="server" OnClick="btnUploadFile_Click" /></div>
<div><span class="NormalLabel NormalFontColor" id="Fecha" runat="server" ></span></div>
<div style="height:5px;background-color:black;width:100%"></div>
<br />
<asp:TextBox Width="25%" Height="16px" runat="server" ID="txtAnswer" TextMode="MultiLine" CssClass="response"></asp:TextBox>
<span class="NormalLabel NormalFontColor">Tipo de post:</span>
<asp:DropDownList ID="cmbcommenttype" runat="server">
    <asp:ListItem Selected="True" Text="Comentario" Value="Comment"></asp:ListItem>
    <asp:ListItem Text="Tarea" Value="Task"></asp:ListItem>
    <asp:ListItem Text="Bug" Value="Bug"></asp:ListItem>
    <asp:ListItem Text="Realizado" Value="Done"></asp:ListItem>
</asp:DropDownList>
    <asp:Button Text="Enviar Comentario" runat="server" ID="txtSendComment"  OnClick="txtSendComment_Click" CssClass="response buttonComment"/>
<div>
<input type="button" class="buttonComment CommentsPivot" value="Ver Comentarios" onclick="ToggleComment(this)" /><span runat="server" id="CantidadRespuestas" class="NormalLabel" style="background-color:red;color:white;font-weight:bolder"></span>
<div class="ChildPost" runat="server" id="ChildPosts"></div>
</div>
</div>

