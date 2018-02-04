using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.Controllers
{
    public class StoreManagerController
    {
        IAdjustmentDAO adjustmentDao = new AdjustmentDAO();
        private readonly string statusOfAdjustment = "Pending";
        StoreSupervisorController spController = new StoreSupervisorController();
        public List<Adjustment> ListOfPendingAdjustmentByManager()
        {

            List<Adjustment> pendingAdLdit = new List<Adjustment>();
            List<Adjustment> adjustmentList = adjustmentDao.ListAllAdjustments();


            foreach (Adjustment ad in adjustmentList)
            {
                if (ad.Status.ToLower().Equals(statusOfAdjustment.ToLower()))
                {
                    StationeryCatalogue tempst = spController.GetStationaryDetails(ad.ItemCode);
                    if ((ad.AdjustmentQuant * tempst.Price) >= 250 || (ad.AdjustmentQuant * tempst.Price) <= -250)
                    {
                        pendingAdLdit.Add(ad);
                    }
                }

            }

            return pendingAdLdit;


        }

    }
}