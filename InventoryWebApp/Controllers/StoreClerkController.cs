using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.DAO;
using System.Text;

namespace InventoryWebApp.Controllers
{
    public class StoreClerkController
    {
        IDepartmentDAO departmentDAO = new DepartmentDAO();
        IDisbursementDetailsDAO disbursementDetailsDAO = new DisbursementDetailsDAO();
        IDisbursementDAO disbursementDAO = new DisbursementDAO();
        IRequestDAO requestDAO = new RequestDAO();
        IRequestDetailsDAO requestDetailsDAO = new RequestDetailsDAO();
        IRetrievalDAO retrievalDAO = new RetrievalDAO();
        IRetrievalDetailsDAO retrievalDetailsDAO = new RetrievalDetailsDAO();
        IStationeryCatalogueDAO stationeryDAO = new StationeryCatalogueDAO();
        IEmployeeDAO employeeDAO = new EmployeeDAO();
        IAdjustmentDAO adjustmentDAO = new AdjustmentDAO();
        ISupplierDAO supplierDAO = new SupplierDAO();

        //StockAdjustmentNew.aspx.cs
        public List<string> LoadDDLStockAdjustmentNew()
        {
            List<StationeryCatalogue> prepStationeryList = stationeryDAO.ListAllStationery();
            List<string> stringStationeryList = new List<string>();
            foreach (StationeryCatalogue a in prepStationeryList)
            {
                string b = a.Description;
                stringStationeryList.Add(b);
            }
            return stringStationeryList;
        }
        //StockAdjustmentNew.aspx.cs
        public string UpdateViewCurrentStockAmount(string selectedDDLItem)
        {
            List<StationeryCatalogue> listStationeryFound = stationeryDAO.SearchByDescription(selectedDDLItem);
            string selectedItemStockAmt = (stationeryDAO.GetStationery(listStationeryFound.FirstOrDefault().ItemCode.ToString()).Stock.ToString());
            return selectedItemStockAmt;
        }
        //StockAdjustmentNew.aspx.cs
        public int SubmitAdjustment(Adjustment submittedAdjustment)
        {
            submittedAdjustment.Status = "pending";
            int a = adjustmentDAO.AddAdjustment(submittedAdjustment);
            return a;
        }
        //StockAdjustmentNew.aspx.cs
        public int SaveAdjustment(Adjustment submittedAdjustment)
        {
            submittedAdjustment.Status = "unsubmitted";
            int a = adjustmentDAO.AddAdjustment(submittedAdjustment);
            return a;
        }
        //StockAdjustmentNew.aspx.cs
        public Adjustment PrefillAdjustment(string selectedItem, int quantityUpdate, string reason)
        {
            DateTime dateCreated = DateTime.Now.Date;

            Adjustment a = new Adjustment();
            //a.AdjustmentCode = em.Adjustments.Last().AdjustmentCode;

            //create new adjustment code
            string fmt = "00000000";
            StringBuilder adjustmentCodeTemp = new StringBuilder(adjustmentDAO.GetLastAdjustment());
            int adjustmentCodeTemp2 = Convert.ToInt32(adjustmentCodeTemp.Replace("A", "").ToString());
            adjustmentCodeTemp2++;
            adjustmentCodeTemp = new StringBuilder(adjustmentCodeTemp2.ToString(fmt));
            adjustmentCodeTemp.Insert(0, "A", 1);

            a.AdjustmentCode = adjustmentCodeTemp.ToString();
            a.DateCreated = dateCreated;
            a.ItemCode = stationeryDAO.SearchByDescription(selectedItem).FirstOrDefault().ItemCode;
            a.AdjustmentQuant = quantityUpdate;
            a.Reason = reason;

            return a;
        }
        //StockAdjustmentEdit.aspx.cs
        public int UpdateAdjustment(Adjustment submittedAdjustment, int quantityUpdate, string reason)
        {
            submittedAdjustment.AdjustmentQuant = quantityUpdate;
            submittedAdjustment.Reason = reason;
            int a = adjustmentDAO.UpdateAdjustment(submittedAdjustment);
            return a;
        }
        //StockAdjustmentEdit.aspx.cs
        public Adjustment GetAdjustment(string adjustmentCode)
        {
            return adjustmentDAO.GetAdjustment(adjustmentCode);
        }
        //StockAdjustmentEdit.aspx.cs
        public string DisplayCurrentStock(Adjustment adjustmentInput)
        {
            return stationeryDAO.GetStationery(adjustmentInput.ItemCode).Stock.ToString();
        }
        //StockAdjustmentEdit.aspx.cs
        public string DisplayItemChoiceName(Adjustment adjustmentInput)
        {
            return stationeryDAO.GetStationery(adjustmentInput.ItemCode).Description.ToString();
        }

        //QuotationView.aspx.cs
        public List<Supplier> ListOfSupplier()
        {
            return supplierDAO.ListOfSupplier();
        }
        //StockAdjustmentList.aspx.cs
        public List<Adjustment> ListAllAdjustments()
        {
            return adjustmentDAO.ListAllAdjustments();
        }
    }
}