using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class EmployeeDAO : IEmployeeDAO
    {
        EntityModel em = new EntityModel();

        public int AddEmployee(Employee emp)
        {


            /* Employee emp = new Employee();
             emp.EmployeeCode = empCode;
             emp.ReportTo = reportTo;
             emp.DepartmentCode = deptCode;
             emp.CurrentRoleCode = role;
             emp.EmployeeName = empName;
             emp.EmployeeTitle = empTitle;
             emp.UserName = userName;*/

            em.Employees.Add(emp);
            return em.SaveChanges();

        }

        public void DeleteEmployee(string username)
        {

            Employee emp = em.Employees.Where(x => x.UserName == username).First();
            em.Employees.Remove(emp);
            em.SaveChanges();
        }
        public Employee GetEmployeeInfo(string username)
        {
            return em.Employees.Where(x => x.UserName.Contains(username)).FirstOrDefault();
        }

        public Employee GetEmployeeInfoByEmployeeCode(string employeecode)
        {
            return em.Employees.Where(x => x.EmployeeCode.Contains(employeecode)).FirstOrDefault();
        }
        public int UpdateEmployeeRole(string employeecode, string rolecode)
        {
            Employee emp = em.Employees.Where(x => x.EmployeeCode == employeecode).First();
            emp.CurrentRoleCode = rolecode;
            return em.SaveChanges();
        }

        public List<Employee> ListEmployee()
        {

            return em.Employees.ToList();
        }

        public string GetEmployeeName(string a)
        {
            Employee emp = em.Employees.Where(x => x.UserName ==a || 
            x.EmployeeCode==a).FirstOrDefault();
            return emp.EmployeeName;
        }
       
        public List<Employee> SearchByRole(string role)
        { 
            return em.Employees.Where(x => x.CurrentRoleCode.Equals(role.Trim())).ToList();
        }

        public List<Employee> SearchByDept(string dept)
        {
            return em.Employees.Where(x => x.DepartmentCode.Equals(dept.Trim())).ToList();
        }
        public List<Employee> SearchByEmployeeName(string employeename)
        {
            return em.Employees.Where(x => x.EmployeeName.Contains(employeename.Trim())).ToList();
        }
        public List<Employee> SearchByEmployeeCode(string employeecode)
        {
            return em.Employees.Where(x => x.EmployeeCode.Contains(employeecode.Trim())).ToList();
        }
        public List<string> ListEmpName(string dept, string role)
        {
            return em.Employees.Where(x => x.DepartmentCode == dept && x.CurrentRoleCode == role).Select(x => x.EmployeeName).ToList();
        }

        

    }
}