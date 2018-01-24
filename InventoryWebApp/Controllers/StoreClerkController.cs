using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.Models.Classes;
using InventoryWebApp.DAO;
using System.Text;
using System.Data;

namespace InventoryWebApp.Controllers
{
    public class StoreClerkController
    {
        IPODetailsDAO poDetailsDAO = new PODetailsDAO();
        IPurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        ISupplierDAO supplierDAO = new SupplierDAO();
        ISupplierDetailsDAO supplierDetailsDAO = new SupplierDetailsDAO();
        IEmployeeDAO employeeDAO = new EmployeeDAO();
        IStationeryCatalogueDAO stationeryDAO = new StationeryCatalogueDAO();
        ICatagoryDAO catagoryDAO = new CatagoryDAO();
        IRequestDetailsDAO requestDetailsDAO = new RequestDetailsDAO();
        IRequestDAO requestDAO = new RequestDAO();
        IDisbursementDAO disbursementDAO = new DisbursementDAO();
        IDisbursementDetailsDAO dDetailsDAO = new DisbursementDetailsDAO();
        IAdjustmentDAO adjustmentDAO = new AdjustmentDAO();
        ITenderDAO tenderDAO = new TenderDAO();

        internal int RecommendReorderQty(string itemCode)
        {
            int recommendQty = 0;

            StationeryCatalogue item = stationeryDAO.GetStationery(itemCode);

            int outstandingRequestQty = SumTotalRequiredQuantity(item);

            int qtyInPendingAndApprovedOrders = SumOfItemQtyInPendingAndApprovedOrders(itemCode);

            int remainingQtyToOrder = outstandingRequestQty - qtyInPendingAndApprovedOrders;

            //Case: if stock > reorderLevel
            if(item.Stock > item.ReorderLevel)
            {
                if (outstandingRequestQty - qtyInPendingAndApprovedOrders > item.ReorderQuantity)
                {
                    recommendQty = outstandingRequestQty - qtyInPendingAndApprovedOrders;
                }
                else
                {
                    recommendQty = Convert.ToInt32(item.ReorderQuantity);
                }
            }
            //Case: if stock <= reorderLevel
            else
            {
                //safety factor = 1.2
                //Required Quantity Level to Order to:
                int requiredQtyLevelToOrderTo = Convert.ToInt32(item.ReorderLevel * 1.2);
                int qtyToReorderToRequiredLevel = requiredQtyLevelToOrderTo - Convert.ToInt32(item.Stock);

                if (qtyToReorderToRequiredLevel > outstandingRequestQty - qtyInPendingAndApprovedOrders)
                {
                    if (qtyToReorderToRequiredLevel > item.ReorderQuantity)
                    {
                        recommendQty = qtyToReorderToRequiredLevel;
                    }
                    else
                    {
                        recommendQty = Convert.ToInt32(item.ReorderQuantity);
                    }
                }
                else
                {
                    if (outstandingRequestQty - qtyInPendingAndApprovedOrders > item.ReorderQuantity)
                    {
                        recommendQty = outstandingRequestQty - qtyInPendingAndApprovedOrders;
                    }
                    else
                    {
                        recommendQty = Convert.ToInt32(item.ReorderQuantity);
                    }
                }
            }

            return recommendQty;
        }

        internal int SumTotalRequiredQuantity(StationeryCatalogue item)
        {
            List<RequestDetail> rdList = ListIncompleteOrProcessingRequestsDetails(item.ItemCode);

            int requiredQty = 0;

            foreach (RequestDetail rd in rdList)
            {
                int qtyRequiredForRequestDetail = Convert.ToInt32(rd.RemainingQuant);
                Request request = GetRequest(rd.RequestCode);
                List<DisbursementDetail> dDetails = ListDisbursingDDetails(request, item);
                qtyRequiredForRequestDetail -= SumOfDisbursingQty(dDetails);
                requiredQty += qtyRequiredForRequestDetail;
            }

            return requiredQty;
        }

        internal int SumTotalRemainingQuantity(StationeryCatalogue item)
        {
            List<RequestDetail> rdList = ListIncompleteOrProcessingRequestsDetails(item.ItemCode);

            int remainingQty = 0;

            foreach (RequestDetail rd in rdList)
            {
                remainingQty += Convert.ToInt32(rd.RemainingQuant);
            }

            return remainingQty;
        }

