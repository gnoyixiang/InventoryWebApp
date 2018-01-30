using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class RoleDAO :  IRoleDAO
    {
        public int AddRole(string id, String name)
        {
            using (EntityModel em = new EntityModel())
            {
                Role rl = new Role();
                rl.Id = id;
                rl.Name = name;
                em.Roles.Add(rl);
                return em.SaveChanges();
            }
        }
        public void DeleteRole(string id)
        {
            using (EntityModel em = new EntityModel())
            {
                Role rl = em.Roles.Where(x => x.Id == id).First();
                em.Roles.Remove(rl);
                em.SaveChanges();
            }
        }

        public int UpdateRole(string id, string name)
        {
            using (EntityModel em = new EntityModel())
            {
                Role rl = em.Roles.Where(x => x.Id == id).First();
                rl.Name = name;
                return em.SaveChanges();
            }
        }
        public List<Role> ListRole()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Roles.ToList<Role>();
            }
        }
        public string GetRoleName(string id)
        {
            using (EntityModel em = new EntityModel())
            {
                Role rl = em.Roles.Where(x => x.Id == id).FirstOrDefault();
                return rl.Name;
            }
        }
        public Role GetRoleInfo(string roleid)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Roles.Where(p => p.Id ==
                roleid).FirstOrDefault<Role>();
            }
        }
        public List<Role> ListAllDepartmentRole()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Roles.Where(x => x.Name.Contains("Department")).ToList<Role>();
            }
        }
    }
}