using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IEmployeeDAO
    {
        void AddEmployee(string reportTo, string deptCode, string role, string empName, string empTitle, string userName);
        void DeleteEmployee(string username);
        Employee GetEmployeeInfo(string username);
        Employee GetEmployeeByCode(string employeeCode);
        string GetEmployeeName(string username);
        List<Employee> ListEmployee();
        List<string> ListEmpName(string dept, string role);
        List<Employee> SearchByDept(string dept);
        List<Employee> SearchByRole(string role);
        void UpdateRole(string username, string role);
    }
}