        internal Request GetRequest(string requestCode)
        {
            return requestDAO.GetRequest(requestCode);
        }

        internal int SumOfDisbursingQty(List<DisbursementDetail> dDetails)
        {
            int sum = 0;
            foreach (DisbursementDetail dd in dDetails)
            {
                sum += Convert.ToInt32(dd.Quantity);
            }
            return sum;
        }

        internal List<DisbursementDetail> ListDisbursingDDetails(Request request, StationeryCatalogue item)
        {
            List<DisbursementDetail> returnList = new List<DisbursementDetail>();
            foreach (DisbursementDetail dDetails in dDetailsDAO.SearchDDByRequestAndItemCode(request, item))
            {
                Disbursement disbursement = disbursementDAO.GetDisbursementByCode(dDetails.DisbursementCode);
                if (disbursement.Status != "DISBURSED" || disbursement.Status != "NOT COLLECTED")
                {
                    returnList.Add(dDetails);
                }
            }
            return returnList;
        }

        internal List<RequestDetail> ListIncompleteOrProcessingRequestsDetails(string itemCode)
        {
            List<RequestDetail> returnList = new List<RequestDetail>();
            List<RequestDetail> rdList = GetRequestDetailsByItemCode(itemCode);
            foreach (RequestDetail rd in rdList)
            {
                string status = Convert.ToString(rd.Status);
                if (status.ToUpper() == "INCOMPLETE" || status.ToUpper() == "PROCESSING")
                {
                    returnList.Add(rd);
                }
            }
            return returnList;

        }

        internal List<StationeryCatalogue> ListStationeries()
        {
            return stationeryDAO.ListAllStationery();
        }


        internal List<RequestDetail> GetAllRequestDetails()
        {
            List<RequestDetail> rdList = new List<RequestDetail>();
            foreach (Request r in requestDAO.ListAllRequest())
            {
                rdList.AddRange(requestDetailsDAO.ListRequestDetail(r.RequestCode));
            }
            return rdList;
        }

        internal List<RequestDetail> GetRequestDetailsByItemCode(string itemCode)
        {
            List<RequestDetail> rdList = new List<RequestDetail>();
            foreach (Request r in requestDAO.ListAllRequest())
            {
                foreach (RequestDetail rd in requestDetailsDAO.ListRequestDetail(r.RequestCode))
                {
                    if (rd.ItemCode.ToUpper().Equals(itemCode.ToUpper()))
                    {
                        rdList.Add(rd);
                    }
                }
            }
            return rdList;
        }

        internal int SumOfItemQtyInPendingAndApprovedOrders(string itemCode)
        {
            int sum = 0;
            foreach (PODetail pod in ListPendingAndApprovedOrderDetails(itemCode))
            {
                sum += Convert.ToInt32(pod.Quantity);
            }
            return sum;
        }

        internal List<PODetail> ListPendingAndApprovedOrderDetails(string itemCode)
        {
            List<PODetail> podList = new List<PODetail>();
            foreach (PODetail pod in poDetailsDAO.ListPODetailsByItemCode(itemCode))
            {
                PurchaseOrder po = purchaseOrderDAO.GetPurchaseOrder(pod.PurchaseOrderCode);
                if (po.Status.ToUpper() == "PENDING" || po.Status.ToUpper() == "APPROVED")
                {
                    podList.Add(pod);
                }
            }
            return podList;
        }

        internal PurchaseOrder GetPurchaseOrderByCode(string poNum)
        {
            return purchaseOrderDAO.GetPurchaseOrder(poNum);
        }

        internal int? GetStationeryReorderQty(string itemCode)
        {
            return GetStationeryByItemCode(itemCode).ReorderQuantity;
        }

        internal int CancelPurchaseOrder(PurchaseOrder po)
        {
            po.Status = "CANCELLED";

            return purchaseOrderDAO.UpdatePurchaseOrder(po);

        }

        internal int EditingPurchaseOrder(PurchaseOrder po)
        {
            po.Status = "EDITING";
            po.LastUpdatedBy = "yixiang@ssis.edu.sg";
            po.DateLastUpdated = DateTime.Now;
            return purchaseOrderDAO.UpdatePurchaseOrder(po);
        }

        internal int FinishEditingPurchaseOrder(PurchaseOrder po)
        {
            po.Status = "PENDING";
            po.LastUpdatedBy = "yixiang@ssis.edu.sg";
            po.DateLastUpdated = DateTime.Now;
            return purchaseOrderDAO.UpdatePurchaseOrder(po);
        }

