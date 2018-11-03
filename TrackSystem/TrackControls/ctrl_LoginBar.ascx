<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrl_LoginBar.ascx.cs" Inherits="ctrl_LoginBar" %>
<div>
<span class="NormalLabel NormalFontColor">Nombre de usuario:</span><span class="NormalLabel" id="span_username" runat="server"></span>
<span class="NormalLabel NormalFontColor">Rol:</span><span class="NormalLabel" id="span_permiso" runat="server"></span>
<span id="btnLogin" runat="server" > <input type="button" value="Ingresar" id="LoginButton"  onclick="OpenLogin()"/></span>
<span id="btnLogout" runat="server" > <input type="button" value="Salir" id="LogoutButton" onclick="LogOut()"/></span>
<span style="margin-left:20px"><a href="/">Home/Inicio/Casa</a></span>
</div>
<div id="WindowLogin" class="NormalLabel" title="INGRESO DE USUARIO">
    Usuario:   <input type="text" id="txt_usr" /><br />
    Contraseña: <input type="password" id="txt_pwd" /><br />
    <input type="button" value ="Ingresar" onclick="logme()" />
    <input type="button" value ="Cancelar" onclick="CloseLogin()" />
</div>
<script>
    $("#WindowLogin").dialog(
        {
            autoOpen: false,
            modal: true,
            dialogClass: "alert",
            draggable:false
        });
    function OpenLogin()
    {
        $("#WindowLogin").dialog("open");
        $("#WindowLogin").siblings(".ui-dialog-titlebar").find(".ui-dialog-titlebar-close").hide();
    }
    function logme()
    {
        CloseLogin();
        var usr = $("#txt_usr").val();
        var pwd = $("#txt_pwd").val();
        window.location.href = "/?usr="+usr+"&pwd="+pwd;
    }
    function LogOut()
    {
       window.location.href = "/?logout=1";
    }
    function CloseLogin()
    {
        $("#WindowLogin").dialog("close");
    }
</script>


