using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IEmployeeDAO
    {
        int AddEmployee(Employee emp);
        void DeleteEmployee(string username);
        Employee GetEmployeeInfo(string username);
        Employee GetEmployeeByCode(string employeeCode);
        string GetEmployeeName(string username);
        List<Employee> ListEmployee();
        List<string> ListEmpName(string dept, string role);
        List<Employee> SearchByDept(string dept);
        List<Employee> SearchByEmployeeName(string employeename);
        List<Employee> SearchByEmployeeCode(string employeecode);
        List<Employee> SearchByRole(string role);
        int UpdateRole(string username, string role);

        List<string> ListOfEmployeeCode(string name);



        int UpdateEmployeeRole(string employeecode, string role);
    }
}