using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class tokencode
    {
    public string token;
    public string url;
    }

public partial class ctrl_Post2 : System.Web.UI.UserControl
{

    private Post i_Post;
    private List<string> FilesList = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void setPost(Entities.Models.Post p_Post, int level, ref int CounterComment, ref int CounterBug, ref int CounterTask, ref int CounterDone)
    {
       

        i_Post = p_Post;
        VerBranch.Attributes.Add("OnClick", "JsonAndTable(" + i_Post.ID + ")");

        if (i_Post.TASK == Post.PosttypeAchievement) CounterDone++;
        if (i_Post.TASK == Post.PosttypeComment) CounterComment++;
        if (i_Post.TASK == Post.PosttypeBug) CounterBug++;
        if (i_Post.TASK == Post.PosttypeTask) CounterTask++;
        cmbChangePostType.SelectedValue = i_Post.TASK;
        BuildPost(level, ref CounterComment, ref CounterBug, ref CounterTask, ref CounterDone);
        string path = Server.MapPath("/Images");
        ListDirectory(path);
        User U = Session[Entities.Constants.Key_Sessions.UserKey] as User;
        if (p_Post.TASK == Post.PosttypeComment) imgposttype.Attributes.Add("src", "/Icons/comment.png");
        if (p_Post.TASK == Post.PosttypeAchievement) imgposttype.Attributes.Add("src", "/Icons/done.png");
        if (p_Post.TASK == Post.PosttypeBug) imgposttype.Attributes.Add("src", "/Icons/bug.png");
        if (p_Post.TASK == Post.PosttypeTask) imgposttype.Attributes.Add("src", "/Icons/task.png");
        if (i_Post.USER.ID != U.ID)
        {
            btnBorrarComment.Visible = false;
        }
    }

    void ListDirectory(string path)
    {
        IEnumerable<string> files = System.IO.Directory.EnumerateFiles(path);
        char[] spl = { '.' };
        foreach (string f in files)
        {

            System.IO.FileInfo FI = new System.IO.FileInfo(f);
            

            if (int.Parse(FI.Name.Substring(4).Split(spl)[0]) == i_Post.ID)
            {
                HtmlGenericControl a = new HtmlGenericControl("a");
                a.Attributes.Add("href", "/Images/" + FI.Name);
                a.Attributes.Add("style", "margin-left:5px;margin-right:5px");
                a.InnerText = FI.Name;
                fileslist.Controls.Add(a);
            }
        }

    }

    private string TratamientoLink(string cadena)
    {
        List<tokencode> TC = new List<tokencode>();
        string micadena = cadena;
        string[] cadenas = cadena.Split(new[] { " " },StringSplitOptions.None);
        for(int a = 0;a < cadenas.Length; a++)
        {
            cadenas[a] += " ";
        }
        int found = 0;
        for (int a = 0; a < cadenas.Length; a++)
        {
            if (cadenas[a].ToLower().StartsWith("http") || cadenas[a].ToLower().StartsWith("www"))
            {
                found++;
                tokencode tc = new tokencode();
                tc.token = "[LINK" + found.ToString() + "] ";
                tc.url = cadenas[a];
                TC.Add(tc);
                cadenas[a] = tc.token;
            }
        }

        micadena = "";

        for (int a = 0; a < cadenas.Length; a++)
        {
            micadena += cadenas[a];
        }

        cadenas = micadena.Split(new[] { Environment.NewLine }, StringSplitOptions.None);
        for (int a = 0; a < cadenas.Length; a++)
        {
            cadenas[a] += Environment.NewLine;
        }
        
        for (int a = 0; a < cadenas.Length; a++)
        {
            if (cadenas[a].ToLower().StartsWith("http") || cadenas[a].ToLower().StartsWith("www"))
            {
                found++;
                tokencode tc = new tokencode();
                tc.token = "[LINK" + found.ToString() + "]";
                tc.url = cadenas[a];
                TC.Add(tc);
                cadenas[a] = tc.token;
            }
        }
        micadena="";

        for (int a = 0; a < cadenas.Length; a++)
        {
            micadena += cadenas[a];
        }

        for (int a = 0; a < TC.Count; a++)
        {
            micadena = micadena.Replace(TC[a].token, "<a href=\"" +  TC[a].url + "\">" + TC[a].url + "</a>");
        }

        

        return micadena;

    }

