using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    public class Branch
    {
        public string user;
        public string userrol;
        public string body;
        public string datatype;
        public string state;
        public string date;

        

        public Branch(Sprint p_sprint,string LineJumps = "</br>")
        {
            user = p_sprint.USER.USER;
            userrol = p_sprint.USER.ROLE.ROL;
            body = p_sprint.DESCRIPTION;
            datatype = "Sprint";
            state = p_sprint.ESTADO;
            date = staticFunctions.ConvertDateTimeToFullString(p_sprint.CREATED);
            
                body = body.Replace(Environment.NewLine, LineJumps);
            
        }

        public Branch(Post p_post, string LineJumps = "</br>")
        {
            user = p_post.USER.USER;
            userrol = p_post.USER.ROLE.ROL;
            body = p_post.BODY;
            datatype = "Post";
            state = p_post.TASK;
            date = staticFunctions.ConvertDateTimeToFullString(p_post.DATE);
            
                body = body.Replace(Environment.NewLine, LineJumps);
            
        }

        

    }
}
