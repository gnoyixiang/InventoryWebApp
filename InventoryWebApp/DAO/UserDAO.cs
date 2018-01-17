using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class UserDAO : IUserDAO
    {
        public Role getRoleNameByUsername(string username)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Users.Where(u => u.UserName == username).FirstOrDefault<User>().Roles.FirstOrDefault<Role>();
            }
        }
    }
}