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
        ITenderDetailsDAO tenderDetailsDAO = new TenderDetailsDAO();
        IDepartmentDAO departmentDAO = new DepartmentDAO();
        IDisbursementDetailsDAO disbursementDetailsDAO = new DisbursementDetailsDAO();
        IRetrievalDAO retrievalDAO = new RetrievalDAO();
        IRetrievalDetailsDAO retrievalDetailsDAO = new RetrievalDetailsDAO();
        ICollectionPointDAO collectionPointDAO = new CollectionPointDAO();

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

        internal List<string> GetTenderYearsFromSupplier(string supplierCode)
        {
            List<string> tenderYears = new List<string>();
            foreach(Tender t in tenderDAO.ListTendersBySupplierCode(supplierCode))
            {
                tenderYears.Add(Convert.ToDateTime(t.DateCreated).Year.ToString());
            }
            return tenderYears;
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

        internal List<PurchaseOrder> GetPurchaseOrdersByDateCreated(DateTime date)
        {
            return purchaseOrderDAO.ListPurchaseOrdersByDateCreated(date);
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
            DateTime dateCreated = DateTime.Now;

            Adjustment a = new Adjustment();
            //a.AdjustmentCode = em.Adjustments.Last().AdjustmentCode;
            //StringBuilder adjustmentCodeTemp;

            //adjustmentCodeTemp = new StringBuilder("A" + DateTime.Now.ToString("ddMMyyHHmmssfff"));

            //create new adjustment code
            //string fmt = "00000000";
            //adjustmentCodeTemp = new StringBuilder(adjustmentDAO.GetLastAdjustment());
            //int adjustmentCodeTemp2 = Convert.ToInt32(adjustmentCodeTemp.Replace("A", "").ToString());
            //adjustmentCodeTemp2++;
            //adjustmentCodeTemp = new StringBuilder(adjustmentCodeTemp2.ToString(fmt));
            //adjustmentCodeTemp.Insert(0, "A", 1);
            

            a.AdjustmentCode = "A" + dateCreated.ToString("ddMMyyHHmmssfff");
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

        public Tender GetTenderByCodeAndDate(Supplier supplierPick, int year)
        {
            List<Tender> tList = tenderDAO.ListTendersBySupplierCode(supplierPick.SupplierCode);
            Tender tender = null;
            foreach (Tender t in tList)
            {
                if (Convert.ToDateTime(t.DateCreated).Year == year)
                {
                    tender = t;
                    break;
                }
            }
            return tender;
        }

        public List<TenderDetail> LoadQuotationPriceList(Supplier supplierPick, int year)
        {
            Tender tender = GetTenderByCodeAndDate(supplierPick, year);
            if(tender != null)
            {
                return tenderDetailsDAO.ListTenderDetailsByTenderCode(tender.TenderCode);
            }
            return null;
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

        //Nat

        public RetrievalDetail GetProcessingRetrievalDetailByItemCode(String itemCode)
        {
            List<RetrievalDetail> rdList = retrievalDetailsDAO.ListRetrievalDetailsByRetrievalCode(GetCurrentRetrieval().RetrievalCode);
            foreach (var item in rdList)
            {
                if (item.ItemCode == itemCode)
                {
                    return item;
                }
            }
            return null;
            
        }
        
        public List<Retrieval> GetRetrievalsByStatus(String status)
        {
            return retrievalDAO.ListRetrievalByStatus(status);
        }
        public decimal? GetPriceOfDisbursement(String disbursementCode)
        {
            List<DisbursementDetail> ddList = GetDisbursementDetails(disbursementCode);
            decimal? totalPrice = 0;
            foreach (var item in ddList)
            {
                totalPrice += item.Price * item.ActualQuantity;
            }
            return totalPrice;
        }

        public List<Disbursement> GetDisbursementsByStatus(String status)
        {
            return disbursementDAO.SearchDbmByStatus(status);
        }

        public List<Disbursement> GetAllDisbursement()
        {
            return disbursementDAO.GetAllDisbursement();
        }
        public Disbursement GetDisbursement(string disbursementCode)
        {
            return disbursementDAO.GetDisbursementByCode(disbursementCode);
        }
        public int UpdateRequestDetail(RequestDetail rd)
        {
            return requestDetailsDAO.UpdateRequestDetail(rd);
        }
        public int UpdateStationeryCatalogue(StationeryCatalogue sc)
        {
            return stationeryDAO.UpdateStationery(sc);
        }

        public List<DisbursementDetail> GetDisbursementDetails(String disbursementCode)
        {
            return disbursementDetailsDAO.SearchDDByDCode(disbursementCode);
        }

        public int UpdateDisbursement (Disbursement d)
        {
            return disbursementDAO.UpdateDbmStatus(d);
        }
        public void UpdateDisbursementDetail(DisbursementDetail dd)
        {
            disbursementDetailsDAO.UpdateDisbursementDetail(dd);
        }
        public RequestDetail GetRequestDetail(string RequestC, string itemCode)
        {
            return requestDetailsDAO.GetRequestDetail(RequestC, itemCode);
        }
        public List<DisbursementDetail> GetDisbursingDisbursementDetail()
        {
            List<DisbursementDetail> ddList = new List<DisbursementDetail>();
            foreach (var item in GetDisbursingDisbursements())
            {
                ddList.AddRange(GetDisbursingDisbDetailsByDeptCode(item.DepartmentCode));
            }
            return ddList;
        }
        public Disbursement GetDisbursingDisbursementByDeptCode(String deptCode)
        {
            List<Disbursement> dList = GetDisbursingDisbursements();
            foreach (var item in dList)
            {
                if (item.DepartmentCode == deptCode)
                    return item;
            }
            return null;
        }
        public List<DisbursementDetail> GetDisbursingDisbDetailsByDeptCode(String deptCode)
        {
            try
            {
                return disbursementDetailsDAO.SearchDDByDCode(GetDisbursingDisbursementByDeptCode(deptCode).DisbursementCode);
            } catch(Exception e)
            {
                return null;
            }
            
            
        }

        public List<Disbursement> GetDisbursementListBySClerkInCharge(String collectionPointCode)
        {
            List<Disbursement> disbursingList = GetDisbursingDisbursements();
            List<Disbursement> dList = new List<Disbursement>();
            foreach (var item in disbursingList)
            {
                if (item.CollectionPointCode == collectionPointCode)
                {
                    dList.Add(item);
                }
            }
            return dList;

        }

        public List<Disbursement> GetDisbursementListByCollectionPoint(String collectionPointCode, String disbursementStatus)
        {
            List<Disbursement> disbursingList = GetDisbursementsByStatus(disbursementStatus);
            List<Disbursement> dList = new List<Disbursement>();
            foreach (var item in disbursingList)
            {
                if (item.CollectionPointCode == collectionPointCode)
                {
                    dList.Add(item);
                }
            }
            return dList;

        }
        public List<Disbursement> GetDisbursingDisbursements()
        {

            List<Disbursement> dList = disbursementDAO.SearchDbmByStatus("disbursing");
            dList.Sort();
            return dList;
        }

        public String GetCollectionSClerkInCharge(String collectionPointCode)
        {
            return employeeDAO.GetEmployeeByCode(collectionPointDAO.SearchByCollectionPointCode(collectionPointCode).FirstOrDefault().SClerkInCharge).EmployeeName;
        }
        public void SetCollectionDateToDisbursement(DateTime dt)
        {
            List<Disbursement> dList = GetDisbursementsByStatus("allocating");
            foreach(var item in dList)
            {
                item.DatePlanToCollect = dt;
                item.Status = "disbursing";
                item.CollectionPointCode = departmentDAO.GetDepartmentInfo(item.DepartmentCode).CollectionPointCode;
                disbursementDAO.UpdateDbmStatus(item);
                foreach (var detail in disbursementDetailsDAO.SearchDDByDCode(item.DisbursementCode))
                {
                    detail.ActualQuantity = detail.Quantity;
                    detail.Price = GetStationeryByCode(detail.ItemCode).Price;
                    disbursementDetailsDAO.UpdateDisbursementDetail(detail);
                    StationeryCatalogue sc = GetStationeryByCode(detail.ItemCode);
                    sc.Stock -= detail.Quantity;
                    stationeryDAO.UpdateStationery(sc);
                }
            }
        }
        public CollectionPoint GetCollectionPointByCode (String collectionPointCode)
        {
            return collectionPointDAO.SearchByCollectionPointCode(collectionPointCode).FirstOrDefault();
        }
        
        public List<Department> GetDisbursingDepartmentList(List<Disbursement> dList)
        {
            List<Department> deptList = new List<Department>();
            foreach(var item in dList)
            {
                deptList.Add(departmentDAO.GetDepartmentInfo(item.DepartmentCode));
            }
            return deptList;
        }
        public HashSet<CollectionPoint> GetListOfCollectionPoint(String disbursementStatus)
        {
            List<Disbursement> dList = disbursementDAO.SearchDbmByStatus(disbursementStatus);
            HashSet<CollectionPoint> cpList = new HashSet<CollectionPoint>();
            HashSet<String> collectionList = new HashSet<string>();
            foreach (var item in dList)
            {
                cpList.Add(collectionPointDAO.SearchByCollectionPointCode(item.CollectionPointCode).FirstOrDefault());
            }

            return cpList; 
        }

        public DateTime GetDefaultCollectionDate()
        {
            DateTime today = DateTime.Today;
            int daysUntilTuesday = ((int)DayOfWeek.Tuesday - (int)today.DayOfWeek + 7) % 7;
            DateTime nextTuesday = today.AddDays(daysUntilTuesday);
            return nextTuesday;
        }
        //public void ChangeDisbursementDisbursingToAllocating()
        //{
        //    List<Disbursement> dList = disbursementDAO.SearchDbmByStatus("disbursing");
        //    foreach (var item in dList)
        //    {
        //        item.Status = "allocating";
        //        item.DateCreated = null;
        //        item.DatePlanToCollect = null;
        //        disbursementDAO.UpdateDbmStatus(item);
        //    }
        //}
        //public void ChangeDisbursementAllocatingToDisbursing()
        //{
        //    List<Disbursement> dList = disbursementDAO.SearchDbmByStatus("allocating");
        //    foreach (var item in dList)
        //    {
        //        item.Status = "disbursing";
        //        item.DateCreated = DateTime.Today;
        //        item.CollectionPointCode = departmentDAO.GetDepartmentInfo(item.DepartmentCode).CollectionPointCode;
        //        disbursementDAO.UpdateDbmStatus(item);
                
        //    }
        //}
        public List<DisbursementDetail> GenerateDisbursementDetail()
        {
            List<RequestDetail> requestDetailList = this.GetNotDisbursedRequestDetailList();
            List<DisbursementDetail> ddList = new List<DisbursementDetail>();
            Dictionary<String, int> quantRetrievedRemained = new Dictionary<string, int>();

            foreach (var item in this.GetCurrentRetrieval().RetrievalDetails)
            {
                quantRetrievedRemained.Add(item.ItemCode, (int)item.QuantityRetrieved);
            }

            requestDetailList.Sort();

            foreach (var item in requestDetailList)
            {
                if (quantRetrievedRemained[item.ItemCode] > 0)
                {
                    DisbursementDetail dd = new DisbursementDetail();
                    dd.RequestCode = item.RequestCode;
                    dd.ItemCode = item.ItemCode;
                    //requestDAO.GetRequest(item.RequestCode).DepartmentCode;
                    if (quantRetrievedRemained[item.ItemCode] > item.RemainingQuant)
                    {
                        dd.Quantity = item.RemainingQuant;
                        quantRetrievedRemained[item.ItemCode] -= (int)item.RemainingQuant;
                    }
                    else
                    {
                        dd.Quantity = quantRetrievedRemained[item.ItemCode];
                        quantRetrievedRemained[item.ItemCode] = 0;
                    }
                    ddList.Add(dd);
                }
            }
            return ddList;
        }

        public Dictionary<String, List<DisbursementDetail>> GenerateDisbursementDetailPerItem()
        {
            Retrieval retrieval = this.GetCurrentRetrieval();
            List<DisbursementDetail> ddList = new List<DisbursementDetail>();

            Dictionary<String, List<DisbursementDetail>> ddDict = new Dictionary<string, List<DisbursementDetail>>();

            foreach (var item in retrieval.RetrievalDetails)
            {
                ddDict.Add(item.ItemCode, new List<DisbursementDetail>());
            }
            
            if (disbursementDAO.SearchDbmByStatus("allocating").Count == 0)
            {
                foreach (var item in disbursementDAO.SearchDbmByStatus("disbursing"))
                {
                    ddList.AddRange(disbursementDetailsDAO.SearchDDByDCode(item.DisbursementCode));
                }
            }else
            {
                foreach (var item in disbursementDAO.SearchDbmByStatus("allocating"))
                {
                    ddList.AddRange(disbursementDetailsDAO.SearchDDByDCode(item.DisbursementCode));
                }
            }

            foreach (var item in ddList)
            {
                ddDict[item.ItemCode].Add(item);
            }
            return ddDict;
        }

        public Dictionary<String, List<DisbursementDetail>> GenerateDisbursementDetail2()
        {
            Retrieval retrieval = this.GetCurrentRetrieval();
            List<RequestDetail> requestDetailList = this.GetNotDisbursedRequestDetailList();
            Dictionary<String, List<DisbursementDetail>> ddList = new Dictionary<string, List<DisbursementDetail>>();
            Dictionary<String, int> quantRetrievedRemained = new Dictionary<string, int>();
            //Dictionary<String, List<DisbursementDetail>>
            //GenerateDisbursementDetail

            foreach (var item in retrieval.RetrievalDetails)
            {
                quantRetrievedRemained.Add(item.ItemCode, (int)item.QuantityRetrieved);
            }

            requestDetailList.Sort();

            foreach (var item in retrieval.RetrievalDetails)
            {
                ddList.Add(item.ItemCode, null);
            }

            foreach (var item in requestDetailList)
            {
                if (quantRetrievedRemained[item.ItemCode] > 0)
                {
                    DisbursementDetail dd = new DisbursementDetail();
                    dd.RequestCode = item.RequestCode;
                    dd.ItemCode = item.ItemCode;
                    if (quantRetrievedRemained[item.ItemCode] > item.RemainingQuant)
                    {
                        dd.Quantity = item.RemainingQuant;
                        quantRetrievedRemained[item.ItemCode] -= (int)item.RemainingQuant;
                    }
                    else
                    {
                        dd.Quantity = quantRetrievedRemained[item.ItemCode];
                        quantRetrievedRemained[item.ItemCode] = 0;
                    }
                    ddList[item.ItemCode].Add(dd);
                }
            }
            return ddList;
        }

        public HashSet<String> GetListOfDeptFromDisbursementDetails(List<DisbursementDetail> ddList)
        {
            HashSet<String> departmentList = new HashSet<string>();
            foreach (var item in ddList)
            {

                departmentList.Add(requestDAO.GetRequest(item.RequestCode).DepartmentCode);
            }
            return departmentList;
        }

        public List<Disbursement> GetAllocatingDisbursementList()
        {

            List<Disbursement> dbmList = disbursementDAO.SearchDbmByStatus("allocating").ToList();
            if (dbmList.Count == 0)
            {
                if (GetDisbursingDisbursements().Count == 0)
                {
                    List<DisbursementDetail> ddList = GenerateDisbursementDetail();
                    HashSet<String> departmentList = GetListOfDeptFromDisbursementDetails(ddList);
                    Dictionary<String, Disbursement> disbursementDictionary = new Dictionary<string, Disbursement>();

                    int count = 0;

                    foreach (var item in departmentList)
                    {
                        Disbursement disbursement = new Disbursement();
                        disbursement.DisbursementCode = "DBM" + DateTime.Now.ToString("yyMMddhhmmssfff") + count++;
                        disbursement.DepartmentCode = item;
                        disbursement.Status = "allocating";
                        //disbursement.Username = Session["User"]; Need to write with user
                        //dbm.Add(disbursement);
                        disbursementDictionary.Add(item, disbursement);
                    }
                    //Add disbursement Details to disbursement
                    foreach (var item in ddList)
                    {
                        item.DisbursementCode = disbursementDictionary[requestDAO.GetRequest(item.RequestCode).DepartmentCode].DisbursementCode;
                        disbursementDictionary[requestDAO.GetRequest(item.RequestCode).DepartmentCode].DisbursementDetails.Add(item);
                    }

                    foreach (var item in disbursementDictionary.Values)
                    {
                        disbursementDAO.AddDisbursement(item);
                    }
                    return disbursementDictionary.Values.ToList();
                }
                else
                    return null;

               
            }
            else
            {
                return dbmList;
            }
        }


        public List<RequestDetail> GetNotDisbursedRequestDetailList()
        {
            List<RequestDetail> rdList = requestDetailsDAO.SearchOutstandingRequestDetails();
            
            foreach (var item in rdList)
            {
                item.Request = requestDAO.GetRequest(item.RequestCode);
            }
            return rdList;
        }

        public Employee GetEmployee(String emplCode)
        {
            return employeeDAO.GetEmployeeByCode(emplCode);
        }

        public Retrieval UpdateCurrentRetrievalToRetrieved()
        {
            Retrieval retrieval = retrievalDAO.ListRetrievalByStatus("processing").FirstOrDefault();
            retrieval.Status = "retrieved";
            retrieval.DateRetrieved = DateTime.Today;
            retrievalDAO.UpdateRetrival(retrieval);
            return retrieval;
        }

        public Retrieval GetCurrentRetrieval()
        {
            Retrieval retrieval = retrievalDAO.ListRetrievalByStatus("processing").FirstOrDefault();
            //Retrieval rTest = retrievalList.FirstOrDefault();
            if (retrieval == null)
            {
                if (GetDisbursingDisbursements().Count == 0)
                {
                    retrieval = new Retrieval();
                    retrieval.RetrievalDetails = new List<RetrievalDetail>();
                    retrieval.RetrievalCode = "RT" + DateTime.Now.ToString("yyMMddHHmmssfff");
                    retrieval.Status = "processing";
                    retrieval.UserName = "nathalie@ssis.edu.sg";
                    retrieval.DateRetrieved = DateTime.Today;
                    //retrieval.UserName = Identity.User;
                    //retrieval.DateRetrieved = DateTime.Now;
                    retrieval = CreateRetrievalDetails(retrieval);
                    retrievalDAO.AddRetrieval(retrieval);
                    return retrieval;
                }
                return null;
                
            }
            else
            {
                Retrieval newRetrieval = new Retrieval();
                newRetrieval.RetrievalCode = retrieval.RetrievalCode;
                newRetrieval.Status = retrieval.Status;
                newRetrieval.DateRetrieved = retrieval.DateRetrieved;
                newRetrieval.RetrievalDetails = new List<RetrievalDetail>();
                newRetrieval.RetrievalDetails = retrievalDetailsDAO.ListRetrievalDetailsByRetrievalCode(newRetrieval.RetrievalCode);
                return newRetrieval;
            }
        }
        public Retrieval ResetRetrieval(Retrieval retrieval)
        {
            foreach (var item in retrieval.RetrievalDetails)
            {
                item.QuantityRetrieved = GetMaxRetrieved(item);
                retrievalDetailsDAO.UpdateRetrivalDetails(item);
            }

            return retrieval;
        }

        public int GetMaxRetrieved(RetrievalDetail rd)
        {
            int stock = (int)stationeryDAO.GetStationery(rd.ItemCode).Stock;
            if (stock > rd.QuantityNeeded)
            {
                return (int)rd.QuantityNeeded;
            }
            else
            {
                return stock;
            }
        }
        public Retrieval CreateRetrievalDetails(Retrieval retrieval)
        {
            List<RequestDetail> rdList = this.GetNotDisbursedRequestDetailList();
            Dictionary<String, RetrievalDetail> retrievalList = new Dictionary<string, RetrievalDetail>();
            foreach (RequestDetail rd in rdList)
            {
                if (retrievalList.ContainsKey(rd.ItemCode))
                {
                    retrievalList[rd.ItemCode].QuantityNeeded += rd.Quantity;
                }
                else
                {
                    retrievalList.Add(rd.ItemCode, new RetrievalDetail());
                    retrievalList[rd.ItemCode].ItemCode = rd.ItemCode;
                    retrievalList[rd.ItemCode].RetrievalCode = retrieval.RetrievalCode;
                    retrievalList[rd.ItemCode].QuantityNeeded = rd.RemainingQuant;
                }
            }
            if (retrievalList != null)
            {
                foreach (var item in retrievalList)
                {
                    int stock = (int)stationeryDAO.GetStationery(item.Value.ItemCode).Stock;
                    item.Value.QuantityRetrieved = GetMaxRetrieved(item.Value);
                    retrieval.RetrievalDetails.Add(item.Value);
                }
            }

            return retrieval;
        }
        public List<Request> GetNotDisbursedRequestList()
        {
            List<Request> requestList = new List<Request>();
            requestList.AddRange(requestDAO.SearchRequestbyStatus("processing"));
            requestList.AddRange(requestDAO.SearchRequestbyStatus("incomplete"));
            return requestList;
        }

        public int? GetOutstandingQuantOfRequestDetail(RequestDetail rd)
        {
            if (rd.Status == "outstanding" || rd.Status == "" || rd.Status == "not collected" || rd.Status == null)
            {
                return rd.RemainingQuant;
            }
            return 0;

        }
        

        public Department GetDeptByCode(String deptCode)
        {
            return departmentDAO.GetDepartmentInfo(deptCode);
        }

        public StationeryCatalogue GetStationeryByCode(String stationeryCode)
        {
            return stationeryDAO.GetStationery(stationeryCode);
        }

        public int UpdateRetrievalDetail(RetrievalDetail retrievalDetail)
        {
            return retrievalDetailsDAO.UpdateRetrivalDetails(retrievalDetail);
        }

        public List<RequestDetail> GetRequestDetails(String requestCode)
        {
            return requestDetailsDAO.ListRequestDetail(requestCode);
        }


    }
}