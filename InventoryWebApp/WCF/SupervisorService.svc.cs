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
        StoreManagerController managerController = new StoreManagerController();

        public WCFAdjustment GetAdjustment(string adjustmentcode)
        {
           Adjustment ad =  controller.GetAdjustment(adjustmentcode);

            StationeryCatalogue tempst = controller.GetStationaryDetails(ad.ItemCode);

                string price = tempst.Price.ToString();
                string stock = tempst.Stock.ToString();

            return new WCFAdjustment(ad.AdjustmentCode, ad.ItemCode, price, ad.AdjustmentQuant.ToString(), stock, ad.Reason, ad.HeadRemarks);
             
        }

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

        public List<WCFAdjustment> ListOfPendingRequestForManager()
        {
            List<WCFAdjustment> listOfWcfAdjustmwnt = new List<WCFAdjustment>();
            WCFAdjustment wcfAdjustment = new WCFAdjustment();




            List<Adjustment> adList = managerController.ListOfPendingAdjustmentByManager();


            foreach (Adjustment a in adList)
            {

                //wcfAdjustment.AdjustmentCode = a.AdjustmentCode;
                //wcfAdjustment.Remark = a.HeadRemarks;
                //wcfAdjustment.ItemCode = a.ItemCode;
                //wcfAdjustment.AdjustmentQuant = a.AdjustmentQuant.ToString();
                //wcfAdjustment.Reason = a.Reason;
                //wcfAdjustment.Remark = a.HeadRemarks;
                StationeryCatalogue tempst = controller.GetStationaryDetails(a.ItemCode);

                string price = tempst.Price.ToString();
                string stock = tempst.Stock.ToString();

                listOfWcfAdjustmwnt.Add(new WCFAdjustment(a.AdjustmentCode, a.ItemCode, price, a.AdjustmentQuant.ToString(), stock, a.Reason, a.HeadRemarks));

            }


            return listOfWcfAdjustmwnt;
        }

        

        public List<WCFAdjustment> ListOfPendingRequestForSupervisor()
        {
            List<WCFAdjustment> listOfWcfAdjustmwnt = new List<WCFAdjustment>();
            WCFAdjustment wcfAdjustment = new WCFAdjustment();




            List<Adjustment> adList = controller.ListOfPendingAdjustmentBySupervisor();


            foreach (Adjustment a in adList)
            {

                //wcfAdjustment.AdjustmentCode = a.AdjustmentCode;
                //wcfAdjustment.Remark = a.HeadRemarks;
                //wcfAdjustment.ItemCode = a.ItemCode;
                //wcfAdjustment.AdjustmentQuant = a.AdjustmentQuant.ToString();
                //wcfAdjustment.Reason = a.Reason;
                //wcfAdjustment.Remark = a.HeadRemarks;
                StationeryCatalogue tempst = controller.GetStationaryDetails(a.ItemCode);

                string price = tempst.Price.ToString();
                string stock = tempst.Stock.ToString();

                listOfWcfAdjustmwnt.Add(new WCFAdjustment(a.AdjustmentCode, a.ItemCode, price, a.AdjustmentQuant.ToString(), stock, a.Reason, a.HeadRemarks));

            }


            return listOfWcfAdjustmwnt;
        }

        public bool Test()
        {
            return true;
        }


       

        public void UpdateAdjustmentByManager(WCFAdjustment adjustment)
        {
            //if (adjustment.Status.Equals("Approve"))
            //{
            //    Adjustment adApprove = new Adjustment()
            //    {
            //        AdjustmentCode = adjustment.AdjustmentCode,
            //        Status = "Approve",
            //        DateApproved = DateTime.Parse(adjustment.DateOfApprove),
            //        ApprovedBy = adjustment.ApprovedBy,
            //        HeadRemarks = adjustment.Remark

            //    };

                
                
            //    controller.UpdateAdjustmentBySupervisor(adApprove);
            //}
            //else
            //{
            //    Adjustment adReject = new Adjustment()
            //    {
            //        AdjustmentCode = adjustment.AdjustmentCode,
            //        Status = "Reject",
            //        DateApproved = DateTime.Parse(adjustment.DateOfApprove),
            //        ApprovedBy = adjustment.ApprovedBy,
            //        HeadRemarks = adjustment.Remark

            //    };
            //    controller.UpdateAdjustmentBySupervisor(adReject);

            //}
        }

        

        public String UpdateAdjustmentBySupervisor(WCFAdjustment wcfAdjustment)
        {
            try
            {
                if (wcfAdjustment.Status.Equals("Approve"))
                {
                   

                    Adjustment adApprove = new Adjustment()
                    {
                        AdjustmentCode = wcfAdjustment.AdjustmentCode,
                        Status = wcfAdjustment.Status,
                        DateApproved =Convert.ToDateTime(wcfAdjustment.DateOfApprove),
                        ApprovedBy = wcfAdjustment.ApprovedBy,
                        HeadRemarks = wcfAdjustment.Remark

                    };
                   

                    controller.UpdateAdjustmentBySupervisor(adApprove);
                    
                }
                else
                {
                    Adjustment adReject = new Adjustment()
                    {
                        AdjustmentCode = wcfAdjustment.AdjustmentCode,
                        Status = wcfAdjustment.Status,
                        DateApproved = Convert.ToDateTime(wcfAdjustment.DateOfApprove),
                        ApprovedBy = wcfAdjustment.ApprovedBy,
                        HeadRemarks = wcfAdjustment.Remark

                    };
                    controller.UpdateAdjustmentBySupervisor(adReject);
                   

                }
                return "amit";
            }catch(Exception e)
            {
                return e.Message;
            }
        }


        //public string Authenticate(string email, string password)
        //{
        //    //string email = "";
        //    //string password = "";
        //   string msg =  new AuthenticationTest().LoginUser(email, password);

        //    return msg;
        //}

    }
}
