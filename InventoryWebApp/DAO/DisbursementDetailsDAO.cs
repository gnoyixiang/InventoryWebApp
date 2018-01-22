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

        public List<DisbursementDetail> SearchDDByDCode(String disbursementCode)
        {
            em = new EntityModel();
            return em.DisbursementDetails.Where(dd => dd.DisbursementCode == disbursementCode).ToList();
        }

        public int UpdateDisbursementDetail (DisbursementDetail ddUpdate)
        {
            em = new EntityModel();
            DisbursementDetail dd = em.DisbursementDetails.Where(d => d.Disbursement.Status == "disbursing" && d.DisbursementCode == ddUpdate.DisbursementCode && d.ItemCode == ddUpdate.ItemCode && d.RequestCode == ddUpdate.RequestCode).FirstOrDefault();
            dd.Price = ddUpdate.Price;
            dd.Quantity = ddUpdate.Quantity;
            dd.ActualQuantity = ddUpdate.ActualQuantity;
            dd.Notes = ddUpdate.Notes;
            return em.SaveChanges();
        }
    }
}