using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities.Constants;
using Entities.Models;

public partial class ctrl_LoginBar : System.Web.UI.UserControl
{


    protected void Page_Load(object sender, EventArgs e)
    {
        CheckLoginAction();
        CheckUser();
    }

    void CheckLoginAction()
    {
        if (Request["usr"] != null && Request["pwd"] != null)
        {
            User U =  Entities.Models.User.Login(Request["usr"].ToString(), Request["pwd"].ToString());
            if (U != null)
            {
                Session.Timeout = 600;
                Session.Add(Key_Sessions.UserKey, U);
                
            }
            RedirectToMe();
        }
        if (Request["logout"] != null)
        {
            Session.Remove(Key_Sessions.UserKey);
            RedirectToMe();
        }
    }

    void RedirectToMe()
    {
        Response.Redirect("/");
    }

    void CheckUser()
    {
        //No hay usuario logeado

        if (Session[Key_Sessions.UserKey] == null)
        {
            span_permiso.InnerText = "No tiene permisos";
            span_username.InnerText = "Invitado";
            btnLogout.Visible = false;
        }
        else
        {
            span_username.InnerText = (Session[Key_Sessions.UserKey] as User).USER;
            if ((Session[Key_Sessions.UserKey] as User).ROLE != null)
            {
                span_permiso.InnerText = (Session[Key_Sessions.UserKey] as User).ROLE.ROL;
            }
            else
            {
                span_permiso.InnerText = "Usuario sin Rol";
            }
            btnLogin.Visible = false;
        }
    }

   
}
