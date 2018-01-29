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



        public int UpdateDepartment(string deptCode, string phone, string fax, string head)
        {
            Department dept = em.Departments.Where(x => x.DepartmentCode == deptCode).First();
            dept.TelephoneNo = phone;
            dept.FaxNo = fax;
            dept.HeadCode = head;
            return em.SaveChanges();
        }

        public int UpdateCollectionPoint(string deptCode, string point)
        {
            Department dept = em.Departments.Where(x => x.DepartmentCode == deptCode).First();
            dept.CollectionPointCode = point;
            return em.SaveChanges();
        }

        public int UpdateRep(string deptCode, string rep)
        {
            Department dept = em.Departments.Where(x => x.DepartmentCode == deptCode).First();
            dept.RepresentativeCode = rep;
            return em.SaveChanges();
        }

        public List<Department> ListDepartment()
        {

            return em.Departments.ToList<Department>();
        }

        public Department GetDepartmentInfo(string deptCode)
        {
            return em.Departments.Where(x => x.DepartmentCode == deptCode).FirstOrDefault();
        }

        public List<Department> SearchByPoint(string point)
        {
            return em.Departments.Where(x => x.CollectionPointCode == point).ToList<Department>();
        }

        public int UpdateCollectionPoint(Department dpt)
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

        public string GetCollectionPoint(string deptName)
        {
            return em.Departments.Where(x => x.DepartmentName.Equals(deptName)).Select(p => p.CollectionPointCode).FirstOrDefault();
        }
        public string GetDepartCodeByName(string deptName)
        {
            return em.Departments.Where(x => x.DepartmentName.Equals(deptName)).Select(p => p.DepartmentCode).FirstOrDefault();
        }
        public string GetDeptNameByCode(string deptCode)
        {
            return em.Departments.Where(x => x.DepartmentCode.Equals(deptCode)).Select(x => x.DepartmentName).FirstOrDefault();
        }
    }
}