        internal int AckPurchaseOrder(PurchaseOrder po, List<PODetail> poDetails)
        {
            Dictionary<StationeryCatalogue, KeyValuePair<int?, decimal?>> newStationeryStockAndPrice
                = new Dictionary<StationeryCatalogue, KeyValuePair<int?, decimal?>>();

            bool error = false;

            foreach (PODetail pod in poDetails)
            {
                StationeryCatalogue stationery = stationeryDAO.GetStationery(pod.ItemCode);
                decimal? stockPrice = stationery.Price;
                decimal? supplierPrice = pod.Price;
                int? stock = stationery.Stock;
                int? orderQuantity = pod.Quantity;

                if (stock != null && stockPrice != null && orderQuantity != null && supplierPrice != null)
                {
                    decimal? newPrice = (stockPrice * stock + supplierPrice * orderQuantity) / (stock + orderQuantity);
                    int? newStock = stock + orderQuantity;
                    newStationeryStockAndPrice.Add(stationery, new KeyValuePair<int?, decimal?>(newStock, newPrice));
                }
                else
                {
                    error = true;
                }

            }

            if (error)
            {
                return -1;
            }

            foreach (var n in newStationeryStockAndPrice)
            {
                var stationery = n.Key;
                stationery.Stock = n.Value.Key;
                stationery.Price = n.Value.Value;
                stationeryDAO.UpdateStationery(stationery);
            }

            po.DateReceived = DateTime.Now;
            po.ReceivedBy = "yixiang@ssis.edu.sg";
            po.Status = "RECEIVED";
            return purchaseOrderDAO.UpdatePurchaseOrder(po);
        }

        internal string GetItemDescription(string itemCode)
        {
            return stationeryDAO.GetStationery(itemCode).Description;
        }

        internal int UpdatePODetail(PODetail poDetail)
        {
            return poDetailsDAO.UpdatePODetail(poDetail);
        }

        //


        //start methods for CreatePurchaseOrder.aspx
        internal List<StationeryCatalogue> GetStationeriesBelowReorderLevel()
        {
            return stationeryDAO.GetStationeriesBelowReorderLevel();
        }

        internal int CreatePurchaseOrders(List<PurchaseItem> purchaseItems)
        {
            int rows = 0;
            var purchaseOrders = new List<PurchaseOrder>();
            foreach (PurchaseItem pi in purchaseItems)
            {
                bool hasPurchaseOrder = false;
                PurchaseOrder purchaseOrder = new PurchaseOrder();

                DateTime now = DateTime.Now;

                foreach (PurchaseOrder po in purchaseOrders)
                {
                    if (pi.SupplierCode == po.SupplierCode)
                    {
                        hasPurchaseOrder = true;
                        purchaseOrder = po;
                        break;
                    }
                }
                if (!hasPurchaseOrder)
                {
                    var po = new PurchaseOrder();
                    po.DateCreated = now;
                    po.PurchaseOrderCode = pi.SupplierCode + now.ToString("yyMMddHHmmssfff");
                    //po.Notes = txtNotes.Value;
                    po.Status = "PENDING";
                    po.SupplierCode = pi.SupplierCode;
                    po.UserName = "yixiang@ssis.edu.sg";
                    purchaseOrder = po;
                    purchaseOrders.Add(po);
                }
                var pod = new PODetail();
                pod.ItemCode = pi.Stationery.ItemCode;
                pod.Price = GetSupplierItemPrice(pi.SupplierCode, pi.Stationery.ItemCode);
                pod.Quantity = pi.OrderQuantity;
                pod.PurchaseOrderCode = purchaseOrder.PurchaseOrderCode;
                pod.Notes = pi.Notes;
                purchaseOrder.PODetails.Add(pod);
            }
            foreach (PurchaseOrder po in purchaseOrders)
            {
                purchaseOrderDAO.AddPurchaseOrder(po);
                rows++;
            }
            return rows;
        }


        internal bool IsPurchaseOrderEditable(PurchaseOrder po)
        {
            if (po.Status.ToUpper() == "PENDING") return true;
            return false;
        }

        internal List<PODetail> GetPODetailsByPOCode(string purchaseOrderCode)
        {
            return poDetailsDAO.ListPODetailsByPOCode(purchaseOrderCode);
        }

