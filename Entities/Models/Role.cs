using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    public class Role
    {
        int i_Id;
        string i_Role;

        public string ROL { get { return i_Role; } }

        private Role(DataRow p_DR)
        {
            i_Id = int.Parse(p_DR["Id"].ToString());
            i_Role = p_DR["Rol"].ToString();

        }

        public static Role GetRolById(int p_RoleId)
        {
            DataRow DR = Connection.Role.SelectRoleById(p_RoleId);
            if (DR != null)
            {
                return new Role(DR);
            }
            else
            {
                return null;
            }
        }
    }
}
