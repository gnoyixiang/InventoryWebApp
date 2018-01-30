using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity;

namespace InventoryWebApp.Store
{
    public partial class AdjustmentByStoreSupervisor : System.Web.UI.Page
    {
        StoreSupervisorController storeSpController = new StoreSupervisorController();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridViewForSupervisor();
            }
        }

        public void PopulateGridViewForSupervisor()
        {
            List<Adjustment> adjustment =  storeSpController.ListOfPendingAdjustmentBySupervisor();
            if (adjustment.Count == 0)
            {
                lblErrorMsg.Text = "No pending Adjustment request";

            }
            gvPendingAdjutment.DataSource = adjustment;
            gvPendingAdjutment.DataBind();

            

        }


        protected void gvPendingAdjutment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Adjustment adjustment = (Adjustment)e.Row.DataItem;

                string itemCode = adjustment.ItemCode;

                Label lblPrice = (e.Row.FindControl("lblPrice") as Label);
               StationeryCatalogue sCatalogue =  storeSpController.GetStationaryDetails(itemCode);

                if (lblPrice != null)
                {
                    lblPrice.Text = (sCatalogue.Price * adjustment.AdjustmentQuant).ToString();
                }

                Label lblStock = (e.Row.FindControl("lblStock") as Label);

                if (lblStock != null)
                {
                    lblStock.Text = sCatalogue.Stock.ToString();
                }


            }
        }

        protected void gvPendingAdjutment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("Approve"))
                {

                    Control ctl = e.CommandSource as Control;
                    GridViewRow currentRow = ctl.NamingContainer as GridViewRow;
                   
                    object id = gvPendingAdjutment.DataKeys[currentRow.RowIndex].Value as object;
                    string adjustmentCode = null;
                    if (id != null)
                    {
                        adjustmentCode = id.ToString();
                    }
                    string price = (currentRow.FindControl("lblPrice") as Label).Text;

                    TextBox tbxHeadRemarks = (currentRow.FindControl("tbxHeadRemarks") as TextBox);

                    string approveStatus = "Approve";

                    //This method will use when we login to application and this method can acess who logged in and can get the user 
                    //var user = HttpContext.Current.GetOwinContext().Get<ApplicationUserManager>().FindById(User.Identity.GetUserName());
                    //this is getting username from user.And Use this to get user name instead hardcode value.
                    //string userName =  user.UserName;
                    //Adjustment ad = new Adjustment();
                    //ad.AdjustmentCode = adjustmentCode;

                    Adjustment ad = storeSpController.GetAdjustment(adjustmentCode);
                    ad.HeadRemarks = tbxHeadRemarks.Text;
                    ad.Status = approveStatus;
                    ad.ApprovedBy = Context.User.Identity.GetUserName();
                    ad.DateApproved = DateTime.Now;
                    storeSpController.UpdateAdjustmentBySupervisor(ad);

                    StationeryCatalogue stationery = storeSpController.GetStationeryCatalogue(ad.ItemCode);
                    stationery.Stock += ad.AdjustmentQuant;
                    storeSpController.UpdateStationery(stationery);

                    PopulateGridViewForSupervisor();
                    lblSuccessMsg.Text = "Adjustment request Approved";
                    lblErrorMsg.Text = "";                    
                }
                else
                {
                    Control ctlReject = e.CommandSource as Control;
                    GridViewRow currentRowOfreject = ctlReject.NamingContainer as GridViewRow;

                    object id2 = gvPendingAdjutment.DataKeys[currentRowOfreject.RowIndex].Value as object;
                    string adjustmentCodeOfreject = null;
                    if (id2 != null)
                    {
                        adjustmentCodeOfreject = id2.ToString();
                    }

                    TextBox tbxHeadRemarksOfReject = (currentRowOfreject.FindControl("tbxHeadRemarks") as TextBox);

                    string rejectstatus = "Reject";


                   //This method will use when we login to application and this method can acess who logged in and can get the user
                     var user = HttpContext.Current.GetOwinContext().Get<ApplicationUserManager>().FindById(User.Identity.GetUserName());
                    //this is getting username from user.And Use this to get user name instead hardcode value.
                    //string userName =  user.UserName;
                    //Adjustment adOFReject = new Adjustment();
                    //adOFReject.AdjustmentCode = adjustmentCodeOfreject;
                    //adOFReject.HeadRemarks = tbxHeadRemarksOfReject.Text;
                    //adOFReject.Status = rejectstatus;
                    //// ad.ApprovedBy = userName;//Use this when we get  successful login.
                    //adOFReject.ApprovedBy = "yufei@logic.edu.sg";
                    //adOFReject.DateApproved = DateTime.Now.Date;

                    Adjustment adOFReject = storeSpController.GetAdjustment(adjustmentCodeOfreject);
                    adOFReject.HeadRemarks = tbxHeadRemarksOfReject.Text;
                    adOFReject.Status = rejectstatus;
                    adOFReject.ApprovedBy = Context.User.Identity.GetUserName();
                    adOFReject.DateApproved = DateTime.Now;
                    storeSpController.UpdateAdjustmentBySupervisor(adOFReject);

                    PopulateGridViewForSupervisor();
                    lblSuccessMsg.Text = "Adjustment request rejected";
                    lblErrorMsg.Text = "";

                }
            }
            catch (Exception ex)
            {
                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
    }
}