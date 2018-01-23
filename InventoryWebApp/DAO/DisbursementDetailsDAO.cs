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

        public List<DisbursementDetail> SearchDDByCode(string code)
        {
            em = new EntityModel();
            return em.DisbursementDetails.Where(dd => dd.DisbursementCode==code).ToList();
        }
    }
}