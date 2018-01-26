using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Web;
using System.Web.Security;
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
            decimal? totalPrice=0;
            foreach (PurchaseOrder p in plist)
            {
                string supName = controller.GetSupplier(p.SupplierCode).SupplierName;
                List<PODetail> pdList = controller.ListPODetailsByPOCode(p.PurchaseOrderCode);
                foreach(PODetail pd in pdList)
                {
                     totalPrice += pd.Price * (decimal?)pd.Quantity;
                }
                wcfPoList.Add(new WCFPurchaseOrder(p.PurchaseOrderCode, string.Format("{0:dd/MM/yyyy}", p.DateCreated),supName,"$"+totalPrice.ToString()) );
            }
            return wcfPoList;
        }

        public List<WCFPODetail> GetPODetail(string id)
        {
            List<PODetail> poDetail = controller.ListPODetailsByPOCode(id);
            List<WCFPODetail> wpoDetail = new List<WCFPODetail>();
            foreach (PODetail p in poDetail)
            {
                string des = controller.GetStationeryCatalogue(p.ItemCode).Description;

                wpoDetail.Add(new WCFPODetail(des,"$"+p.Price.ToString(),p.Quantity.ToString()));
            }
            return wpoDetail;
        }


        public void UpdatePendingPO(WCFPurchaseOrder po)
        {
            PurchaseOrder purchaseOrder = new PurchaseOrder
            {
                PurchaseOrderCode=po.PurchaseOrderCode,
                Status =po.Status ,
                DateApproved = Convert.ToDateTime(po.DateApproved),
                ApprovedBy = po.ApprovedBy,
               
            };
            controller.updatePOStatus(purchaseOrder);
        }
    }
}
