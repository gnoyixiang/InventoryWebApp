using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class DisbursementDetailsDAO : IDisbursementDetailsDAO
    {
        EntityModel em;

        //Read
        public List<DisbursementDetail> SearchDDByItem(StationeryCatalogue item)
        {
            em = new EntityModel();
            return em.DisbursementDetails.Where(dd => dd.ItemCode == item.ItemCode).ToList();
        }

        public List<DisbursementDetail> SearchDDByRequest(Request request)
        {
            em = new EntityModel();
            return em.DisbursementDetails.Where(dd => dd.RequestCode == request.RequestCode).ToList();
        }

        public List<DisbursementDetail> ListDDByItemCode(string ItemCode,DateTime start)
        {
            em = new EntityModel();
            List<DisbursementDetail> ddList = new List<DisbursementDetail>();
            List<DisbursementDetail> ddListAfterStartDate = new List<DisbursementDetail>();
            // List<Disbursement> dList = em.Disbursements.Where(dd => dd.DateDisbursed >= start).ToList();
            ddList =em.DisbursementDetails.Where(dd => dd.ItemCode == ItemCode).ToList();
            foreach (DisbursementDetail d in ddList) {
                if( em.Disbursements.Where(x=>x.DisbursementCode==d.DisbursementCode && x.DateDisbursed >= start).FirstOrDefault() != null)
                {
                    ddListAfterStartDate.Add(d);
                }
            }
            return ddListAfterStartDate;
        }
    }
}