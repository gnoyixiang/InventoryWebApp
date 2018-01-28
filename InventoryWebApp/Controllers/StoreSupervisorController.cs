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
            dList = dbdDAO.ListDDByItemCode(itemCode);
            foreach (DisbursementDetail d in dList)
            {
                Disbursement r = dbDAO.GetDisbursementByCode(d.DisbursementCode);
                if (r.DateDisbursed > start)
                    tList.Add(new TransactionOfRetrieval_Adjustment_PurchaseOrder(r.DateDisbursed, d.Quantity, r.DepartmentCode, ""));
            }

            adjList = adjDAO.ListAllAdjustmentsByItemCode(itemCode);
            foreach (Adjustment adj in adjList)
            {
                if (adj.DateApproved > start)
                    tList.Add(new TransactionOfRetrieval_Adjustment_PurchaseOrder(adj.DateApproved, adj.AdjustmentQuant, "", ""));
            }

            podList = podDAO.ListPODetailsByItemCode(itemCode);
            foreach (PODetail pod in podList)
            {

                PurchaseOrder po = poDAO.GetPurchaseOrder(pod.PurchaseOrderCode);
                if (po.DateReceived > start)
                    tList.Add(new TransactionOfRetrieval_Adjustment_PurchaseOrder(po.DateReceived, pod.Quantity, "", po.SupplierCode));
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
                if (tList[i].Quantity > 0)
                {
                    tList[i - 1].Balance = currentStock - tList[i].Quantity;
                    currentStock = tList[i - 1].Balance;
                }
                else
                {
                    tList[i - 1].Balance = currentStock + tList[i].Quantity;
                    currentStock = tList[i - 1].Balance;
                }
            }
            List<TransactionOfRetrieval_Adjustment_PurchaseOrder> tListBeforeEndDate = new List<TransactionOfRetrieval_Adjustment_PurchaseOrder>();
            foreach (TransactionOfRetrieval_Adjustment_PurchaseOrder trans in tList)
            {
                if (trans.Date <= end)
                    tListBeforeEndDate.Add(trans);
            }
            return tListBeforeEndDate;
        }
    }
}