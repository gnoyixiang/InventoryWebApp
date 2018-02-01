using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IEmployeeDAO
    {
        int AddEmployee(Employee emp);
        void DeleteEmployee(string username);
        Employee GetEmployeeInfo(string username);

        Employee GetEmployeeInfoByEmployeeCode(string employeecode);
        string GetEmployeeName(string a);
        List<Employee> ListEmployee();
        List<string> ListEmpName(string dept, string role);
        List<Employee> SearchByDept(string dept);
        List<Employee> SearchByEmployeeName(string employeename);
        List<Employee> SearchByEmployeeCode(string employeecode);
        List<Employee> SearchByRole(string role);
        int UpdateEmployeeRole(string employeecode, string role);
    }
}