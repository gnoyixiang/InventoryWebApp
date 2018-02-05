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

        public List<Employee>  ListAllEmployeeNameInDepartment(String deptCode)
        {
            List<Employee> empList = new List<Employee>();
            List<Employee> empSearchList = edao.ListEmployee()
                .Where(e => e.DepartmentCode == deptCode).ToList();
            foreach (Employee e in empSearchList)
            {
                Role role = udao.getRoleNameByUsername(e.UserName);
                if (role != null)
                {
                    if (role.Id == "Empl")
                    {
                        empList.Add(e);
                    }
                }
            }
            return empList;
        }
        public List<Employee> ListOfEmployeeNameInDepartment(string empName, string deptCode)
        {
            List<Employee> empList = new List<Employee>();
            List<Employee> empSearchList = edao.SearchByEmployeeName(empName)
                .Where(e => e.DepartmentCode == deptCode).ToList();
            foreach (Employee e in empSearchList)
            {
                Role role = udao.getRoleNameByUsername(e.UserName);
                if (role != null)
                {
                    if (role.Id == "Empl")
                    {
                        empList.Add(e);
                    }
                }
            }
            return empList;
        }
        public Employee GetEmployeeInfoByEmployeeCode(string employeecode)
        {
            return edao.GetEmployeeInfoByEmployeeCode(employeecode);
        }

        public List<Employee> ListOfEmployeeCodeInDepartment(string empCode, string deptCode)
        {
            List<Employee> empList = new List<Employee>();
            List<Employee> empSearchList = edao.SearchByEmployeeCode(empCode)
                .Where(e => e.DepartmentCode == deptCode).ToList();
            foreach (Employee e in empSearchList)
            {
                Role role = udao.getRoleNameByUsername(e.UserName);
                if (role != null)
                {
                    if (role.Id == "Empl")
                    {
                        empList.Add(e);
                    }
                }
            }
            return empList;
        }

        public Role GetRoleInfo(string id)
        {
            return rdao.GetRoleInfo(id);
        }
      
        public List<AssignRole> ListOfAssignRoleInDepartment(string deptCode)
        {
            List<Employee> empList = edao.SearchByDept(deptCode);
            List<AssignRole> assignList = new List<AssignRole>();

            foreach (Employee e in empList)
            {
                List<AssignRole> assList = adao.SearchByEmployeeCode(e.EmployeeCode);
                foreach (AssignRole a in assList)
                {
                    assignList.Add(a);
                }
            }
            return assignList;
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
        public bool CheckTemporaryRole(string temporaryrole,String deptCode)
        {
            List<Employee> empList = edao.SearchByDept(deptCode);
            List<AssignRole> assignList = new List<AssignRole>();
            foreach (Employee e in empList)
            {
                List<AssignRole> assList = adao.SearchByEmployeeCode(e.EmployeeCode);
                foreach (AssignRole a in assList)
                {
                    assignList.Add(a);
                }
            }

            if (assignList.Count == 0)
            {
                return true;
            }
            else
            {
                foreach (AssignRole a in assignList)
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
                        (a.TemporaryRoleCode.Equals(temporaryrole)) &&
                       ((DateTime.Compare((DateTime)a.StartDate, startdate) <= 0
                       &&
                       DateTime.Compare((DateTime)a.EndDate, startdate) >= 0)
                       ||
                       (DateTime.Compare((DateTime)a.StartDate, enddate) <= 0
                       &&
                       DateTime.Compare((DateTime)a.EndDate, enddate) >= 0))
                       )
                    {
                        return false;

                    }
                }
            }
            return true;

        }

        public bool CheckTemporaryRoleAndDates(string temporaryrole, DateTime startdate, DateTime enddate,String deptCode)
        {
            List<Employee> empList = edao.SearchByDept(deptCode);
            List<AssignRole> assignList = new List<AssignRole>();
            foreach (Employee e in empList)
            {
                List<AssignRole> assList = adao.SearchByEmployeeCode(e.EmployeeCode);
                foreach (AssignRole a in assList)
                {
                    assignList.Add(a);
                }
            }
            if (assignList.Count == 0)
            {
                return true;
            }
            else
            {
                foreach (AssignRole a in assignList)
                {
                    /*int i1 = DateTime.Compare( (DateTime)a.StartDate, startdate);
                    int i2 = DateTime.Compare((DateTime)a.StartDate, enddate);
                    int j1= DateTime.Compare((DateTime)a.EndDate, startdate);
                    int j2 = DateTime.Compare((DateTime)a.EndDate, enddate);
                    */
                    if (
                        (a.TemporaryRoleCode.Equals(temporaryrole)) &&
                       ((DateTime.Compare((DateTime)a.StartDate, startdate) <= 0
                       &&
                       DateTime.Compare((DateTime)a.EndDate, startdate) >= 0)
                       ||
                       (DateTime.Compare((DateTime)a.StartDate, enddate) <= 0
                       &&
                       DateTime.Compare((DateTime)a.EndDate, enddate) >= 0))
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
                    if ((a.EmployeeCode == employeecode) && (a.TemporaryRoleCode != "ActHead"))
                    {
                        return false;

                    }

                }
            }
            return true;

        }
        public bool CheckEmployee(string employeecode,String deptCode)
        {
            List<Employee> empList = edao.SearchByDept(deptCode);
            List<AssignRole> assignList = new List<AssignRole>();
            foreach (Employee e in empList)
            {
                List<AssignRole> assList = adao.SearchByEmployeeCode(e.EmployeeCode);
                foreach (AssignRole a in assList)
                {
                    assignList.Add(a);
                }
            }
            if (assignList.Count == 0)
            {
                return true;
            }
            else
            {
                foreach (AssignRole a in assignList)
                {
                    if ((a.EmployeeCode == employeecode) && (a.TemporaryRoleCode != "ActHead"))
                    {
                        return false;

                    }

                }
            }
            return true;

        }
        public string GetRoleName(string a)
        {

            return rdao.GetRoleName(a);
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
            return adao.UpdateAssignRole(assignrolecode, temporaryrolecode,
            startdate, enddate);
        }
        public int UpdateTemporaryRoleCode(string assignrolecode, string temporaryrolecode)
        {
            return adao.UpdateTemporaryRoleCode(assignrolecode, temporaryrolecode);

        }
        public int AddTemporaryRole(string assignrolecode, string temporaryrolecode, string employeecode)
        {
            return adao.AddTemporaryRole(assignrolecode, temporaryrolecode, employeecode);

        }

        public void DeleteAssignRole(string assignrolecode)
        {
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
           DateTime startdate, DateTime enddate, string assignedby)
        {
            return adao.AddAssignRole(assignrolecode, temporaryrolecode, employeecode,
            startdate, enddate, assignedby);

        }

        public Employee GetEmployeeInfo(string empCode)
        {
            return edao.GetEmployeeByCode(empCode);
        }




        public Role getRoleNameByUsername(string username)
        {

            return udao.getRoleNameByUsername(username);

        }
        public User GetUserByUsername(string username)
        {
            return udao.GetUserByUsername(username);
        }



        //yf

        IEmployeeDAO eDAO = new EmployeeDAO();
        IRequestDAO rDAO = new RequestDAO();
        IRequestDetailsDAO rdDAO = new RequestDetailsDAO();
        IStationeryCatalogueDAO scDAO = new StationeryCatalogueDAO();
        IDisbursementDetailsDAO ddDAO = new DisbursementDetailsDAO();
        IDisbursementDAO dDAO = new DisbursementDAO();



        public List<string> ListEmpName(string dept, string role)
        {
            return eDAO.ListEmpName(dept, role);

        }

        public List<Request> ListPendingRequest(string deptCode)
        {
            return rDAO.SearchRequestbyStatus("pending", deptCode);
        }

        public string GetEmployeeName(string username)
        {
            return eDAO.GetEmployeeName(username);
        }

        public Employee GetEmployeeByCode(string employeeCode)
        {
            return eDAO.GetEmployeeByCode(employeeCode);
        }

        public List<Request> ListAllRequest()
        {
            return rDAO.SearchRequestbyDept("ISS1");
        }

        public List<Request> SearchRequestByName(string name)
        {
            string username = eDAO.GetUserName(name);
            return rDAO.SearchPendingRequestByName(username, "ISS1");
        }

        public List<Request> SearchRequestByDate(DateTime d)
        {

            return rDAO.SearchPendingRequestByDate(d, "ISS1");
        }

        public List<Request> SearchRequestByStatus(string status)
        {

            return rDAO.SearchRequestbyStatus(status, "ISS1");
        }



        public Request GetRequest(string code)
        {
            return rDAO.GetRequest(code);
        }

        public List<RequestDetail> ListRequestDetail(string code)
        {
            return rdDAO.ListRequestDetail(code);
        }

        public StationeryCatalogue GetStationeryCatalogue(string code)
        {
            return scDAO.GetStationery(code);
        }

        public int UpdateRequest(Request r, string status)
        {

            List<RequestDetail> rdlist = rdDAO.ListRequestDetail(r.RequestCode);

            foreach (RequestDetail rd in rdlist)
            {
                rdDAO.UpdateRequestDetailStatus(rd, status);
            }

            rDAO.UpdateRequestApproval(r);
            return rDAO.UpdateRequestStatus(r);



        }

        public List<DisbursementDetail> ListDisbursementDetail(Request r)
        {
            return ddDAO.SearchDDByRequest(r);
        }

        public Disbursement GetDisbursement(string code)
        {
            return dDAO.GetDisbursementByCode(code);
        }

        public List<DisbursementDetail> ListDisbursementDetailByCode(string code)
        {
            return ddDAO.SearchDDByCode(code);
        }

        public bool CheckDates(string assignrolecode, string temporaryrole, DateTime startdate, DateTime enddate, String deptCode)
        {
            List<Employee> empList = edao.SearchByDept(deptCode);
            List<AssignRole> assignList = new List<AssignRole>();
            foreach (Employee e in empList)
            {
                List<AssignRole> assList = adao.SearchByEmployeeCode(e.EmployeeCode);
                foreach (AssignRole a in assList)
                {
                    assignList.Add(a);
                }
            }
            if (assignList.Count == 0)
            {
                return true;
            }
            else
            {
                foreach (AssignRole a in assignList)
                {
                    /*int i1 = DateTime.Compare( (DateTime)a.StartDate, startdate);
                    int i2 = DateTime.Compare((DateTime)a.StartDate, enddate);
                    int j1= DateTime.Compare((DateTime)a.EndDate, startdate);
                    int j2 = DateTime.Compare((DateTime)a.EndDate, enddate);
                    */
                    if (
                        (a.AssignRoleCode != assignrolecode) &&
                        (a.TemporaryRoleCode.Equals(temporaryrole)) &&
                       ((DateTime.Compare((DateTime)a.StartDate, startdate) <= 0
                       &&
                       DateTime.Compare((DateTime)a.EndDate, startdate) >= 0)
                       ||
                       (DateTime.Compare((DateTime)a.StartDate, enddate) <= 0
                       &&
                       DateTime.Compare((DateTime)a.EndDate, enddate) >= 0))
                       )
                    {
                        return false;
                    }
                    else if ((a.AssignRoleCode == assignrolecode) &&
                        (a.TemporaryRoleCode.Equals(temporaryrole)) &&
                       ((DateTime.Compare((DateTime)a.StartDate, startdate) < 0
                       &&
                       DateTime.Compare((DateTime)a.EndDate, startdate) > 0)
                       ||
                       (DateTime.Compare((DateTime)a.StartDate, enddate) < 0
                       &&
                       DateTime.Compare((DateTime)a.EndDate, enddate) > 0)))
                    {
                        return true;
                    }
                }
            }
            return true;

        }
    }
}