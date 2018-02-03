using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel.Web;
using System.Text;


namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ClerkService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ClerkService.svc or ClerkService.svc.cs at the Solution Explorer and start debugging.
    public class ClerkService : IClerkService
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();

        public WCF_CollectionDate GetCollectionDate()
        {
            WCF_CollectionDate wcd = new WCF_CollectionDate();

            List<Disbursement> dList = sClerkCtrl.GetDisbursementsByStatus("disbursing");
            List<Disbursement> adList = sClerkCtrl.GetDisbursementsByStatus("allocating");
            if (dList.Count == 0 && adList.Count == 0)
            {
                wcd.DatePlanToCollect = "No active disbursement.";
                wcd.Status = "inactive";
            }
            else
            {
                if (dList.Count == 0)
                {
                    DateTime dt = sClerkCtrl.GetDefaultCollectionDate();
                    wcd.DatePlanToCollect = dt.ToString("dd MMM yyyy");
                    wcd.Status = "not confirmed";
                }
                else
                {
                    wcd.DatePlanToCollect = ((DateTime)dList.FirstOrDefault().DatePlanToCollect).ToString("dd MMM yyyy");
                    wcd.Status = "confirmed";
                }
            }
            return wcd;
        }
        public void UpdateRetrievalDetail(WCF_RetrievalDetail wrd)

        {
            RetrievalDetail rdCurrent = sClerkCtrl.GetProcessingRetrievalDetailByItemCode(wrd.ItemCode);
            rdCurrent.QuantityRetrieved = Int32.Parse(wrd.QuantityRetrieved);
            rdCurrent.Notes = wrd.Notes;
            sClerkCtrl.UpdateRetrievalDetail(rdCurrent);
        }

        public WCF_RetrievalDetail GetRetrievalDetail(string id)
        {
            Retrieval r = sClerkCtrl.GetCurrentRetrieval();
            RetrievalDetail item = sClerkCtrl.GetProcessingRetrievalDetailByItemCode(id);
            return new WCF_RetrievalDetail(item.RetrievalCode, sClerkCtrl.GetStationeryByCode(item.ItemCode).Description, item.QuantityRetrieved.ToString(), item.QuantityNeeded.ToString(), item.Notes, r.Status, r.DateRetrieved == null ? "" : ((DateTime)r.DateRetrieved).ToString("dd MMM yyyy"), sClerkCtrl.GetStationeryByCode(item.ItemCode).Stock.ToString(), sClerkCtrl.GetStationeryByCode(item.ItemCode).Location, item.ItemCode);
        }
        public List<WCF_RetrievalDetail> GetProcessingRetrievalDetails()
        {
            if (sClerkCtrl.GetDisbursementsByStatus("allocating").Count == 0)
            {
                Retrieval r = sClerkCtrl.GetCurrentRetrieval();
                if (r == null)
                {
                    return null;
                }
                else
                {
                    List<RetrievalDetail> rdList = r.RetrievalDetails.ToList<RetrievalDetail>();
                    List<WCF_RetrievalDetail> wrdList = new List<WCF_RetrievalDetail>();
                    foreach (var item in rdList)
                    {
                        WCF_RetrievalDetail wrd = new WCF_RetrievalDetail(item.RetrievalCode, sClerkCtrl.GetStationeryByCode(item.ItemCode).Description, item.QuantityRetrieved.ToString(), item.QuantityNeeded.ToString(), item.Notes, r.Status, r.DateRetrieved == null ? "" : ((DateTime)r.DateRetrieved).ToString("dd MMM yyyy"), sClerkCtrl.GetStationeryByCode(item.ItemCode).Stock.ToString(), sClerkCtrl.GetStationeryByCode(item.ItemCode).Location, item.ItemCode);
                        wrdList.Add(wrd);
                    }
                    return wrdList;
                }
                
            }
            else
            {
                return null;
            }
        }

        public List<WCF_Request> GetOutstandingRequests()
        {
            List<Request> rList = sClerkCtrl.GetNotDisbursedRequestList();
            List<WCF_Request> wRList = new List<WCF_Request>();
            foreach (var item in rList)
            {
                WCF_Request wr = new WCF_Request(item.RequestCode, sClerkCtrl.GetDeptByCode(item.DepartmentCode).DepartmentName, item.Status);
                wRList.Add(wr);
            }
            return wRList;
        }

        public List<WCF_RetrievalDetail> GetAllocatingRetrievalDetails()
        {
            Retrieval r = sClerkCtrl.GetCurrentRetrieval();
            if (r != null)
            {
                sClerkCtrl.GetAllocatingDisbursementList();
                List<RetrievalDetail> rdList = r.RetrievalDetails.ToList<RetrievalDetail>();
                List<WCF_RetrievalDetail> wrdList = new List<WCF_RetrievalDetail>();
                foreach (var item in rdList)
                {
                    WCF_RetrievalDetail wrd = new WCF_RetrievalDetail(item.RetrievalCode, sClerkCtrl.GetStationeryByCode(item.ItemCode).Description, item.QuantityRetrieved.ToString(), item.QuantityNeeded.ToString(), item.Notes, r.Status, r.DateRetrieved == null ? "" : ((DateTime)r.DateRetrieved).ToString("dd MMM yyyy"), sClerkCtrl.GetStationeryByCode(item.ItemCode).Stock.ToString(), sClerkCtrl.GetStationeryByCode(item.ItemCode).Location, item.ItemCode);
                    wrdList.Add(wrd);
                }
                return wrdList;
            }
            return null;
        }

        public WCF_RetrievalDetail GetAllocatingRetrievalDetail(string itemCode)
        {
            List<WCF_RetrievalDetail> ardList = GetAllocatingRetrievalDetails();
            foreach (var item in ardList)
            {
                if (item.ItemCode == itemCode)
                {
                    return item;
                }
            }
            return null;

        }

        public WCF_DisbursementDetail GetAllocatingDisbursementDetail(string itemCode, string departmentName)
        {
            List<WCF_DisbursementDetail> waddList = GetAllocatingDisbursementDetails(itemCode);
            foreach (var item in waddList)
            {
                if (item.DepartmentName == departmentName)
                {
                    return item;
                }
            }
            return null;
        }
        public List<WCF_DisbursementDetail> GetAllocatingDisbursementDetails(string itemCode)
        {
            Retrieval retrieval = sClerkCtrl.GetCurrentRetrieval();
            Disbursement d = sClerkCtrl.GetDisbursementsByStatus("disbursing").FirstOrDefault();
            if (retrieval != null && d == null)
            {
                List<DisbursementDetail> ddList = sClerkCtrl.GenerateDisbursementDetailPerItem()[itemCode];
                List<WCF_DisbursementDetail> waddList = new List<WCF_DisbursementDetail>();
                foreach (var item in ddList)
                {
                    WCF_DisbursementDetail wad = new WCF_DisbursementDetail();
                    wad.DepartmentCode = sClerkCtrl.GetRequest(item.RequestCode).DepartmentCode;
                    wad.DepartmentName = sClerkCtrl.GetDeptByCode(wad.DepartmentCode).DepartmentName;
                    wad.ItemCode = item.ItemCode;
                    wad.ItemName = sClerkCtrl.GetStationeryByCode(item.ItemCode).Description;
                    wad.QuantityNeeded = sClerkCtrl.GetRequestDetail(item.RequestCode, item.ItemCode).RemainingQuant.ToString();
                    wad.QuantityRetrieved = item.Quantity.ToString();
                    wad.DisbursementCode = item.DisbursementCode;
                    wad.Status = sClerkCtrl.GetDisbursement(item.DisbursementCode).Status;
                    wad.DisbursementCode = item.DisbursementCode;
                    waddList.Add(wad);
                }
                return waddList;
            }
            else
            {
                return null;
            }


        }

        public List<WCF_ConfirmedDisbursement> GetConfirmedDisbursementList()
        {
            List<WCF_ConfirmedDisbursement> wcdList = new List<WCF_ConfirmedDisbursement>();
            List<Disbursement> dList = sClerkCtrl.GetDisbursementsByStatus("disbursing");
            foreach (var item in dList)
            {
                WCF_ConfirmedDisbursement wcd = new WCF_ConfirmedDisbursement();
                wcd.CollectionPoint = sClerkCtrl.GetCollectionPointByCode(item.CollectionPointCode).CollectionVenue;
                wcd.CollectionTime = DateTime.Today.Add((TimeSpan)sClerkCtrl.GetCollectionPointByCode(item.CollectionPointCode).CollectionTime).ToString("hh:mm tt");
                wcd.DepartmentCode = item.DepartmentCode;
                wcd.DepartmentName = sClerkCtrl.GetDeptByCode(item.DepartmentCode).DepartmentName;
                wcd.DisbursementDate = ((DateTime)item.DatePlanToCollect).ToString("dd MMM yyyy");
                wcd.Representative = sClerkCtrl.GetRepresentative(item.DepartmentCode) == null ? "No Representative" : sClerkCtrl.GetRepresentative(item.DepartmentCode).EmployeeTitle + " " + sClerkCtrl.GetRepresentative(item.DepartmentCode).EmployeeName;
                wcd.ClerkInCharge = sClerkCtrl.GetEmployee(sClerkCtrl.GetCollectionPointByCode(item.CollectionPointCode).SClerkInCharge).EmployeeName;
                wcd.Status = item.Status;
                wcd.Notes = item.Notes;
                wcd.DisbursementCode = item.DisbursementCode;
                wcdList.Add(wcd);
            }
            return wcdList;
        }

        public List<WCF_DisbursementDetail> GetConfirmedDisburDetailsByDepartment(string departmentCode)
        {
            List<DisbursementDetail> ddList = sClerkCtrl.GetDisbursingDisbDetailsByDeptCode(departmentCode);
            List<WCF_DisbursementDetail> wddList = new List<WCF_DisbursementDetail>();
            foreach (var item in ddList)
            {
                WCF_DisbursementDetail wdd = new WCF_DisbursementDetail();
                wdd.DepartmentCode = sClerkCtrl.GetDisbursement(item.DisbursementCode).DepartmentCode;
                wdd.DepartmentName = sClerkCtrl.GetDeptByCode(sClerkCtrl.GetDisbursement(item.DisbursementCode).DepartmentCode).DepartmentName;
                wdd.DisbursementCode = item.DisbursementCode;
                wdd.ItemCode = item.ItemCode;
                wdd.ItemName = sClerkCtrl.GetStationeryByCode(item.ItemCode).Description;
                wdd.Notes = item.Notes;
                wdd.QuantityNeeded = sClerkCtrl.GetRequestDetail(item.RequestCode, item.ItemCode).RemainingQuant.ToString();
                wdd.QuantityRetrieved = item.Quantity.ToString();
                wdd.QuantityActual = item.ActualQuantity.ToString();
                wdd.RequestCode = item.RequestCode;

                wddList.Add(wdd);

            }

            return wddList;

        }

        public WCF_ConfirmedDisbursement GetConfirmedDisbursementByDeptCode(string departmentCode)
        {
            List<WCF_ConfirmedDisbursement> wcdList = GetConfirmedDisbursementList();
            foreach (var item in wcdList)
            {
                if (item.DepartmentCode.Equals(departmentCode))
                {
                    return item;
                }
            }
            return null;
        }

        public WCF_DisbursementDetail GetConfirmedDisburDetail(string departmentCode, string requestCode, string itemCode)
        {
            List<WCF_DisbursementDetail> wddList = GetConfirmedDisburDetailsByDepartment(departmentCode);
            foreach (var item in wddList)
            {
                if (item.RequestCode.Equals(requestCode) && item.ItemCode.Equals(itemCode))
                {
                    return item;
                }
            }
            return null;
        }

        public void UpdateDisbursementDetail(WCF_DisbursementDetail wdd)
        {
            DisbursementDetail dd = sClerkCtrl.GetDisbursementDetail(wdd.DisbursementCode, wdd.RequestCode, wdd.ItemCode);
            dd.ActualQuantity = Int32.Parse(wdd.QuantityActual);
            dd.Notes = wdd.Notes;
            sClerkCtrl.UpdateDisbursementDetail(dd);

            StationeryCatalogue sc = sClerkCtrl.GetStationeryByCode(dd.ItemCode);
            sc.Stock += dd.Quantity - dd.ActualQuantity;
            sClerkCtrl.UpdateStationeryCatalogue(sc);

        }

        public void MarkAsNotCollected(WCF_DisbursementDetail wdd)
        {
            Disbursement d = sClerkCtrl.GetDisbursement(wdd.DisbursementCode);
            d.Status = "not collected";
            List<DisbursementDetail> ddList = sClerkCtrl.GetDisbursementDetails(wdd.DisbursementCode);
            foreach (var item in ddList)
            {
                StationeryCatalogue sc = sClerkCtrl.GetStationeryByCode(item.ItemCode);
                sc.Stock += item.ActualQuantity;
                item.ActualQuantity = 0;
                sClerkCtrl.UpdateDisbursementDetail(item);
                sClerkCtrl.UpdateStationeryCatalogue(sc);
            }
            sClerkCtrl.UpdateDisbursement(d);
        }

        public void ConfirmCollectionDate(string date, string userName, string password)
        {
            sClerkCtrl.SetCollectionDateToDisbursement(DateTime.ParseExact(date, "ddMMyyyy", null), userName);
            sClerkCtrl.UpdateCurrentRetrievalToRetrieved();
        }
    }
}
