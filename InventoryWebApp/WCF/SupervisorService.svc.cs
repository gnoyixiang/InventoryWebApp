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
        StoreManagerController managerController = new StoreManagerController();
        ILoginService loginService = new LoginService();

        public List<WCFPurchaseOrder> GetAllPendingPO(string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                List<WCFPurchaseOrder> wcfPoList = new List<WCFPurchaseOrder>();
                List<PurchaseOrder> plist = controller.ListAllPendingPO();
                decimal? totalPrice = 0;
                foreach (PurchaseOrder p in plist)
                {
                    totalPrice = 0;
                    string supName = controller.GetSupplier(p.SupplierCode).SupplierName;
                    string empName = controller.GetEmployeeName(p.UserName);
                    List<PODetail> pdList = controller.ListPODetailsByPOCode(p.PurchaseOrderCode);
                    foreach (PODetail pd in pdList)
                    {
                        totalPrice += pd.Price * (decimal?)pd.Quantity;
                    }

                    wcfPoList.Add(new WCFPurchaseOrder(p.PurchaseOrderCode, string.Format("{0:dd/MM/yyyy}", p.DateCreated), supName, empName, "$" + totalPrice.ToString()));
                }
                return wcfPoList;
            }
            else
            {
                return null;
            }
        }

        public List<WCFPODetail> GetPODetail(string id, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                List<PODetail> poDetail = controller.ListPODetailsByPOCode(id);
                List<WCFPODetail> wpoDetail = new List<WCFPODetail>();
                foreach (PODetail p in poDetail)
                {
                    string des = controller.GetStationeryCatalogue(p.ItemCode).Description;
                    wpoDetail.Add(new WCFPODetail(des, "$" + p.Price.ToString(), p.Quantity.ToString(), (p.Price * (decimal?)p.Quantity).ToString()));
                }
                return wpoDetail;
            }
            else
            {
                return null;
            }
        }
        public void UpdatePendingPO(WCFPurchaseOrder po, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {

                PurchaseOrder p = controller.GetPOByPOCode(po.PurchaseOrderCode);

                p.Status = po.Status;
                p.DateApproved = Convert.ToDateTime(po.DateApproved);
                p.ApprovedBy = po.ApprovedBy;
                p.HeadRemarks = po.HeadRemark;

                ;
                controller.updatePOStatus(p);
            }
        }




        public List<WCFAdjustment> ListOfPendingRequestForSupervisor(string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                List<WCFAdjustment> listOfWcfAdjustmwnt = new List<WCFAdjustment>();
                WCFAdjustment wcfAdjustment = new WCFAdjustment();
                List<Adjustment> adList = controller.ListOfPendingAdjustmentBySupervisor();
                foreach (Adjustment a in adList)
                {
                    StationeryCatalogue tempst = controller.GetStationeryCatalogue(a.ItemCode);

                    string price = tempst.Price.ToString();
                    string stock = tempst.Stock.ToString();

                    listOfWcfAdjustmwnt.Add(new WCFAdjustment(a.AdjustmentCode, a.ItemCode, price, a.AdjustmentQuant.ToString(), stock, a.Reason, a.HeadRemarks, tempst.Description));

                }


                return listOfWcfAdjustmwnt;
            }
            else
            {
                return null;
            }

        }


        public WCFAdjustment GetAdjustment(string adjustmentcode, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                Adjustment ad = controller.GetAdjustment(adjustmentcode);

                StationeryCatalogue tempst = controller.GetStationeryCatalogue(ad.ItemCode);

                string price = tempst.Price.ToString();
                string stock = tempst.Stock.ToString();

                return new WCFAdjustment(ad.AdjustmentCode, ad.ItemCode, price, ad.AdjustmentQuant.ToString(), stock, ad.Reason, ad.HeadRemarks, tempst.Description);
            }
            else
            {
                return null;
            }
        }
        public string UpdateAdjustmentBySupervisor(WCFAdjustment wcfAdjustment, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                try
                {
                    Adjustment ad = new Adjustment()
                    {
                        AdjustmentCode = wcfAdjustment.AdjustmentCode,
                        Status = wcfAdjustment.Status,
                        DateApproved = Convert.ToDateTime(wcfAdjustment.DateOfApprove),
                        ApprovedBy = wcfAdjustment.ApprovedBy,
                        HeadRemarks = wcfAdjustment.Remark

                    };

                    controller.UpdateAdjustmentBySupervisor(ad);

                    return "Success";
                }
                catch (Exception e)
                {
                    return e.Message;
                }
            }
            else
            {
                return null;
            }
        }



    }
}