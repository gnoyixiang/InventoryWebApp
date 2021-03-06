﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class AssignRoleDAO : IAssignRoleDAO
    {

        

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
        public int AddTemporaryRole(string assignrolecode,string temporaryrolecode,string employeecode)
        {
            using (EntityModel em = new EntityModel())
            {
                AssignRole asrl = new AssignRole();
                asrl.AssignRoleCode = assignrolecode;
                asrl.TemporaryRoleCode = temporaryrolecode;
                asrl.EmployeeCode = employeecode;
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


        public int UpdateAssignRole(string assignrolecode, string temporaryrolecode,string empCode,DateTime startdate, 
            DateTime enddate,string assignedBy)
        {
            using (EntityModel em = new EntityModel())
            {
                AssignRole asrl = em.AssignRoles.Where(x => x.AssignRoleCode == assignrolecode).First();
                asrl.TemporaryRoleCode = temporaryrolecode;
                asrl.EmployeeCode = empCode;
                asrl.StartDate = startdate;
                asrl.EndDate = enddate;
                asrl.AssignedBy = assignedBy;
                return em.SaveChanges();
            }
        }

        public int UpdateAssignRole(string assignrolecode, string temporaryrolecode,
           DateTime startdate, DateTime enddate)
        {
            using (EntityModel em = new EntityModel())
            {
                AssignRole asrl = em.AssignRoles.Where(x => x.AssignRoleCode == assignrolecode).First();
                asrl.TemporaryRoleCode = temporaryrolecode;
                asrl.StartDate = (DateTime)startdate;
                asrl.EndDate = (DateTime)enddate;
                return em.SaveChanges();
            }
        }

        public int UpdateAssignRole(AssignRole role)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(role).State = System.Data.Entity.EntityState.Modified;
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
                return em.AssignRoles.Where(p => p.EmployeeCode.Equals(empcode)).Select(p => p.TemporaryRoleCode).FirstOrDefault();




            }

        }

        

        public List<AssignRole> SearchByEmployeeCode(string empCode)
        {

            using (EntityModel em = new EntityModel())
            {
                return em.AssignRoles.Where(x => x.EmployeeCode.Contains(empCode.Trim())).ToList<AssignRole>();

            }
        }
        public List<AssignRole> ListAssignRoleByEmpCode(string empCode)
        {

            using (EntityModel em = new EntityModel())
            {
                return em.AssignRoles.Where(x => x.EmployeeCode==(empCode.Trim())).ToList<AssignRole>();

            }
        }
        //public List<string> SearchByEmployeeName(string empName)
        //{

        //    using (EntityModel em = new EntityModel())
        //    {
        //        // return em.Employees.Where(x => x.EmployeeName.ToLower().Contains(empName.Trim().ToLower())).ToList<Employee>();

        //       var q =  (from p in em.Employees
        //         join e in em.AssignRoles
        //         on p.EmployeeCode equals e.EmployeeCode
        //         where p.EmployeeName.Contains(empName.Trim())
        //         select new { p.EmployeeName }).ToList<string>;




        //        return q;



        //    }
        //}

    }
}
