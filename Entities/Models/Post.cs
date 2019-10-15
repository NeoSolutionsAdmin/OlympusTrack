using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
   
    public class Post
    {

        
        public static string PosttypeComment="Comment";
        public static string PosttypeBug = "Bug";
        public static string PosttypeTask = "Task";
        public static string PosttypeAchievement = "Done";

        List<Post> ChildrenPost = new List<Post>();
        int i_id;
        int i_userid;
        DateTime i_date;
        string i_body;
        int i_parentsprint=0;
        int i_parentpost=0;
        string i_type;

        
        
        public int ID { get { return i_id; } }
        public User USER { get { return User.getUserById(i_userid); } }
        public DateTime DATE { get { return i_date; } }
        public string BODY { get { return i_body; } }
        public string TASK { get { return i_type; } }

        public List<Post> CHILDRENPOSTS { get {
                DataTable dt = Connection.Post.SelectPostByParentpost(i_id);
                ChildrenPost.Clear();
                if (dt != null)
                {
                    for (int a = dt.Rows.Count - 1; a >= 0; a--)
                    {
                        DataRow dr = dt.Rows[a];
                        ChildrenPost.Add(new Post(dr));
                    }
                }
                return ChildrenPost;
            } }

        public void Delete()
        {
            Connection.Post.DeletePost(i_id);
        }

        public static void NewParentPost(User p_user, string p_body, Sprint p_sprint, string p_posttype)
        {
            Connection.Post.InsertParentPost(p_sprint.ID, p_user.ID, DateTime.Now, p_body, p_posttype);
        }

        public static void NewChildPost(User p_user, string p_body, Post p_post, string p_posttype)
        {
            Connection.Post.InsertChildPost(p_post.ID, p_user.ID, DateTime.Now, p_body, p_posttype);
        }

        public void ChangeType(string p_type)
        {
            i_type = p_type;
            Connection.Post.ChangePostType(i_id, p_type);
        }
        
        public static List<Post> GetPostsFromSprint(Sprint S)
        {
           DataTable dt = Connection.Post.SelectPostBySprint(S.ID);
            if (dt != null)
            {
                List<Post> tempposts = new List<Post>();
                {

                    for (int a = dt.Rows.Count - 1; a >= 0; a--)
                    {
                        DataRow dr = dt.Rows[a];
                        tempposts.Add(new Post(dr));
                    }

                    
                }
                return tempposts;
            }
            else
            {
                return null;
            }
        }

        public static List<SimplifyModels.MinPost> GetLastMiniPosts(int p_projectId, int p_length)
        {
            DataTable dt = Connection.Post.GetLastPosts(p_projectId, p_length);
            if (dt != null && dt.Rows.Count > 0)
            {
                List<SimplifyModels.MinPost> mpl = new List<SimplifyModels.MinPost>();
                foreach (DataRow dr in dt.Rows)
                {
                    Post P = new Post(dr);
                    SimplifyModels.MinPost MP = new SimplifyModels.MinPost(P);
                    mpl.Add(MP);
                }
                return mpl;
            }
            else
            {
                return null;
            }

        }

        public void GetBranch(ref List<Branch> MyBranch)
        {
            Branch b = new Branch(this);
            MyBranch.Add(b);
            if (i_parentpost != 0)
            {
                Post.SelectById(i_parentpost).GetBranch(ref MyBranch);                
            }
            if (i_parentsprint != 0)
            {
                Sprint.SelectById(i_parentsprint).GetBranch(ref MyBranch);
            }
        }

        public static Post SelectById(int PostID)
        {
            DataRow dr = Connection.Post.SelectPostById(PostID);
            if (dr != null)
            {
                return new Post(dr);
            }
            else { return null; }
        }

        private Post(DataRow p_dr)
        {
            /*
             * SprintId,PostId,UserId,[Date],Body
             */
            i_id = int.Parse(p_dr["Id"].ToString());
            i_userid = int.Parse(p_dr["UserId"].ToString());
            i_parentsprint = int.Parse(p_dr["SprintId"].ToString());
            i_parentpost = int.Parse(p_dr["PostId"].ToString());
            i_date = DateTime.Parse(p_dr["Date"].ToString());
            i_body = p_dr["Body"].ToString();
            if (p_dr.IsNull("Type") == true) { i_type = Post.PosttypeComment; } else { i_type = p_dr["Type"].ToString(); }
            
            DataTable dt = Connection.Post.SelectPostByParentpost(i_id);
            if (dt != null)
            {
                for (int a=dt.Rows.Count-1;a>=0;a--) 
                {
                    DataRow dr = dt.Rows[a];
                    ChildrenPost.Add(new Post(dr));
                }
            }
        }
    }
}
