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

        IPurchaseOrderDAO poDAO = new PurchaseOrderDAO();
        IPODetailsDAO podDAO = new PODetailsDAO();


        ICatagoryDAO catDAO = new CatagoryDAO();
        IRetrievalDetailsDAO rdDAO = new RetrievalDetailsDAO();
        IRetrievalDAO rDAO = new RetrievalDAO();

        IDisbursementDAO dbDAO = new DisbursementDAO();
        IDisbursementDetailsDAO dbdDAO = new DisbursementDetailsDAO();
        IDepartmentDAO depDAO = new DepartmentDAO();


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
                    if (a.TemporaryRoleCode.Equals("ActSSup"))
                    {
                        empNameList.Add(a);
                    }
                }

            }
         

          

            return empNameList;
        }



        public List<AssignRole> ListOfEmployeeCodeInAssignRole(string empCode)
        {
            List<AssignRole> empCodeList = new List<AssignRole>();

            List<AssignRole> empSearchList =  asignDao.SearchByEmployeeCode(empCode);

            foreach (AssignRole a in empSearchList)
            {
                if (a.TemporaryRoleCode.Equals("ActSSup"))
                {
                    empCodeList.Add(a);
                }
            }
            return empCodeList;
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
                    if (a.StartDate != null)
                    {
                        d = (DateTime)a.StartDate;
                        break;
                    }
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
                    if (a.EndDate != null)
                    {
                        d = (DateTime)a.EndDate;
                        break;
                    }
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
                    if (ar.TemporaryRoleCode.Equals("ActSSup"))
                    {
                        if (ar.StartDate.Equals(startDate) || ar.EndDate.Equals(endDate))
                        {
                            return false;
                        }
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

        //public List<Adjustment> ListOfPendingAdjustmentByManager()
        //{

        //    List<Adjustment> pendingAdLdit = new List<Adjustment>();
        //    List<Adjustment> adjustmentList = adjustmentDao.ListAllAdjustments();


        //    foreach (Adjustment ad in adjustmentList)
        //    {
        //        if (ad.Status.ToLower().Equals(statusOfAdjustment.ToLower()))
        //        {
        //            StationeryCatalogue tempst = GetStationaryDetails(ad.ItemCode);
        //            if ((ad.AdjustmentQuant * tempst.Price) >= 250)
        //            {
        //                pendingAdLdit.Add(ad);
        //            }
        //        }

        //    }

        //    return pendingAdLdit;


        //}
        
       
        public List<PurchaseOrder> ListAllPendingPO()
        {
            return poDAO.ListPurchaseOrdersByStatus("pending");
        }

        public Supplier GetSupplier(string SupplierCode)
        {
            return spDao.GetSupplier(SupplierCode);
        }

        public Department GetDepartment(string DepCode)
        {
            return depDAO.GetDepartmentInfo(DepCode);
        }

        public List<PODetail> ListPODetailsByPOCode(string PurchaseOrderCode)
        {
            return podDAO.ListAllPODetailsByPOCode(PurchaseOrderCode);
        }

        public StationeryCatalogue GetStationeryCatalogue(string itemCode)
        {
            return stationaryDao.GetStationery(itemCode);
        }

        public PurchaseOrder GetPOByPOCode(string PoCode)
        {
            return poDAO.GetPurchaseOrder(PoCode);
        }

        public int updatePOStatus(PurchaseOrder po)
        {
            return poDAO.UpdatePurchaseOrder(po);
        }

        public List<StationeryCatalogue> SearchStationeryCatalogueByDescription(string SearchName)
        {
            return stationaryDao.SearchByDescription(SearchName);
        }

        public List<StationeryCatalogue> SearchStationeryCatalogueByItemCode(string SearchName)
        {
            return stationaryDao.SearchByItemCode(SearchName);
        }

        public List<StationeryCatalogue> SearchStationeryCatalogueByCategoryCode(string SearchName)
        {
            return stationaryDao.SearchByCategory(SearchName);
        }

        public List<Category> ListAllCategory()
        {
            return catDAO.ListAllCategory();
        }

        public List<TransactionOfRetrieval_Adjustment_PurchaseOrder> GetAllTransaction(string itemCode, DateTime start, DateTime end)
        {
            List<TransactionOfRetrieval_Adjustment_PurchaseOrder> tList = new List<TransactionOfRetrieval_Adjustment_PurchaseOrder>();
            List<DisbursementDetail> dList = new List<DisbursementDetail>();
            List<Adjustment> adjList = new List<Adjustment>();
            List<PODetail> podList = new List<PODetail>();
            dList = dbdDAO.ListDDByItemCode(itemCode, start);
            foreach (DisbursementDetail d in dList)
            {
                Disbursement r = dbDAO.GetDisbursementByCode(d.DisbursementCode);

                //if (r.DateDisbursed > start)
                //{
                string depName = GetDepartment(r.DepartmentCode).DepartmentName;
                tList.Add(new TransactionOfRetrieval_Adjustment_PurchaseOrder(r.DateDisbursed, d.ActualQuantity.ToString(), depName, r.DepartmentCode, ""));

                // }
            }

            adjList = adjustmentDao.ListAllAdjustmentsByItemCode(itemCode, start);
            foreach (Adjustment adj in adjList)
            {
                //if (adj.DateApproved > start)
                tList.Add(new TransactionOfRetrieval_Adjustment_PurchaseOrder(adj.DateApproved, adj.AdjustmentQuant.ToString(), "Adjustment", "", ""));
            }

            podList = podDAO.ListPODetailByItemCodeAndDate(itemCode, start);
            foreach (PODetail pod in podList)
            {

                PurchaseOrder po = poDAO.GetPurchaseOrder(pod.PurchaseOrderCode);
                //if (po.DateReceived > start)
                //{
                string supName = GetSupplier(po.SupplierCode).SupplierName;
                tList.Add(new TransactionOfRetrieval_Adjustment_PurchaseOrder(po.DateReceived, pod.Quantity.ToString(), supName, "", po.SupplierCode));

                //}
            }
            if (tList.Count == 0)
            {
                return null;
            }
            tList.Sort();
            int? currentStock = Convert.ToInt32(stationaryDao.GetStationery(itemCode).Stock);

            tList.Last().Balance = currentStock;
            for (int i = tList.Count - 1; i > 0; i--)
            {
                if (tList[i].SupId != "")
                {
                    tList[i - 1].Balance = currentStock - Convert.ToInt32(tList[i].Quantity);
                    currentStock = tList[i - 1].Balance;
                }
                else if (tList[i].DeptId != "")
                {
                    tList[i - 1].Balance = currentStock + Convert.ToInt32(tList[i].Quantity);
                    currentStock = tList[i - 1].Balance;
                }
                else
                {
                    tList[i - 1].Balance = currentStock - Convert.ToInt32(tList[i].Quantity);
                    currentStock = tList[i - 1].Balance;
                }
            }
            List<TransactionOfRetrieval_Adjustment_PurchaseOrder> tListBeforeEndDate = new List<TransactionOfRetrieval_Adjustment_PurchaseOrder>();
            foreach (TransactionOfRetrieval_Adjustment_PurchaseOrder trans in tList)
            {
                if (trans.Date <= end)
                {
                    if (trans.SupId != "")
                    {
                        trans.Quantity = "+" + trans.Quantity;
                    }
                    else if (trans.DeptId != "")
                    {
                        trans.Quantity = "-" + trans.Quantity;
                    }
                    else if (trans.Dept_SupId == "Adjustment")
                    {

                        if (Convert.ToInt32(trans.Quantity) > 0)
                            trans.Quantity = "ADJ+" + trans.Quantity;
                        else
                            trans.Quantity = "ADJ" + trans.Quantity;
                    }
                    tListBeforeEndDate.Add(trans);
                }
            }
            return tListBeforeEndDate;
        }

        public Adjustment GetAdjustment(string adjustmentCode)
        {
            return adjustmentDao.GetAdjustmentByAdjustmentCode(adjustmentCode);
        }

        public int UpdateStationery(StationeryCatalogue stationery)
        {
            return stationaryDao.UpdateStationery(stationery);
        }
    }
}
