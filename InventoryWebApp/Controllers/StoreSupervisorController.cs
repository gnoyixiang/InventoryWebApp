using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using System.Collections;
using System.Globalization;

namespace InventoryWebApp.Controllers
{
    public class StoreSupervisorController
    {
        IEmployeeDAO empDao = new EmployeeDAO();
        ISupplierDAO spDao = new SupplierDAO();
        IAssignRoleDAO asignDao = new AssignRoleDAO();
        IUserDAO userDao = new UserDAO();
        List<AssignRole> assignRole = null;
        IAdjustmentDAO adjustmentDao = new AdjustmentDAO();
        IStationeryCatalogueDAO stationaryDao = new StationeryCatalogueDAO();
       private readonly string  statusOfAdjustment = "Pending";

        public List<Supplier> SupplierList()
        {
            return spDao.ListOfSupplier();

        }


        public List<AssignRole> ListOfEmployeeNameInAssignRole(string empName)
        {
           
            List<AssignRole> empNameList = new List<AssignRole>();
         List<string> empCode =   empDao.ListOfEmployeeCode(empName);
            List<AssignRole> etempCode = null;
            foreach (string ecode in empCode)
            {

              etempCode =   ListOfEmployeeCodeInAssignRole(ecode);

                foreach (AssignRole a in etempCode)
                {
                    empNameList.Add(a);

                }

            }
         

          

            return empNameList;
        }



        public List<AssignRole> ListOfEmployeeCodeInAssignRole(string empCode)
        {
           

            List<AssignRole> empSearchList =  asignDao.SearchByEmployeeCode(empCode);
            
            
            return empSearchList;
        }

        

        public List<Employee> ListOfEmployeeCodeInEmp(string empCode)
        {
            List<Employee> empCodeList = new List<Employee>();
            List<Employee> empSearchList = empDao.SearchByEmployeeCode(empCode);
            //string userRoleName = null;

            //foreach (Employee emp in empSearchList)
            //{

            //    userRoleName = GetUserRoleName(emp.UserName);
            //    if (userRoleName.Equals("SSupervisor"))
            //    {
            //        break;
            //    }
            //}

            foreach (Employee e in empSearchList)
            {
                  if (e.DepartmentCode.Equals("STOR") /*&& !userRoleName.Equals("SSupervisor")*/)
                {
                   empCodeList.Add(e);


                }


            }
            return empCodeList;

        }

        public List<Employee> ListOfEmployeeCode(string empCode)
        {
            List<Employee> empCodeList = new List<Employee>();
            List<Employee> empSearchList = empDao.SearchByEmployeeCode(empCode);
            
            foreach (Employee e in empSearchList)
            {
                if (e.DepartmentCode.Equals("STOR") )
                {
                    empCodeList.Add(e);


                }


            }
            return empCodeList;

        }

        public List<Employee> ListOfEmployeeNameInEmp(string empName)
        {

            List<Employee> empCodeList = new List<Employee>();
            List<Employee> empSearchList = empDao.SearchByEmployeeName(empName);
            string userRoleName = null;

            foreach (Employee emp in empSearchList)
            {

                userRoleName = GetUserRoleName(emp.UserName);
                if (userRoleName.Equals("SSupervisor"))
                {
                    break;
                }
            }
            foreach (Employee e in empSearchList)
            {
              
                if (e.DepartmentCode.Equals("STOR")&&!userRoleName.Equals("SSupervisor"))
                {
                    empCodeList.Add(e);


                }


            }
            return empCodeList;
        }


        public List<Employee> ListOfEmployeeName(string empName)
        {

            List<Employee> empCodeList = new List<Employee>();
            List<Employee> empSearchList = empDao.SearchByEmployeeName(empName);
            //string userRoleName = null;

            
            foreach (Employee e in empSearchList)
            {

                if (e.DepartmentCode.Equals("STOR"))
                {
                    empCodeList.Add(e);


                }


            }
            return empCodeList;
        }

        public List<Employee> EmployeeList()
        {
          return  empDao.ListEmployee();
        }
        public string GetTemporaryRole(string empCode)
        {
            return asignDao.GetTemporaryRoleCode(empCode);

           

        }


        public DateTime GetTemporaryRoleStartDate(string assignRolecode)
        {
           DateTime d = DateTime.MinValue;
            List<AssignRole> tempRoleStartDate = asignDao.ListAssignRole();

            foreach (AssignRole a in tempRoleStartDate)
            {
                if (a != null && a.AssignRoleCode.Equals(assignRolecode))
                {
                    d = (DateTime)a.StartDate;
                    break;
                }
                else
                {
                    d = new DateTime();
                }
                
            }

            return d;
        }