    void BuildPost(int level, ref int CounterComment, ref int CounterBug, ref int CounterTask, ref int CounterDone)
    {

        string[] lines = TratamientoLink(i_Post.BODY).Split(new[] { Environment.NewLine }, StringSplitOptions.None);
        foreach(string s in lines) { 
        txtPostContent.InnerHtml+= s + "<br/>";
        }
        nombreusuario.InnerText = i_Post.USER.USER;
        Fecha.InnerText = i_Post.DATE.ToShortDateString() + " " + i_Post.DATE.ToShortTimeString() + " Post N:"+i_Post.ID.ToString();

        

        rol.InnerText = "(" + i_Post.USER.ROLE.ROL + ")";
        if (i_Post.CHILDRENPOSTS.Count > 0) { 
        CantidadRespuestas.InnerText = "Cantidad de comentarios:" + i_Post.CHILDRENPOSTS.Count.ToString();
        }
        if (i_Post.CHILDRENPOSTS.Count > 0)
        {
            foreach (Post p in i_Post.CHILDRENPOSTS)
            {
                ctrl_Post2 c = LoadControl("ctrl_Post2.ascx") as ctrl_Post2;
                c.setPost(p, level + 1,ref CounterComment,ref CounterBug,ref CounterTask,ref CounterDone);
                ChildPosts.Controls.Add(c);

            }
        }
    }


    protected void txtSendComment_Click(object sender, EventArgs e)
    {
        Entities.Models.Post.NewChildPost((Session[Entities.Constants.Key_Sessions.UserKey] as User), txtAnswer.Text, i_Post,cmbcommenttype.SelectedValue);
        List<User> ul = (Session[Entities.Constants.Key_Sessions.ProjectKey] as Project).GetUsers();
        if (ul != null && ul.Count > 0)
        {
            foreach (User u in ul)
            {
                if (u.EMAIL != null)
                {
                    Entities.staticFunctions.sendMail(u.USER, u.EMAIL, "Comentario de tracker from:" + (Session[Entities.Constants.Key_Sessions.UserKey] as User).USER, txtAnswer.Text);
                }
            }
        }
        Response.Redirect("/Project.aspx");
    }

    protected void btnUploadFile_Click(object sender, EventArgs e)
    {
        char[] splt = { '.' };
        if (adjuntarArchivo.HasFile == true) {

            string extension = adjuntarArchivo.FileName.Split(splt)[1];


            adjuntarArchivo.SaveAs(Server.MapPath("/Images") + "\\" + GetRanromL() + GetRanromL() + GetRanromL() + GetRanromL() + i_Post.ID.ToString() + "." + extension);

            Response.Redirect("/Project.aspx");

                }
    }

    private string GetRanromL ()
    {
        Random R = new Random(DateTime.Now.Millisecond);
        int selectedRand = 0;

        for (int a = 0; a < 1000; a++)
        {
            selectedRand = R.Next(1, 20);
            R = new Random(DateTime.Now.Millisecond+a);
        }

        if (selectedRand == 1) return "A";
        if (selectedRand == 2) return "B";
        if (selectedRand == 3) return "C";
        if (selectedRand == 4) return "D";
        if (selectedRand == 5) return "E";
        if (selectedRand == 6) return "F";
        if (selectedRand == 7) return "G";
        if (selectedRand == 8) return "H";
        if (selectedRand == 9) return "I";
        if (selectedRand == 10) return "J";
        if (selectedRand == 11) return "K";
        if (selectedRand == 12) return "L";
        if (selectedRand == 13) return "M";
        if (selectedRand == 14) return "N";
        if (selectedRand == 15) return "O";
        if (selectedRand == 16) return "P";
        if (selectedRand == 17) return "Q";
        if (selectedRand == 18) return "R";
        if (selectedRand == 19) return "S";
        if (selectedRand == 20) { return "T"; } else { return "U"; } 

    }


    protected void btnBorrarComment_Click(object sender, EventArgs e)
    {
        i_Post.Delete();
        Response.Redirect("/Project.aspx");
    }



    protected void cmbChangePostType_SelectedIndexChanged(object sender, EventArgs e)
    {
        i_Post.ChangeType(cmbChangePostType.SelectedValue);
        Response.Redirect("/Project.aspx");

    }
}
