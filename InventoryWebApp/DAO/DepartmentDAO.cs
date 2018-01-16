using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class DepartmentDAO : IDepartmentDAO
    {
        EntityModel em = new EntityModel();

        public void AddDepartment(string deptCode, string deptName, string point, string contact, string phone, string fax, string head, string rep)
        {
            Department dept = new Department();
            dept.DepartmentCode = deptCode;
            dept.DepartmentName = deptName;
            dept.CollectionPointCode = point;
            dept.Contact_Name = contact;
            dept.TelephoneNo = phone;
            dept.FaxNo = fax;
            dept.HeadCode = head;
            dept.RepresentativeCode = rep;
            em.Departments.Add(dept);
            em.SaveChanges();

        }

        public void DeleteDepartment(string deptName)
        {

            Department dept = em.Departments.Where(x => x.DepartmentName == deptName).First();
            em.Departments.Remove(dept);
            em.SaveChanges();
        }


        public void UpdateDepartment(string deptCode, string phone, string fax, string head)
        {
            Department dept = em.Departments.Where(x => x.DepartmentCode == deptCode).First();
            dept.TelephoneNo = phone;
            dept.FaxNo = fax;
            dept.HeadCode = head;
            em.SaveChanges();
        }

        public void UpdateCollectionPoint(string deptCode, string point)
        {
            Department dept = em.Departments.Where(x => x.DepartmentCode == deptCode).First();
            dept.CollectionPointCode = point;
            em.SaveChanges();
        }

        public void UpdateRep(string deptCode, string rep)
        {
            Department dept = em.Departments.Where(x => x.DepartmentCode == deptCode).First();
            dept.RepresentativeCode = rep;
            em.SaveChanges();
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
            return em.Departments.Where(x => x.CollectionPoint.Equals(point.Trim())).ToList();
        }

    }
}