        public DateTime GetTemporaryRoleEndDate(string assignRolecode)
        {
            DateTime d = DateTime.MinValue;
            List<AssignRole> tempRoleEndDate = asignDao.ListAssignRole();

            foreach (AssignRole a in tempRoleEndDate)
            {
                if (a != null && a.AssignRoleCode.Equals(assignRolecode))
                {
                    d = (DateTime)a.EndDate;
                    break;
                }
                else
                {
                    d = new DateTime();
                }

            }

            return d;
        }

        public string GetAssignRoleCode(string empCode)
        {
            string assignRoleCode = null;
           List<AssignRole> asRoleList=  asignDao.ListAssignRole();

            foreach(AssignRole a in asRoleList)
            {
                if (a.EmployeeCode.Equals(empCode))
                {
                    assignRoleCode = a.AssignRoleCode;
                    break;
                }
            }
            return assignRoleCode;
        }


        public string GetUserRoleName(string username)
        {

          Role role =  userDao.getRoleNameByUsername(username);

            return role.Name;
        }

        public int CreateNewAssignRole(string assignrolecode, string temporaryrolecode, string employeecode,
            DateTime startdate, DateTime enddate, string assignedby)
        {
           int addValue =  asignDao.AddAssignRole(assignrolecode, temporaryrolecode, employeecode,
            startdate, enddate, assignedby);

            return addValue;
        }


        public int UpdateAssignRole(string assignroleCode, string temporaryroleCode,string employeCode,
            DateTime startDate, DateTime endDate)
        {

            int updateValue = asignDao.UpdateAssignRole(assignroleCode, temporaryroleCode, employeCode, startDate, endDate);

            return updateValue;
        }

        public void DeleteAssignRoleByAssignCode(string assignCode)
        {

            asignDao.DeleteAssignRole(assignCode);
        }

        public bool CompareDate(DateTime startDate, DateTime endDate)
        {
            if (startDate < DateTime.Now.Date)
            {
                return false;

            }
            else if (endDate < startDate)
            {
                return false;
            }
            else
            {
                return true;

            }


        }

        public string GetUserName(string empCode)
        {
            string userName = null; 
           List<Employee> empList = empDao.SearchByEmployeeCode(empCode);

            foreach (Employee e in empList)
            {
                if(e!=null&&e.EmployeeCode.Equals(empCode))
                userName = e.UserName;
                break;
            }

            return userName;
        }

        public string GetEmployeeName(string userName)
        {
          return  empDao.GetEmployeeName(userName);
        }

        public bool CheckTempRoleAndDates(string tempRole, DateTime startDate, DateTime endDate)
        {
           List<AssignRole> listOfAssignRole =  asignDao.ListAssignRole();

            if (listOfAssignRole.Count == 0)
            {
                return true;
            } else 
            {
                foreach (AssignRole ar in listOfAssignRole)
                {
                    if (ar.TemporaryRoleCode.Equals("SSupervisor") && ar.StartDate.Equals(startDate) && ar.EndDate.Equals(endDate))
                    {

                        return false;
                    }

                }
            }

            return true;
        }



        public int UpdateAdjustmentBySupervisor(Adjustment adjustment)
        {

          int adUpdate =  adjustmentDao.UpdateAdjustmentByStoreSupervisor(adjustment);

            return adUpdate;
        }

        public StationeryCatalogue GetStationaryDetails(string itemCode)
        {
            StationeryCatalogue scatalogue = stationaryDao.GetStationery(itemCode);

            return scatalogue;
        }


        public List<Adjustment> ListOfPendingAdjustmentBySupervisor()
        {
            List<Adjustment> pendingAdLdit = new List<Adjustment>();
            List<Adjustment> adjustmentList = adjustmentDao.ListAllAdjustments();
            
            
                foreach (Adjustment ad in adjustmentList)
                {
                    if (ad.Status.ToLower().Equals(statusOfAdjustment.ToLower()))
                    {
                      StationeryCatalogue tempst =  GetStationaryDetails(ad.ItemCode);
                        if ((ad.AdjustmentQuant * tempst.Price) < 250 )
                        {
                            pendingAdLdit.Add(ad);
                        }
                    }

                }
            
            return pendingAdLdit;
        }

        public List<Adjustment> ListOfPendingAdjustmentByManager()
        {

            List<Adjustment> pendingAdLdit = new List<Adjustment>();
            List<Adjustment> adjustmentList = adjustmentDao.ListAllAdjustments();


            foreach (Adjustment ad in adjustmentList)
            {
                if (ad.Status.ToLower().Equals(statusOfAdjustment.ToLower()))
                {
                    StationeryCatalogue tempst = GetStationaryDetails(ad.ItemCode);
                    if ((ad.AdjustmentQuant * tempst.Price) >= 250)
                    {
                        pendingAdLdit.Add(ad);
                    }
                }

            }

            return pendingAdLdit;


        }
    }
}