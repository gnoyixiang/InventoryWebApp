using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class BusinessLogic : System.Web.UI.Page
    {

        public static void AddAssignRole(String assignrolecode, String temporaryrolecode,
            String employeecode, DateTime startdate, DateTime enddate, String assignedby)
        {
            using (EntityModel entities = new EntityModel())
            {
                AssignRole assignrole = new AssignRole
                {
                    AssignRoleCode = assignrolecode,
                    TemporaryRoleCode = temporaryrolecode,
                    EmployeeCode = employeecode,
                    StartDate = startdate,
                    EndDate = enddate,
                    AssignedBy = assignedby
                };
                entities.AssignRoles.Add(assignrole);
                entities.SaveChanges();
            }
        }

        public static void UpdateAssignRole(String assignrolecode, 
            String temporaryrolecode, DateTime startdate, DateTime enddate)
        {
            using (EntityModel entities = new EntityModel())
            {
                AssignRole assignrole = entities.AssignRoles.Where
                    (p => p.AssignRoleCode == assignrolecode).First<AssignRole>();
                assignrole.TemporaryRoleCode = temporaryrolecode;
                assignrole.StartDate = startdate;
                assignrole.EndDate = enddate;
                entities.SaveChanges();
            }
        }

        public static void DeleteOrder(String assignrolecode)
        {
            using (EntityModel entities = new EntityModel())
            {
                AssignRole assignrole = entities.AssignRoles.Where
                     (p => p.AssignRoleCode == assignrolecode).First<AssignRole>();
                entities.AssignRoles.Remove(assignrole);
                entities.SaveChanges();
            }
        }

        public static List<AssignRole> ListAssignRolesBy(String assignrolecode)
        {
            using (EntityModel entities = new EntityModel())
            {
                return entities.AssignRoles.Where(p => p.AssignRoleCode == assignrolecode).ToList<AssignRole>();
            }
        }

        public static List<Role> RoleChoice()
        {
            using (EntityModel entities = new EntityModel())
            {
                return entities.Roles.ToList<Role>();
            }
        }

        public static string GetRoleName(String rolecode)
        {
            using (EntityModel entities = new EntityModel())
            {
                Role role = entities.Roles.Where(f => f.RoleCode == rolecode).ToList<Role>()[0]; ;
                return role.RoleName;
            }
        }
    }
}
