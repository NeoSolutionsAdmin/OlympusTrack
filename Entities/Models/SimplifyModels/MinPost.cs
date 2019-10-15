using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models.SimplifyModels
{
    public class MinPost
    {
        public int id;
        public string user;
        public string userrol;
        public string date;
        public string minibody;
        
        public MinPost(Post My_Post)
        {
            id = My_Post.ID;
            user = My_Post.USER.USER;
            userrol = My_Post.USER.ROLE.ROL;
            date = staticFunctions.ConvertDateTimeToFullString(My_Post.DATE);
            if (My_Post.BODY.Length >= 15)
            {
                minibody = My_Post.BODY.Trim().Substring(0, 15)+"...";
            }
                
        }
    }
}
