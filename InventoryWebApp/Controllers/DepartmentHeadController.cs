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
        IAssignRoleDAO assignRoleDAO = new AssignRoleDAO();
        IEmployeeDAO employeeDAO = new EmployeeDAO();
        IRoleDAO roleDAO = new RoleDAO();
        IUserDAO userDAO = new UserDAO();
        
        IRequestDAO requestDAO = new RequestDAO();
        IRequestDetailsDAO requestDetailDAO = new RequestDetailsDAO();
        IStationeryCatalogueDAO stationeryDAO = new StationeryCatalogueDAO();
        IDisbursementDetailsDAO disbursementDetailDAO = new DisbursementDetailsDAO();
        IDisbursementDAO disbursementDAO = new DisbursementDAO();
        IDepartmentDAO departmentDAO = new DepartmentDAO();

        public List<Employee> ListOfEmployeeNameInDepartment(string empName)
        {
            List<Employee> empList = new List<Employee>();
            List<Employee> empSearchList = employeeDAO.SearchByEmployeeName(empName);
            foreach(Employee e in empSearchList)
            {
                if(e.DepartmentCode=="CPSC")
                {
                    empList.Add(e);
                }
            }
            return empList;
        }

        public Role GetRoleInfo(string id)
        {
            return roleDAO.GetRoleInfo(id);
        }
        public List<Employee> ListOfEmployeeCodeInDepartment(string empCode)
        {
            List<Employee> empList = new List<Employee>();
            List<Employee> empSearchList = employeeDAO.SearchByEmployeeCode(empCode);
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
            List<Employee> empList = employeeDAO.SearchByDept(deptCode);
            List<AssignRole> assignList = new List<AssignRole>();
            
            foreach(Employee e in empList)
            {
                List<AssignRole> assList = assignRoleDAO.SearchByEmployeeCode(e.EmployeeCode);
                foreach(AssignRole a in assList)
                {
                    assignList.Add(a);
                }              
            }
            return assignList;
        }
    
        public bool CheckTemporaryRole(string temporaryrole)
        {
            List<AssignRole> listOfAssignRole = assignRoleDAO.ListAssignRole();
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
            List<AssignRole> listOfAssignRole = assignRoleDAO.ListAssignRole();
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
            List<AssignRole> listOfAssignRole = assignRoleDAO.ListAssignRole();
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
        public string GetRoleName(string a)
        {
            
            return roleDAO.GetRoleName(a);
        }

        public List<AssignRole> ListAssignRole()
        {
            return assignRoleDAO.ListAssignRole();
        }

        public int UpdatePermanentRole(AssignRole role)
        {
            return assignRoleDAO.UpdateAssignRole(role);
        }

        public int UpdateAssignRole(string assignrolecode, string temporaryrolecode,
           DateTime startdate, DateTime enddate)
        {
            return assignRoleDAO.UpdateAssignRole(assignrolecode,  temporaryrolecode,
            startdate,  enddate);
        }
        public int UpdateTemporaryRoleCode(string assignrolecode, string temporaryrolecode)
        {
            return assignRoleDAO.UpdateTemporaryRoleCode(assignrolecode, temporaryrolecode);

        }
        public int AddTemporaryRole(string assignrolecode, string temporaryrolecode,string employeecode)
        {
            return assignRoleDAO.AddTemporaryRole( assignrolecode,  temporaryrolecode,employeecode);

        }

        public void DeleteAssignRole(string assignrolecode)
        {
             assignRoleDAO.DeleteAssignRole(assignrolecode);
        }
        public List<Role> ListRole()
        {

            return roleDAO.ListRole();
        }

        public int UpdateEmployeeRole(string employeecode, string role)
        {

            return employeeDAO.UpdateEmployeeRole(employeecode, role);
        }

        public AssignRole GetAssignRoleInfo(string assignrolecode)
        {

            return assignRoleDAO.GetAssignRoleInfo(assignrolecode);
        }
        
        public List<Role> ListAllDepartmentRoles()
        {
            return roleDAO.ListAllDepartmentRole();
        }
        public int AddAssignRole(string assignrolecode, string temporaryrolecode, string employeecode,
           DateTime startdate, DateTime enddate, string assignedby)
        {
            return assignRoleDAO.AddAssignRole(assignrolecode, temporaryrolecode, employeecode,
            startdate, enddate, assignedby);

        }

        public Employee GetEmployeeInfo(string empCode)
        {
            return employeeDAO.GetEmployeeByCode(empCode);
        }

       
           
        
        public Role getRoleNameByUsername(string username)
        {

            return userDAO.getRoleNameByUsername(username);
            
        }
        public User GetUserByUsername(string username)
        {
            return userDAO.GetUserByUsername(username);
        }
    
        public List<string> ListEmpName(string dept,string role)
        {
            return employeeDAO.ListEmpName(dept, role);

        }

        public Employee GetEmployeeByUsername(string username)
        {
            return employeeDAO.GetEmployeeInfo(username);
        }

        public Department GetDepartmentByEmployee(Employee e)
        {
            return departmentDAO.GetDepartmentInfo(e.DepartmentCode);
        }

        public List<Request> ListPendingRequest()
        {
            return requestDAO.SearchRequestbyStatus("pending","ISS1");
        }

        public string GetEmployeeName(string username)
        {
            return employeeDAO.GetEmployeeName(username);
        }

        public Employee GetEmployeeByCode(string employeeCode)
        {
            return employeeDAO.GetEmployeeByCode(employeeCode);
        }

        public List<Request> ListAllRequest()
        {
            return requestDAO.SearchRequestbyDept("ISS1");
        }

        public List<Request> SearchRequestByName(string name)
        {
            string username = employeeDAO.GetUserName(name);
            return requestDAO.SearchPendingRequestByName(username,"ISS1");
        }

        public List<Request> SearchRequestByDate(DateTime d)
        {

            return requestDAO.SearchPendingRequestByDate(d,"ISS1");
        }

        public List<Request> SearchRequestByStatus(string status)
        {

            return requestDAO.SearchRequestbyStatus(status,"ISS1");
        }



        public Request GetRequest(string code)
        {
            return requestDAO.GetRequest(code);
        }

        public List<RequestDetail> ListRequestDetail(string code)
        {
            return requestDetailDAO.ListRequestDetail(code);
        }

        public StationeryCatalogue GetStationeryCatalogue(string code)
        {
            return stationeryDAO.GetStationery(code);
        }

        public int UpdateRequest(Request r,string status)
        {                               
               
                List<RequestDetail> rdlist= requestDetailDAO.ListRequestDetail(r.RequestCode);
                
                foreach(RequestDetail rd in rdlist)
                {
                    requestDetailDAO.UpdateRequestDetailStatus(rd, status);
                }

                requestDAO.UpdateRequestApproval(r);
                return requestDAO.UpdateRequestStatus(r);          
                   
                    
           
        }

       public List<DisbursementDetail> ListDisbursementDetail(Request r)
        {
            return disbursementDetailDAO.SearchDDByRequest(r);
        }

        public Disbursement GetDisbursement(string code)
        {
            return disbursementDAO.GetDisbursementByCode(code);
        }

        public List<DisbursementDetail> ListDisbursementDetailByCode(string code)
        {
            return disbursementDetailDAO.SearchDDByCode(code);
        }

    }
}