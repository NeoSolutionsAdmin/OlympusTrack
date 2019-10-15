using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

public partial class WebService_GetPosts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Response.Clear();
        Response.ClearContent();
        Response.ClearHeaders();
        Response.ContentType = "text/plain";
        List<Branch> MyList = new List<Branch>();

        if (Request["PostId"] != null)
        {
            Post P = Post.SelectById(int.Parse(Request["PostId"].ToString()));
            if (P != null)
            {
                P.GetBranch(ref MyList);



                JavaScriptSerializer JSS = new JavaScriptSerializer();


                List<Branch> MyReverseList = new List<Branch>();
                for (int a = MyList.Count - 1; a >= 0; a--)
                {
                    MyReverseList.Add(MyList[a]);
                }

                string serializer = JSS.Serialize(MyReverseList);
                Response.Write(serializer);

            }
            else
            {
                Response.Write("null");
            }
            Response.End();
        }
    }
}