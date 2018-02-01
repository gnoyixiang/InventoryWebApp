using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using System.Data.Entity;

namespace InventoryWebApp.DAO
{
    public class UserDAO : IUserDAO
    {
        RoleDAO rDAO = new RoleDAO();
        public Role getRoleNameByUsername(string username)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Users.Where(u => u.UserName == username).FirstOrDefault<User>().Roles.FirstOrDefault<Role>();
            }
        }     
        public User GetUserByUsername(string username)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Users.Where(p => p.UserName ==
                username).FirstOrDefault<User>();
            }
        }
        public int UpdateUser(User user)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(user).State = EntityState.Modified;
                return em.SaveChanges();
            }
        }

        /* public int UpdateUserRole(User user, Role role)
         {
             using (EntityModel em = new EntityModel())
             {
                 User u = em.Users.Where(us => us.UserName == us.UserName).FirstOrDefault();
                 u.Roles.Clear();
                 Role r = rDAO.GetRoleInfo(role.Id);
                 u.Roles.Add(r);
                 return em.SaveChanges();
             }
         }
         */

        /*  public int RemoveRole(Role role)
          {
              using (EntityModel em = new EntityModel())
              {
               // em.Users.Where(x => x.UserName == emp.UserName).FirstOrDefault<User>().Roles.Remove(role);
                //return em.SaveChanges();
              }
          }
  */

    }
}