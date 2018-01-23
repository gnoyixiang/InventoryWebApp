using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using System.Data.Entity;

namespace InventoryWebApp.DAO
{
    public class DisbursementDetailsDAO : IDisbursementDetailsDAO
    {

        //Read
        public List<DisbursementDetail> SearchDDByItem(StationeryCatalogue item)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.DisbursementDetails.Where(dd => dd.ItemCode == item.ItemCode).ToList();
            }
        }

        public List<DisbursementDetail> SearchDDByRequest(Request request)
        {
            using (EntityModel em = new EntityModel())
            {

                return em.DisbursementDetails.Where(dd => dd.RequestCode == request.RequestCode).ToList();
            }
        }

        public List<DisbursementDetail> SearchDDByDCode(String disbursementCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.DisbursementDetails.Where(dd => dd.DisbursementCode == disbursementCode).ToList();
            }
        }

        public int UpdateDisbursementDetail(DisbursementDetail ddUpdate)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(ddUpdate).State = EntityState.Modified;
                return em.SaveChanges();
            }
        }
    }
}