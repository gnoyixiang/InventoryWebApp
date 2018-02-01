using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.Controllers
{
    

    public class DepartmentHeadController
    {
        public DepartmentHeadController()
        {

        }
        IAssignRoleDAO adao = new AssignRoleDAO();
        IEmployeeDAO edao = new EmployeeDAO();
        IRoleDAO rdao = new RoleDAO();
        IUserDAO udao = new UserDAO();
        public List<Employee> ListOfEmployeeNameInDepartment(string empName)
        {
            List<Employee> empList = new List<Employee>();
            List<Employee> empSearchList = edao.SearchByEmployeeName(empName);
            foreach(Employee e in empSearchList)
            {
                if(e.DepartmentCode=="CPSC")
                {
                    empList.Add(e);
                }
            }
            return empList;
        }
        public List<Employee> ListAllEmployeeNameInDepartment(string deptCode)
        {
            List<Employee> empList = new List<Employee>();
            List<Employee> eList = edao.ListEmployee();
            foreach (Employee e in eList)
            {
                if (e.DepartmentCode == deptCode)
                {
                    empList.Add(e);
                }
            }
            return empList;
        }

        
        public List<Employee> ListOfEmployeeCodeInDepartment(string empCode)
        {
            List<Employee> empList = new List<Employee>();
            List<Employee> empSearchList = edao.SearchByEmployeeCode(empCode);
            foreach (Employee e in empSearchList)
            {
                if (e.DepartmentCode == "CPSC")
                {
                    empList.Add(e);
                }
            }
            return empList;
        }
        public List<AssignRole> ListOfAssignRoleInDepartment(string deptCode)
        {
            List<Employee> empList = edao.SearchByDept(deptCode);
            List<AssignRole> assignList = new List<AssignRole>();
            
            foreach(Employee e in empList)
            {
                List<AssignRole> assList = adao.SearchByEmployeeCode(e.EmployeeCode);
                foreach(AssignRole a in assList)
                {
                    assignList.Add(a);
                }              
            }
            return assignList;
        }
   
        public List<Employee> ListEmployee()
        {
            return edao.ListEmployee();
        }
       
        public bool CheckTemporaryRole(string temporaryrole)
        {
            List<AssignRole> listOfAssignRole = adao.ListAssignRole();
            if (listOfAssignRole.Count == 0)
            {
                return true;
            }
            else
            {
                foreach (AssignRole a in listOfAssignRole)
                {
                    if (a.TemporaryRoleCode.Equals(temporaryrole))
                    {
                        return false;

                    }
                }
            }
            return true;
        }
        
        public bool CheckTemporaryRoleAndDates(string temporaryrole, DateTime startdate, DateTime enddate)
        {
            List<AssignRole> listOfAssignRole = adao.ListAssignRole();
            if (listOfAssignRole.Count == 0)
            {
                return true;
            }
            else
            {
                foreach (AssignRole a in listOfAssignRole)
                {
                    /*int i1 = DateTime.Compare( (DateTime)a.StartDate, startdate);
                    int i2 = DateTime.Compare((DateTime)a.StartDate, enddate);
                    int j1= DateTime.Compare((DateTime)a.EndDate, startdate);
                    int j2 = DateTime.Compare((DateTime)a.EndDate, enddate);
                    */
                    if (
                        (a.TemporaryRoleCode.Equals(temporaryrole))&&
                       ((DateTime.Compare((DateTime)a.StartDate, startdate) <= 0 
                       &&
                       DateTime.Compare((DateTime)a.EndDate, startdate) >=0)
                       ||
                       (DateTime.Compare((DateTime)a.StartDate, enddate) <= 0
                       && 
                       DateTime.Compare((DateTime)a.EndDate, enddate) >=0))
                       )
                    {
                        return false;

                    }
                }
            }
            return true;

        }
        public bool CheckEmployee(string employeecode)
        {
            List<AssignRole> listOfAssignRole = adao.ListAssignRole();
            if (listOfAssignRole.Count == 0)
            {
                return true;
            }
            else
            {
                foreach (AssignRole a in listOfAssignRole)
                {
                    if ((a.EmployeeCode==employeecode)&&(a.TemporaryRoleCode!="ActHead"))
                    {
                        return false;

                    }
                    
                }
            }
            return true;

        }
        public Role GetRoleInfo(string id)
        {
            return rdao.GetRoleInfo(id);
        }
        public string GetRoleName(string a)
        {
            
            return rdao.GetRoleName(a);
        }
        public string GetEmployeeName(string a)
        {
            return edao.GetEmployeeName(a);
        }

        public List<AssignRole> ListAssignRole()
        {
            return adao.ListAssignRole();
        }

        public int UpdatePermanentRole(AssignRole role)
        {
            return adao.UpdateAssignRole(role);
        }

        public int UpdateAssignRole(string assignrolecode, string temporaryrolecode,
           DateTime startdate, DateTime enddate)
        {
            return adao.UpdateAssignRole(assignrolecode,  temporaryrolecode,
            startdate,  enddate);
        }
        public int UpdateTemporaryRoleCode(string assignrolecode, string temporaryrolecode)
        {
            return adao.UpdateTemporaryRoleCode(assignrolecode, temporaryrolecode);

        }
        public int AddTemporaryRole(string assignrolecode, string temporaryrolecode,string employeecode)
        {
            return adao.AddTemporaryRole( assignrolecode,  temporaryrolecode,employeecode);

        }

        public void DeleteAssignRole(string assignrolecode)
        {
            AssignRole a = adao.GetAssignRoleInfo(assignrolecode);
            edao.UpdateEmployeeRole(a.EmployeeCode, "Empl");
            adao.DeleteAssignRole(assignrolecode);
            
        }
        public List<Role> ListRole()
        {

            return rdao.ListRole();
        }

        public int UpdateEmployeeRole(string employeecode, string role)
        {

            return edao.UpdateEmployeeRole(employeecode, role);
        }

        public AssignRole GetAssignRoleInfo(string assignrolecode)
        {

            return adao.GetAssignRoleInfo(assignrolecode);
        }
        
        public List<Role> ListAllDepartmentRoles()
        {
            return rdao.ListAllDepartmentRole();
        }
        public int AddAssignRole(string assignrolecode, string temporaryrolecode, string employeecode,
           DateTime? startdate, DateTime? enddate, string assignedby)
        {
            return adao.AddAssignRole(assignrolecode, temporaryrolecode, employeecode,
            startdate, enddate, assignedby);

        }

        
        public Employee GetEmployeeInfo(string a)
        {
            return edao.GetEmployeeInfo(a);
        }
        public  Employee GetEmployeeInfoByEmployeeCode(string employeecode)
        {
            return edao.GetEmployeeInfoByEmployeeCode(employeecode);
        }




        public Role getRoleNameByUsername(string username)
        {

            return udao.getRoleNameByUsername(username);
            
        }
        public User GetUserByUsername(string username)
        {
            return udao.GetUserByUsername(username);
        }
      
    }




}