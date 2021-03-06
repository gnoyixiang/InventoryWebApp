﻿using InventoryWebApp.Models.Entities;
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
        EmailController emailController = new EmailController();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Context.User.IsInRole("Store Supervisor"))
            {
                if (!Master.IsTempRoleCode("ActSSup"))
                {
                    Response.Redirect("/ErrorPages/401");
                }
            }

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
                lblErrorMsg.Text = "No pending adjustment request!";

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
                    //lblPrice.Text = (sCatalogue.Price * adjustment.AdjustmentQuant).ToString();
                    lblPrice.Text = sCatalogue.Price.ToString();
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
                Session["senderForAdj"] = sender;
                Session["gvCommandEvent"] = e;
                txtPassword.Text = "";
                lblVerifyError.Visible = false;
                ScriptManager.RegisterStartupScript(this, GetType(), "emailPopup", "$('#emailModal').modal('show');", true);
                       
        }

        private bool VerifyLoginUser(string username, string password)
        {
            // Validate the user password
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

            // This doen't count login failures towards account lockout
            // To enable password failures to trigger lockout, change to shouldLockout: true
            var result = signinManager.PasswordSignIn(username, password, isPersistent: false, shouldLockout: false);

            switch (result)
            {
                case SignInStatus.Success:
                    return true;
                case SignInStatus.LockedOut:
                    return false;
                case SignInStatus.RequiresVerification:
                    return false;
                case SignInStatus.Failure:
                default:
                    return false;
            }
        }

        private void PerformRowCommand()
        {
            object sender = Session["senderForAdj"];
            GridViewCommandEventArgs e = (GridViewCommandEventArgs)Session["gvCommandEvent"];

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

                    //send email
                    string fromEmail = emailController.GetUserEmail(Context.User.Identity.Name) ;
                    string password = txtPassword.Text;
                    string username = Context.User.Identity.Name;
                    try
                    {
                        emailController.AdjApproveRejectSendEmail(fromEmail, password, username, ad);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage", "alert('Adjustment have been successfully approved! Email notifications have been sent successfully!')", true);
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage", "alert('Adjustment have been successfully approved! However an error has occurred when sending email!')", true);
                    }
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
                    lblSuccessMsg.Text = "";
                    lblErrorMsg.Text = "Adjustment request rejected";

                    //send email
                    string fromEmail = emailController.GetUserEmail(Context.User.Identity.Name);
                    string password = txtPassword.Text;
                    string username = Context.User.Identity.Name;
                    try
                    {
                        emailController.AdjApproveRejectSendEmail(fromEmail, password, username, adOFReject);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage", "alert('Adjustment have been successfully rejected! Email notifications have been sent successfully!')", true);
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage", "alert('Adjustment have been successfully rejected! However an error has occurred when sending email!')", true);
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {            
            if (String.IsNullOrEmpty(txtPassword.Text))
            {
                lblVerifyError.Visible = true;
                lblVerifyError.Text = "Password field cannot be empty";
                ScriptManager.RegisterStartupScript(this, GetType(), "emailPopup",
                    "document.body.style.padding = '0';$('.modal-backdrop').remove();$('#emailModal').modal('show');", true);
                return;
            }


            if (!VerifyLoginUser(Context.User.Identity.Name, txtPassword.Text))
            {
                lblVerifyError.Visible = true;
                lblVerifyError.Text = "Incorrect password!";
                ScriptManager.RegisterStartupScript(this, GetType(), "emailPopup",
                    "document.body.style.padding = '0';$('.modal-backdrop').remove();$('#emailModal').modal('show');", true);
                return;
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "emailPopup",
                    "document.body.style.padding = '0';$('.modal-backdrop').remove();$('#emailModal').modal('hide');", true);

            PerformRowCommand();

        }
    }
}