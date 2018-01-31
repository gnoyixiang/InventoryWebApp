using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.DAO
{
    public class DepartmentDAO : IDepartmentDAO
    {
        EntityModel em = new EntityModel();
        public int AddDepartment(Department dept)
        {
            using (EntityModel em = new EntityModel())
            {
                /*Department dept = new Department();
                dept.DepartmentCode = deptCode;
                dept.DepartmentName = deptName;
                dept.CollectionPointCode = point;
                dept.Contact_Name = contact;
                dept.TelephoneNo = phone;
                dept.FaxNo = fax;
                dept.HeadCode = head;
                dept.RepresentativeCode = rep;*/
                em.Departments.Add(dept);
                return em.SaveChanges();
            }

        }
        public int UpdateDepartment(string deptCode, string phone, string fax, string head)
        {
            using (EntityModel em = new EntityModel())
            {
                Department dept = em.Departments.Where(x => x.DepartmentCode == deptCode).First();
                dept.TelephoneNo = phone;
                dept.FaxNo = fax;
                dept.HeadCode = head;
                return em.SaveChanges();
            }
        }

        public int UpdateCollectionPoint(Department dpt)
        {
            using (EntityModel em = new EntityModel())
            {
                Department depart = em.Departments.Where(x => x.DepartmentCode == dpt.DepartmentCode).FirstOrDefault();
                if (depart != null)
                {
                    depart.CollectionPointCode = dpt.CollectionPointCode;
                    return em.SaveChanges();
                }
                else
                    return 0;
                //string deptCode, string point
                //Department dept = em.Departments.Where(x => x.DepartmentCode == deptCode).FirstOrDefault();
                //dept.CollectionPointCode = point;
                //return em.SaveChanges();
            }
        }

        public int UpdateRep(string deptCode, string rep)
        {
            using (EntityModel em = new EntityModel())
            {
                Department dept = em.Departments.Where(x => x.DepartmentCode == deptCode).First();
                dept.RepresentativeCode = rep;
                return em.SaveChanges();
            }
        }

        public List<Department> ListDepartment()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Departments.ToList<Department>();
            }
        }

        public Department GetDepartmentInfo(string deptCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Departments.Where(x => x.DepartmentCode == deptCode).FirstOrDefault();
            }
        }

        public List<Department> SearchByPoint(string point)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Departments.Where(x => x.CollectionPointCode == point).ToList<Department>();
            }
        }
        public string GetDepartCode(string userName)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Departments.Where(x => x.Employee.UserName.Equals(userName)).Select(p => p.DepartmentCode).FirstOrDefault();
            }
        }

        public string GetCollectionPoint(string deptName)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Departments.Where(x => x.DepartmentName.Equals(deptName)).Select(p => p.CollectionPointCode).FirstOrDefault();
            }
        }
        public string GetDepartCodeByName(string deptName)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Departments.Where(x => x.DepartmentName.Equals(deptName)).Select(p => p.DepartmentCode).FirstOrDefault();
            }
        }
        public string GetDeptNameByCode(string deptCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Departments.Where(x => x.DepartmentCode.Equals(deptCode)).Select(x => x.DepartmentName).FirstOrDefault();
            }
        }
    }
}