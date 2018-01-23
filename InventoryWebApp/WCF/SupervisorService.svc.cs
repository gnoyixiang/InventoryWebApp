using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "SupervisorService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select SupervisorService.svc or SupervisorService.svc.cs at the Solution Explorer and start debugging.
    public class SupervisorService : ISupervisorService
    {
        StoreSupervisorController stSupController = new StoreSupervisorController();
        public void DoWork()
        {

        }

        public List<WCFAdjustment> ListOfPendingRequestForManager()
        {
            throw new NotImplementedException();
        }

        public List<WCFAdjustment> ListOfPendingRequestForSupervisor()
        {
            List<WCFAdjustment> listOfWcfAdjustmwnt = new List<WCFAdjustment>();
            WCFAdjustment wcfAdjustment = new WCFAdjustment();
            List<Adjustment> adList = stSupController.ListOfPendingAdjustmentBySupervisor();

            foreach (Adjustment a in adList)
            {
                wcfAdjustment.AdjustmentCode = a.AdjustmentCode;
                wcfAdjustment.ItemCode = a.ItemCode;
               // wcfAdjustment.AdjustmentQuant = (int)a.AdjustmentQuant;
                wcfAdjustment.Reason = a.Reason;
                wcfAdjustment.Remark = a.HeadRemarks;
                listOfWcfAdjustmwnt.Add(wcfAdjustment);
            }
            return listOfWcfAdjustmwnt;
        }
    }
}
