using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            em.SaveChanges();

        }

        public void DeleteEmployee(string username)
        {

            Employee emp = em.Employees.Where(x => x.UserName == username).First();
            em.Employees.Remove(emp);
            em.SaveChanges();
        }
        public Employee GetEmployeeInfo(string username)
        {
            return em.Employees.Where(x => x.UserName == username).FirstOrDefault();
        }

        public Employee GetEmployeeByCode(String employeeCode)
        {
            em = new EntityModel();
            return em.Employees.Where(e => e.EmployeeCode == employeeCode).First();
        }

        public void UpdateRole(string username, string role)
        {
            Employee emp = em.Employees.Where(x => x.UserName == username).First();
            emp.CurrentRoleCode = role;
            em.SaveChanges();
        }

        public List<Employee> ListEmployee()
        {

            return em.Employees.ToList();
        }

        public string GetEmployeeName(string username)
        {
            Employee emp = em.Employees.Where(x => x.UserName == username).FirstOrDefault();
            return emp.EmployeeName;
        }

        public List<Employee> SearchByRole(string role)
        {
            return em.Employees.Where(x => x.CurrentRoleCode.Equals(role.Trim())).ToList();
        }

        public List<Employee> SearchByDept(string dept)
        {
            return em.Employees.Where(x => x.Department.Equals(dept.Trim())).ToList();
        }

        public List<string> ListEmpName(string dept, string role)
        {
            return em.Employees.Where(x => x.DepartmentCode == dept && x.CurrentRoleCode == role).Select(x=>x.EmployeeName).ToList();
        }

        public List<Employee> SearchByEmployeeName(string empName)
        {
            
            using (EntityModel em = new EntityModel())
            {
              return  em.Employees.Where(x => x.EmployeeName.ToLower().Contains(empName.Trim().ToLower())).ToList<Employee>();

            }

        }

        public List<Employee> SearchByEmployeeCode(string empCode)
        {

            using (EntityModel em = new EntityModel())
            {
             return em.Employees.Where(x => x.EmployeeCode.Contains(empCode.Trim())).ToList<Employee>();

            }
        }

        public List<string> ListOfEmployeeCode(string name)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Employees.Where(x => x.EmployeeName.Contains(name.Trim())).Select(x => x.EmployeeCode).ToList<string>();

            }

        }

        int IEmployeeDAO.UpdateRole(string username, string role)
        {
            throw new NotImplementedException();
        }
    }
}