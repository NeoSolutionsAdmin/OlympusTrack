using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    public class User
    {
        string i_User;
        string i_Pass;
        int i_Rol;
        int i_Id;
        Role i_Role;
        string i_email = null;


        //Id UserName Rol Password

        public string USER { get { return i_User; } }
        public Role ROLE { get { return i_Role; } }
        public int ID { get { return i_Id; } }
        public String EMAIL{ get { return i_email; } }

        private User(DataRow p_DR)
        {
            i_User = p_DR["UserName"].ToString();
            i_Pass = p_DR["Password"].ToString();
            i_Rol = int.Parse(p_DR["Rol"].ToString());
            i_Id = int.Parse(p_DR["Id"].ToString());
            i_Role = Role.GetRolById(i_Rol);
            if (p_DR.IsNull("Email") == false)
            {
                i_email = p_DR["Email"].ToString();
            }
            else
            {
                i_email = null;
            }
        }


        public static User getUserById(int UserId)
        {
            DataRow dr = Connection.User.SelectUserById(UserId);
            if (dr != null)
            {
                return new User(dr);

            }
            else
            {
                return null;
            }
        }

        public static User Login(string p_username, string p_password)
        {
            DataRow DR = Connection.User.Login(p_username, p_password);
            if (DR == null)
            {
                return null;
            }
            else
            {
                return new User(DR);
            }
        }

    }
}
