using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
namespace InventoryWebApp.Controllers
{
    public class StoreSupervisorController
    {
        IEmployeeDAO empDao = new EmployeeDAO();
        IPurchaseOrderDAO poDAO = new PurchaseOrderDAO();
        IPODetailsDAO podDAO = new PODetailsDAO();
        ISupplierDAO sDAO = new SupplierDAO();
        IStationeryCatalogueDAO cDAO = new StationeryCatalogueDAO();
        ICatagoryDAO catDAO = new CatagoryDAO();
        IRetrievalDetailsDAO rdDAO = new RetrievalDetailsDAO();
        IRetrievalDAO rDAO = new RetrievalDAO();
        IAdjustmentDAO adjDAO = new AdjustmentDAO();
        IDisbursementDAO dbDAO = new DisbursementDAO();
        IDisbursementDetailsDAO dbdDAO = new DisbursementDetailsDAO();
        IDepartmentDAO depDAO = new DepartmentDAO();
        public string GetEmployeeName(string userName)
        {
            return empDao.GetEmployeeName(userName);
        }
        public List<PurchaseOrder> ListAllPendingPO()
        {
            return poDAO.ListPurchaseOrdersByStatus("pending");
        }

        public Supplier GetSupplier(string SupplierCode)
        {
            return sDAO.GetSupplier(SupplierCode);
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
            return cDAO.GetStationery(itemCode);
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
            return cDAO.SearchByDescription(SearchName);
        }

        public List<StationeryCatalogue> SearchStationeryCatalogueByItemCode(string SearchName)
        {
            return cDAO.SearchByItemCode(SearchName);
        }

        public List<StationeryCatalogue> SearchStationeryCatalogueByCategoryCode(string SearchName)
        {
            return cDAO.SearchByCategory(SearchName);
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
            dList = dbdDAO.ListDDByItemCode(itemCode,start);
            foreach (DisbursementDetail d in dList)
            {
                Disbursement r = dbDAO.GetDisbursementByCode(d.DisbursementCode);

                //if (r.DateDisbursed > start)
                //{
                    string depName = GetDepartment(r.DepartmentCode).DepartmentName;
                    tList.Add(new TransactionOfRetrieval_Adjustment_PurchaseOrder(r.DateDisbursed, d.ActualQuantity.ToString(), depName,r.DepartmentCode,""));
                    
               // }
            }

            adjList = adjDAO.ListAllAdjustmentsByItemCode(itemCode,start);
            foreach (Adjustment adj in adjList)
            {
                //if (adj.DateApproved > start)
                    tList.Add(new TransactionOfRetrieval_Adjustment_PurchaseOrder(adj.DateApproved, adj.AdjustmentQuant.ToString(), "Adjustment","",""));
            }

            podList = podDAO.ListPODetailByItemCodeAndDate(itemCode,start);
            foreach (PODetail pod in podList)
            {

                PurchaseOrder po = poDAO.GetPurchaseOrder(pod.PurchaseOrderCode);
                //if (po.DateReceived > start)
                //{
                    string supName = GetSupplier(po.SupplierCode).SupplierName;
                    tList.Add(new TransactionOfRetrieval_Adjustment_PurchaseOrder(po.DateReceived, pod.Quantity.ToString(), supName,"",po.SupplierCode));
                    
                //}
            }
            if (tList.Count == 0)
            {
                return null;
            }
            tList.Sort();
            int? currentStock = Convert.ToInt32(cDAO.GetStationery(itemCode).Stock);

            tList.Last().Balance = currentStock;
            for (int i = tList.Count - 1; i > 0; i--)
            {
                if (tList[i].SupId!="")
                {
                    tList[i - 1].Balance = currentStock - Convert.ToInt32(tList[i].Quantity);
                    currentStock = tList[i - 1].Balance;
                }
                else if(tList[i].DeptId!="")
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
                    else if(trans.Dept_SupId == "Adjustment")
                    {
                       
                        if (Convert.ToInt32(trans.Quantity )> 0)
                            trans.Quantity = "ADJ+" + trans.Quantity;
                        else
                            trans.Quantity = "ADJ" + trans.Quantity;
                    }
                    tListBeforeEndDate.Add(trans);
                }
            }
            return tListBeforeEndDate;
        }
    }
}
