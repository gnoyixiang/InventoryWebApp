using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.Controllers
{
    
    public class LoginController
    {
        IEmployeeDAO employeeDAO = new EmployeeDAO();

        public string GetEmployeeNameByUsername(string username)
        {
            return employeeDAO.GetEmployeeName(username);
        }
        
    }
}