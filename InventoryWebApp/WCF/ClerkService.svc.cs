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
        void IClerkService.UpdateRetrievalDetail(WCF_RetrievalDetail wrd)
        {
            RetrievalDetail rd = sClerkCtrl.GetProcessingRetrievalDetailByItemCode(wrd.ItemCode);
            rd.QuantityRetrieved = Int32.Parse(wrd.QuantityRetrieved);
            rd.Notes = wrd.Notes;
            sClerkCtrl.UpdateRetrievalDetail(rd);
        }

        StoreClerkController sClerkCtrl = new StoreClerkController();
        public WCF_RetrievalDetail GetRetrievalDetail(string id)
        {
            Retrieval r = sClerkCtrl.GetCurrentRetrieval();
            RetrievalDetail item = sClerkCtrl.GetProcessingRetrievalDetailByItemCode(id);
            return new WCF_RetrievalDetail(item.RetrievalCode, sClerkCtrl.GetStationeryByCode(item.ItemCode).Description, item.QuantityRetrieved.ToString(), item.QuantityNeeded.ToString(), item.Notes, r.Status, r.DateRetrieved == null ? "" : ((DateTime)r.DateRetrieved).ToString("dd MMM yyyy"), sClerkCtrl.GetStationeryByCode(item.ItemCode).Stock.ToString(), sClerkCtrl.GetStationeryByCode(item.ItemCode).Location, item.ItemCode);
        }
        public List<WCF_RetrievalDetail> GetProcessingRetrievalDetails()
        {
            Retrieval r = sClerkCtrl.GetCurrentRetrieval();
            List<RetrievalDetail> rdList = r.RetrievalDetails.ToList<RetrievalDetail>();
            List<WCF_RetrievalDetail> wrdList = new List<WCF_RetrievalDetail>();
            foreach (var item in rdList)
            {
                WCF_RetrievalDetail wrd = new WCF_RetrievalDetail(item.RetrievalCode, sClerkCtrl.GetStationeryByCode(item.ItemCode).Description, item.QuantityRetrieved.ToString(), item.QuantityNeeded.ToString(),item.Notes, r.Status,r.DateRetrieved==null?"":((DateTime)r.DateRetrieved).ToString("dd MMM yyyy"), sClerkCtrl.GetStationeryByCode(item.ItemCode).Stock.ToString(),sClerkCtrl.GetStationeryByCode(item.ItemCode).Location, item.ItemCode);
                wrdList.Add(wrd);
            }
            return wrdList;
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

        
    }
}
