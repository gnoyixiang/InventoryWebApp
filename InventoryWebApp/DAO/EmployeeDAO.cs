﻿using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.DAO
{
    public class EmployeeDAO
    {
        EntityModel em = new EntityModel();

        public EmployeeDAO()
        {

        }

        public void AddEmployee(string reportTo,string deptCode, string role,string empName, string empTitle, string userName)
        {


            Employee emp = new Employee();
            emp.ReportTo = reportTo;
            emp.DepartmentCode = deptCode;
            emp.CurrentRoleCode = role;
            emp.EmployeeName = empName;
            emp.EmployeeTitle = empTitle;
            emp.UserName = userName;

            em.Employees.Add(emp);
            em.SaveChanges();

        }

        public void DeleteEmployee(string username)
        {

            Employee emp= em.Employees.Where(x =>x.UserName==username).First();
            em.Employees.Remove(emp);
            em.SaveChanges();
        }
        public Employee GetEmployeeInfo(string username)
        {
            return em.Employees.Where(x =>x.UserName==username).FirstOrDefault();
        }

        public void UpdateRole(string username, string role)
        {
           Employee emp = em.Employees.Where(x => x.UserName==username).First();
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

        public List<string> ListEmpName(string dept,string role)
        {
            return em.Employees.Where(x=>x.DepartmentCode==dept&&x.CurrentRoleCode==role).Select(x.EmployeeName).ToList();
        }
    }
}