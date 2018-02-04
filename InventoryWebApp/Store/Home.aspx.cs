using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using System.Web.Script.Serialization;

namespace InventoryWebApp.Store
{
    public partial class Home : System.Web.UI.Page
    {
        StoreClerkController scCtrl = new StoreClerkController();
        StoreManagerController smCtrl = new StoreManagerController();
        StoreSupervisorController ssCtrl = new StoreSupervisorController();
        JavaScriptSerializer jss = new JavaScriptSerializer();

        protected void Page_Load(object sender, EventArgs e)
        {        
            lblDisbursementDate.Text = GetNextDisburseDate().ToString("dddd, d MMM yyyy");
            lblItemsBelowReorderLvl.Text = CountItemsBelowReorderLvl().ToString();
            lblPendingOrderQty.Text = CountPendingOrders().ToString();
            if (Context.User.IsInRole("Store Clerk"))
            {
                lblPendingAdjQty.Text = CountPendingAdj().ToString();
            }
            else if (Context.User.IsInRole("Store Supervisor"))
            {
                lblPendingAdjQty.Text = CountPendingAdjStoreSupervisor().ToString();
            }
            else if (Context.User.IsInRole("Store Manager"))
            {
                lblPendingAdjQty.Text = CountPendingAdjStoreManager().ToString();
            }
            lblTotalItemsInStore.Text = CountTotalItemsInStore().ToString();
            listDisbursements.DataSource = scCtrl.GetDisbursingDisbursements();
            listDisbursements.DataBind();
        }

        public string Serialize(object o)
        {
            return jss.Serialize(o);
        }

        public List<Department> GetDepartments()
        {
            return scCtrl.ListDepartments().Where(d => d.DepartmentCode.ToUpper() != "STOR").ToList();
        }

        public List<string> GetCategories()
        {
            return scCtrl.GetCategories();
        }

        public List<int> GetCategoryTotalRequestQtySeries()
        {
            List<string> categories = GetCategories();
            List<int> series = new List<int>();
            foreach (string cat in categories)
            {
                int totalQuantity = 0;
                foreach (Request req in scCtrl.ListRequests().Where(req => ((req.Status.ToUpper() != "PENDING" && req.Status.ToUpper() != "REJECTED"))))
                {
                    foreach (RequestDetail rd in scCtrl.GetRequestDetails(req.RequestCode))
                    {
                        if (scCtrl.GetCategoryOfStationery(rd.ItemCode) == cat)
                        {
                            totalQuantity += Convert.ToInt32(rd.Quantity);
                        }
                    }
                }
                series.Add(totalQuantity);
            }
            return series;
        }

        public List<int> GetCategoryDeptRequestQtySeries(string deptCode)
        {            
            List<string> categories = GetCategories();
            List<int> series = new List<int>();
            foreach (string cat in categories)
            {
                int totalQuantity = 0;
                foreach (Request req in scCtrl.ListRequests().Where(req=> ((req.Status.ToUpper() != "PENDING" && req.Status.ToUpper() != "REJECTED") && req.DepartmentCode == deptCode)))
                {
                    //if ((req.Status.ToUpper() != "PENDING" && req.Status.ToUpper() != "REJECTED") && req.DepartmentCode==deptCode)
                    //{
                        foreach (RequestDetail rd in scCtrl.GetRequestDetails(req.RequestCode))
                        {
                            if (scCtrl.GetCategoryOfStationery(rd.ItemCode) == cat)
                            {
                                totalQuantity += Convert.ToInt32(rd.Quantity);
                            }
                        }
                    //}
                }
                series.Add(totalQuantity);
            }
            return series;
        }

        private int CountTotalItemsInStore()
        {
            return scCtrl.ListStationeries().Count();
        }

        private int CountPendingOrders()
        {
            return scCtrl.GetAllPurchaseOrders().Where(po => po.Status.ToUpper() == "PENDING").Count();
        }

        private int CountPendingAdj()
        {
            return scCtrl.ListAllAdjustments().Where(a => a.Status.ToUpper() == "PENDING").Count();
        }
        private int CountPendingAdjStoreManager()
        {
            return smCtrl.ListOfPendingAdjustmentByManager().Count();
        }
        private int CountPendingAdjStoreSupervisor()
        {
            return ssCtrl.ListOfPendingAdjustmentBySupervisor().Count();
        }

        private int CountItemsBelowReorderLvl()
        {
            return scCtrl.GetStationeriesBelowReorderLevel().Count();
        }

        private DateTime GetNextDisburseDate()
        {
            return Convert.ToDateTime(scCtrl.GetDisbursingDisbursements().Min(d => d.DatePlanToCollect));
        }

        protected string GetDepartmentName(string deptCode)
        {
            try
            { 
                return scCtrl.GetDeptByCode(deptCode).DepartmentName;
            }
            catch (NullReferenceException ex)
            {
                return "";
            }
        }
        protected string GetCollectionPtName(string collectionPtCode)
        {
            try
            {
                return scCtrl.GetCollectionPointByCode(collectionPtCode).CollectionVenue;
            }
            catch (NullReferenceException ex)
            {
                return "";
            }
        }
        protected string GetCollectionTimeString(string collectionPtCode)
        {
            try
            {
                return ((TimeSpan)scCtrl.GetCollectionPointByCode(collectionPtCode).CollectionTime).ToString(@"hhmm") + " h";
            }
            catch (Exception ex)
            {
                return "";
            }
        }
        protected string GetTotalQty(string disbursementCode)
        {
            try
            {
                return scCtrl.SumOfDisbursingQty(scCtrl.GetDisbursementDetails(disbursementCode)).ToString();
            }
            catch (Exception ex)
            {
                return "";
            }
        }
    }
}