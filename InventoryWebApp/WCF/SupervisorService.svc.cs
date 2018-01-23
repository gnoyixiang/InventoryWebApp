using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using Newtonsoft.Json;
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
        StoreSupervisorController controller = new StoreSupervisorController();

        public List<WCFPurchaseOrder> GetAllPendingPO()
        {
            List<WCFPurchaseOrder> wcfPoList = new List<WCFPurchaseOrder>();
            List<PurchaseOrder> plist = controller.ListAllPendingPO();
            foreach (PurchaseOrder p in plist)
            {
                wcfPoList.Add(new WCFPurchaseOrder(p.PurchaseOrderCode, string.Format("{0:dd/MM/yyyy}", p.DateCreated)
                    , string.Format("{0:dd/MM/yyyy}", p.DateApproved), p.Notes, p.Status, p.SupplierCode,
                    string.Format("{0:dd/MM/yyyy}", p.DateReceived), string.Format("{0:dd/MM/yyyy}", p.DateSupplyExpected), p.HeadRemarks));
            }
            return wcfPoList;
        }
     

       
    }
}
