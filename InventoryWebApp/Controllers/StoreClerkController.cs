using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.DAO;
using System.Text;
using System.Data;

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
            StringBuilder adjustmentCodeTemp;

            if (adjustmentDAO.GetLastAdjustment() == null)
            {
                adjustmentCodeTemp = new StringBuilder("A000000001");
            }
            else
            {
                //create new adjustment code
                string fmt = "00000000";
                adjustmentCodeTemp = new StringBuilder(adjustmentDAO.GetLastAdjustment());
                int adjustmentCodeTemp2 = Convert.ToInt32(adjustmentCodeTemp.Replace("A", "").ToString());
                adjustmentCodeTemp2++;
                adjustmentCodeTemp = new StringBuilder(adjustmentCodeTemp2.ToString(fmt));
                adjustmentCodeTemp.Insert(0, "A", 1);
            }

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
        //QuotationPrint.aspx.cs
        public Supplier GetSupplier(string supplierCode)
        {
            return supplierDAO.GetSupplier(supplierCode);
        }
        //QuotationPrint.aspx.cs
        public DataTable LoadQuotationPriceList(string s, Supplier supplierPick)
        {
            using (EntityModel em = new EntityModel())
            {
                List<StationeryCatalogue> stationerySupplied = em.StationeryCatalogues.Where
                    (x => x.Supplier1 == s || x.Supplier2 == s || x.Supplier3 == s).ToList();

                DataTable intermediateDataSource = new DataTable();
                DataColumn[] keys = new DataColumn[1];
                DataColumn column;
                DataRow rowTempDataSource;

                column = new DataColumn();
                column.DataType = System.Type.GetType("System.String");
                column.ColumnName = "Description";

                intermediateDataSource.Columns.Add(column);

                keys[0] = column;
                intermediateDataSource.PrimaryKey = keys;

                column = new DataColumn();
                column.DataType = System.Type.GetType("System.Decimal");
                column.ColumnName = "Price";
                intermediateDataSource.Columns.Add(column);

                Tender tenderTemp;
                tenderTemp = em.Tenders.Where
                        (x => x.SupplierCode == supplierPick.SupplierCode).OrderByDescending(x => x.DateCreated).FirstOrDefault();

                foreach (StationeryCatalogue a in stationerySupplied)
                {
                    rowTempDataSource = intermediateDataSource.NewRow();
                    rowTempDataSource["Description"] = a.Description;

                    if (tenderTemp != null)
                    {
                        rowTempDataSource["Price"] = em.TenderDetails.Where
                                (x => x.ItemCode == a.ItemCode &&
                                x.TenderCode == tenderTemp.TenderCode).FirstOrDefault().Price;
                    }

                    intermediateDataSource.Rows.Add(rowTempDataSource);
                }
                return intermediateDataSource;
            }
        }
        //StockAdjustmentList.aspx.cs
        public List<Adjustment> ListAllAdjustments()
        {
            List<Adjustment> listAdjustment= adjustmentDAO.ListAllAdjustments();
            foreach (Adjustment a in listAdjustment)
            {
                a.ItemCode = stationeryDAO.GetStationery(a.ItemCode).Description;
            }
            return listAdjustment;
        }
    }
}