        internal decimal? GetSupplierItemPrice(string supplierCode, string itemCode)
        {
            return supplierDetailsDAO.GetSupplierDetail(supplierCode, itemCode).Price;
        }
        internal List<String> GetCategories()
        {
            List<String> listCat = new List<String>();
            foreach (Category c in catagoryDAO.ListAllCategory())
            {
                listCat.Add(c.CategoryCode);
            }
            return listCat;
        }

        internal StationeryCatalogue GetStationeryByDescription(String description)
        {
            return stationeryDAO.SearchByDescription(description).FirstOrDefault<StationeryCatalogue>();

        }

        internal List<String> GetProductListByCat(string categoryCode)
        {
            return stationeryDAO.SearchByCategory(categoryCode).Select(s => s.Description).ToList<String>();
        }

        internal StationeryCatalogue GetStationeryByItemCode(string itemCode)
        {
            return stationeryDAO.GetStationery(itemCode);
        }

        //end methods for CreatePurchaseOrder.aspx


        //start methods for ViewPurchaseOrder.aspx
        internal string GetEmployeeName(string username)
        {
            return employeeDAO.GetEmployeeName(username);
        }

        internal string GetSupplierName(string supplierCode)
        {
            return GetSupplier(supplierCode).SupplierName;
        }

        internal Supplier GetSupplier(string supplierCode)
        {
            return supplierDAO.GetSupplier(supplierCode);
        }



        internal List<PurchaseOrder> GetAllPurchaseOrders()
        {
            return purchaseOrderDAO.ListAllPurchaseOrders();
        }

        internal List<PurchaseOrder> GetPurchaseOrdersByDateCreated(DateTime startDate, DateTime endDate)
        {
            return purchaseOrderDAO.ListPurchaseOrdersByDateCreated(startDate, endDate);
        }

        internal int ApprovePurchaseOrder(PurchaseOrder po)
        {
            po.Status = "APPROVED";
            return purchaseOrderDAO.UpdatePurchaseOrder(po);
        }

        internal List<PurchaseOrder> GetPurchaseOrdersBySearchText(int searchIndex, string searchText)
        {

            using (EntityModel em = new EntityModel())
            {
                switch (searchIndex)
                {
                    case 1:
                        return purchaseOrderDAO.ListPurchaseOrdersByPOCode(searchText);
                    case 2:
                        {
                            List<PurchaseOrder> orders = new List<PurchaseOrder>();
                            foreach (PurchaseOrder p in GetAllPurchaseOrders())
                            {
                                if (GetSupplierName(p.SupplierCode).ToUpper().Contains(searchText.ToUpper()))
                                {
                                    orders.Add(p);
                                }
                            }
                            return orders;
                        }
                    case 4:
                        {
                            List<PurchaseOrder> orders = new List<PurchaseOrder>();
                            foreach (PurchaseOrder p in GetAllPurchaseOrders())
                            {
                                if (GetEmployeeName(p.UserName).ToUpper().Contains(searchText.ToUpper()))
                                {
                                    orders.Add(p);
                                }
                            }
                            return orders;
                        }
                    case 5:
                        return purchaseOrderDAO.ListPurchaseOrdersByStatus(searchText);
                    default:
                        return GetAllPurchaseOrders();
                }
            }
        }




        //end methods for ViewPurchaseOrder.aspx


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
        //public Supplier GetSupplier(string supplierCode)
        //{
        //    return supplierDAO.GetSupplier(supplierCode);
        //}
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
        //QuotationPrint.aspx.cs
        public Tender GetTender(string supplierCode)
        {
            Tender returnTender = new Tender();
            List<Tender> tenderResults = tenderDAO.ListTendersBySupplierCode(supplierCode);
            if (tenderResults.Count == 0)
            {
                returnTender.DateCreated = new DateTime(2000, 1, 1);
                return returnTender;
            }
            else
            {
                return tenderResults.OrderByDescending(x => x.DateCreated).FirstOrDefault();
            }
        }
        //StockAdjustmentList.aspx.cs
        public List<Adjustment> ListAllAdjustments()
        {
            List<Adjustment> listAdjustment = adjustmentDAO.ListAllAdjustments();
            foreach (Adjustment a in listAdjustment)
            {
                a.ItemCode = stationeryDAO.GetStationery(a.ItemCode).Description;
            }
            return listAdjustment;
        }


    }
}