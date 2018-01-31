using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class AssignRoleDAO : IAssignRoleDAO
    {

        EntityModel em = new EntityModel();
        
        public int AddAssignRole(string assignrolecode, string temporaryrolecode, string employeecode,
            DateTime startdate, DateTime enddate, string assignedby)
        {

            using (EntityModel em = new EntityModel())
            {
                AssignRole asrl = new AssignRole();
                asrl.AssignRoleCode = assignrolecode;
                asrl.TemporaryRoleCode = temporaryrolecode;
                asrl.EmployeeCode = employeecode;
                asrl.StartDate = startdate;
                asrl.EndDate = enddate;
                asrl.AssignedBy = assignedby;
                em.AssignRoles.Add(asrl);
                return em.SaveChanges();
            }

        }

        public void DeleteAssignRole(string assignrolecode)
        {
            using (EntityModel em = new EntityModel())
            {

                AssignRole asrl = em.AssignRoles.Where(x => x.AssignRoleCode == assignrolecode).First();
                em.AssignRoles.Remove(asrl);
                em.SaveChanges();
            }
        }


        public int UpdateAssignRole(string assignrolecode, string temporaryrolecode,
            DateTime startdate, DateTime enddate)
        {
            using (EntityModel em = new EntityModel())
            {
                AssignRole asrl = em.AssignRoles.Where(x => x.AssignRoleCode == assignrolecode).First();
                asrl.TemporaryRoleCode = temporaryrolecode;
                asrl.StartDate = startdate;
                asrl.EndDate = enddate;
                return em.SaveChanges();
            }
        }
        public int UpdateStartDate(string assignrolecode, DateTime startdate)
        {
            using (EntityModel em = new EntityModel())
            {
                AssignRole asrl = em.AssignRoles.Where(x => x.AssignRoleCode == assignrolecode).First();
                asrl.StartDate = startdate;

                return em.SaveChanges();
            }
        }
        public int UpdateEndDate(string assignrolecode, DateTime enddate)
        {
            using (EntityModel em = new EntityModel())
            {
                AssignRole asrl = em.AssignRoles.Where(x => x.AssignRoleCode == assignrolecode).First();
                asrl.EndDate = enddate;
                return em.SaveChanges();
            }
        }
        public int UpdateTemporaryRoleCode(string assignrolecode, string temporaryrolecode)
        {
            using (EntityModel em = new EntityModel())
            {
                AssignRole asrl = em.AssignRoles.Where(x => x.AssignRoleCode == assignrolecode).First();
                asrl.TemporaryRoleCode = temporaryrolecode;
                return em.SaveChanges();
            }
        }
        public List<AssignRole> ListAssignRole()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.AssignRoles.ToList<AssignRole>();
            }
        }

        public AssignRole GetAssignRoleInfo(string assignrolecode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.AssignRoles.Where(p => p.AssignRoleCode ==
                assignrolecode).FirstOrDefault<AssignRole>();
            }

        }
        public string GetTemporaryRoleCode(string empcode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.AssignRoles.Where(p => p.EmployeeCode == empcode).Select(p => p.TemporaryRoleCode).FirstOrDefault();
            }
        }
    }

}
