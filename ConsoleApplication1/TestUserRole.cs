using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleTestApp
{
    class TestUserRole
    {
        public static void Main()
        {
            IUserDAO udao = new UserDAO();
            IRoleDAO rdao = new RoleDAO();
            string username = "amit@logic.edu.sg";
            string roleid = "Rep";
            User u = udao.GetUserByUsername(username);
            Role r = rdao.GetRoleInfo(roleid);
            udao.UpdateUserRole(u,r);
        }


    }
}
