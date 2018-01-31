using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class EmployeeDAO :  IEmployeeDAO
    {
        EntityModel em = new EntityModel();
        public Employee GetEmployeeByCode(String employeeCode)
        {
            using (EntityModel em = new EntityModel())
            {

                return em.Employees.Where(e => e.EmployeeCode == employeeCode).First();
            }
        }

        public Employee GetRepresentative(string departmentCode)
        {
            using (EntityModel em = new EntityModel())
            {
                List<Employee> eList = em.Employees.Where(x => x.DepartmentCode == departmentCode).ToList();
                foreach (var item in eList)
                {
                    if (item.AssignRoles == null)
                    {
                        break;
                    }
                    foreach (var item2 in item.AssignRoles)
                    {
                        if (item2.TemporaryRoleCode == "Rep")
                        {
                            return item;
                        }
                    }
                }
            }
            return null;
        }
        public int AddEmployee(Employee emp)
        {
            using (EntityModel em = new EntityModel())
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
        }

        public void DeleteEmployee(string username)
        {
            using (EntityModel em = new EntityModel())
            {

                Employee emp = em.Employees.Where(x => x.UserName == username).First();
                em.Employees.Remove(emp);
                em.SaveChanges();
            }
        }
        public Employee GetEmployeeInfo(string username)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Employees.Where(x => x.UserName.Equals(username)).FirstOrDefault();
            }
        }

        public int UpdateRole(string username, string role)
        {
            using (EntityModel em = new EntityModel())
            {
                Employee emp = em.Employees.Where(x => x.UserName == username).First();
                emp.CurrentRoleCode = role;
                return em.SaveChanges();
            }
        }

        public List<Employee> ListEmployee()
        {
            using (EntityModel em = new EntityModel())
            {

                return em.Employees.ToList();
            }
        }

        public string GetEmployeeName(string username)
        {
            using (EntityModel em = new EntityModel())
            {
                Employee emp = em.Employees.Where(x => x.UserName == username).FirstOrDefault();
                return emp.EmployeeName;
            }
        }

        public List<Employee> SearchByRole(string role)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Employees.Where(x => x.CurrentRoleCode.Equals(role.Trim())).ToList();
            }
        }

        public List<Employee> SearchByDept(string dept)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Employees.Where(x => x.DepartmentCode.Equals(dept.Trim())).ToList();
            }
        }

        public List<string> ListEmpName(string dept, string role)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Employees.Where(x => x.DepartmentCode == dept && x.CurrentRoleCode == role).Select(x => x.EmployeeName).ToList();
            }
        }


    }
}