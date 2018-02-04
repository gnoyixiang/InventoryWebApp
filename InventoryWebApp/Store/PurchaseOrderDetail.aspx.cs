using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity.Owin;

namespace InventoryWebApp.Store
{
    public partial class PurchaseOrderDetail : System.Web.UI.Page
    {
        StoreClerkController scController = new StoreClerkController();
        StoreSupervisorController supervisorController = new StoreSupervisorController();
        EmailController emailController = new EmailController();
        string poNum;
        PurchaseOrder po;
        List<PODetail> poDetails;
        decimal? grandTotal;
        EntityModel em;

        protected void Page_Load(object sender, EventArgs e)
        {
            em = new EntityModel();
            poNum = Request.QueryString["PO"];
            po = scController.GetPurchaseOrderByCode(poNum);
            if (po != null)
            {
                poDetails = scController.GetPODetailsByPOCode(po.PurchaseOrderCode);
            }


            if (!IsPostBack)
            {
                if (poDetails != null)
                {
                    BindData();
                    txtFinalNotes.Text = po.Notes;
                }
                else
                {
                    listDetails.Visible = false;
                    panelDetails.Visible = true;
                }
            }
        }

        protected bool IsEditable()
        {
            return scController.IsPurchaseOrderEditable(po);
        }

        protected string GetAmount(object quantity, object price)
        {
            double amount = 0;
            if (quantity != null && price != null)
            {
                amount = double.Parse(quantity.ToString()) * double.Parse(price.ToString());
            }
            return String.Format("{0:0.00}", amount);
        }

        protected string GetGrandTotal()
        { 
            grandTotal = 0;
            foreach(PODetail pod in scController.GetPODetailsByPOCode(po.PurchaseOrderCode))
            {
                if (pod.Quantity != null && pod.Price != null)
                {
                    grandTotal += pod.Quantity * pod.Price;
                }
            }
            return String.Format("{0:0.00}", grandTotal);
        }

        protected string GetItemDescription(object itemCode)
        {
            if (itemCode == null) return "";
            return scController.GetItemDescription(itemCode.ToString());
        }


        protected override void OnPreRenderComplete(EventArgs e)
        {            
            base.OnPreRenderComplete(e);

            if (po == null)
            {
                panelError.Visible = true;
                panelDetails.Visible = false;
                return;
            }
            
            lblOrderID.Text = po.PurchaseOrderCode;
            lblStatus.Text = "Status: " + po.Status;
            lblSupplierName.Text = scController.GetSupplierName(po.SupplierCode);
            lblDeliverAddress.Text = "";
            lblAttnTo.Text = scController.GetEmployeeName(po.UserName);
            lblEstDeliverDate.Text = po.DateSupplyExpected == null ? "-" : String.Format("{0:dd MMM yyyy}", po.DateSupplyExpected);
            lblOrderDate.Text = String.Format("{0:dd MMM yyyy}", po.DateCreated);
            lblApprovedDate.Text = po.DateApproved == null ? "Not Approved" : String.Format("{0:dd MMM yyyy}", po.DateApproved);
            lblReceivedDate.Text = po.DateReceived == null ? "Not Recieved" : String.Format("{0:dd MMM yyyy}", po.DateReceived);
            lblOrderBy.Text = scController.GetEmployeeName(po.UserName);
            lblApprovedBy.Text = scController.GetEmployeeName(po.ApprovedBy);
            lblReceivedBy.Text = scController.GetEmployeeName(po.ReceivedBy);            

            Label lblGrandTotal = (Label)listDetails.FindControl("lblGrandTotal");
            lblGrandTotal.Text = GetGrandTotal();

            switch (po.Status)
            {
                case "PENDING":
                    lblStatus.ForeColor = System.Drawing.Color.Gray;
                    btnAckReceipt.Visible = false;
                    btnCancelOrder.Visible = true;
                    btnModalApprove.Visible = true;
                    btnModalReject.Visible = true;
                    txtFinalNotes.ReadOnly = false;
                    break;
                case "APPROVED":
                    lblStatus.ForeColor = System.Drawing.Color.Blue;
                    btnAckReceipt.Visible = true;
                    btnCancelOrder.Visible = true;
                    btnModalApprove.Visible = false;
                    btnModalReject.Visible = false;
                    txtFinalNotes.ReadOnly = true;
                    btnSaveFinalNotes.Visible = false;
                    break;
                case "RECEIVED":
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                    btnAckReceipt.Visible = false;
                    btnCancelOrder.Visible = false;
                    btnModalApprove.Visible = false;
                    btnModalReject.Visible = false;
                    txtFinalNotes.ReadOnly = true;
                    btnSaveFinalNotes.Visible = false;
                    break;
                case "REJECTED":
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    btnAckReceipt.Visible = false;
                    btnCancelOrder.Visible = false;
                    btnModalApprove.Visible = false;
                    btnModalReject.Visible = false;
                    txtFinalNotes.ReadOnly = true;
                    btnSaveFinalNotes.Visible = false;
                    break;
                case "CANCELLED":
                    lblStatus.ForeColor = System.Drawing.Color.OrangeRed;
                    btnAckReceipt.Visible = false;
                    btnCancelOrder.Visible = false;
                    btnModalApprove.Visible = false;
                    btnModalReject.Visible = false;
                    txtFinalNotes.ReadOnly = true;
                    btnSaveFinalNotes.Visible = false;
                    break;
            }



        }

        protected void btnAckReceipt_Click(object sender, EventArgs e)
        {
            int isAck = scController.AckPurchaseOrder(po, poDetails, Context.User.Identity.Name);
            if (isAck == -1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", 
                    "alert('Error acknowledging order!')", true);
            }
            else if (isAck == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('No order was acknowledged!')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('Order has been acknowledged!')", true);
            }
        }

        protected void btnCancelOrder_Click(object sender, EventArgs e)
        {
            if (scController.CancelPurchaseOrder(po) != 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('Error cancelling order!')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('Order has been cancelled!')", true);

            }
        }
        
       

        //protected void linkEdit_Command(object sender, CommandEventArgs e)
        //{
        //    //Response.Redirect("/EditPurchaseOrder?PO=" + poNum);
        //    scController.ApprovePurchaseOrder(po, Context.User.Identity.Name);
        //}
        

        protected void listDetails_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            if (!IsPurchaseOrderingEditing(po))
            {
                //scController.EditingPurchaseOrder(po);
                listDetails.EditIndex = e.NewEditIndex;
                BindData();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, 
                    this.GetType(), "alertMessage", 
                    "alert('Invalid request! Purchase Order is being edited by another user!')", true);
            }
        }

        protected void listDetails_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            Validate();
            if (!Page.IsValid)
            {
                return;
            }
            
            PODetail poDetail = poDetails[e.ItemIndex];
            poDetail.Quantity = Convert.ToInt32(e.NewValues["Quantity"]);
            poDetail.Notes = Convert.ToString(e.NewValues["Notes"]);
            scController.UpdatePODetail(poDetail);
            //scController.FinishEditingPurchaseOrder(po);
            listDetails.EditIndex = -1;
            BindData();
        }


        protected void validOrderQuantity_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (source is CustomValidator && IsPostBack)
            {
                CustomValidator validator = (CustomValidator)source;
                ListViewItem parentItem = (ListViewItem)validator.Parent;
                string itemCode = listDetails.DataKeys[listDetails.EditIndex].Value.ToString();
                int? minReorderQty = scController.GetStationeryReorderQty(itemCode);
                int num = int.Parse(args.Value);
                args.IsValid = num >= minReorderQty;
                var txtOrderQuantity = (TextBox)parentItem.FindControl("txtOrderQuantity");
                if (!args.IsValid)
                {
                    txtOrderQuantity.CssClass = "control error";
                }
                else
                {
                    txtOrderQuantity.CssClass = "control";
                }

                validator.ErrorMessage = "Order quantity cannot be less than " + minReorderQty;
            }
        }

        protected void listDetails_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            //scController.FinishEditingPurchaseOrder(po);
            listDetails.EditIndex = -1;
            BindData();
        }
        

        private void BindData()
        {
            if (poDetails != null)
            {
                listDetails.DataSource = poDetails;
                listDetails.DataBind();
            }
        }

        private bool IsPurchaseOrderingEditing(PurchaseOrder po)
        {
            if (po.Status == "EDITING") return true;
            return false;
        }

        private bool IsPurchaseOrderUpdater()
        {
            if (Session["USER"].ToString() == po.LastUpdatedBy)
                return true;
            return false;
        }

        protected void ValidNotes_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (source is CustomValidator && IsPostBack)
            {
                CustomValidator validator = (CustomValidator)source;
                ListViewItem parentItem = (ListViewItem)validator.Parent;
                var txtNotes = (TextBox)parentItem.FindControl("txtNotes");
                string notes = args.Value;
                args.IsValid = notes.Count<char>() <= 200;
                if (!args.IsValid)
                {
                    txtNotes.CssClass = "control error";
                }
                else
                {
                    txtNotes.CssClass = "control";
                }
            }
        }

        protected void btnApproveRequest_Click(object sender, EventArgs e)
        {
            if (po != null)
            {
                po.Status = "APPROVED";
                po.DateApproved = DateTime.Now;
                po.ApprovedBy = Context.User.Identity.Name;
                supervisorController.updatePOStatus(po);
                BindData();

                //send email
                string fromEmail = emailController.GetUserEmail(Context.User.Identity.Name);
                string password = txtPassword.Text;
                string username = Context.User.Identity.Name;
                try
                {
                    emailController.POApproveRejectSendEmail(fromEmail, password, username, po);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage", "alert('Purchase orders have been successfully approved! Email notifications have been sent successfully!');window.location ='PurchaseOrderDetail?PO="
                           + po.PurchaseOrderCode + "';", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage", "alert('Purchase orders have been successfully approved! However an error has occurred when sending email!');window.location ='PurchaseOrderDetail?PO="
                           + po.PurchaseOrderCode + "';",    true);
                }
            }
        }

        protected void btnRejectRequest_Click(object sender, EventArgs e)
        {
            if (po != null)
            {
                po.Status = "REJECTED";
                po.DateApproved = DateTime.Now;
                po.ApprovedBy = Context.User.Identity.Name;
                supervisorController.updatePOStatus(po);
                BindData();

                //send email
                string fromEmail = emailController.GetUserEmail(Context.User.Identity.Name);
                string password = txtPassword.Text;
                string username = Context.User.Identity.Name;
                try
                {
                    emailController.POApproveRejectSendEmail(fromEmail, password, username, po);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage",
                           "alert('Purchase orders have been successfully rejected! Email notifications have been sent successfully!');window.location ='PurchaseOrderDetail?PO=" 
                           + po.PurchaseOrderCode + "';",
                           true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage", "alert('Purchase orders have been successfully rejected! However an error has occurred when sending email!');window.location ='PurchaseOrderDetail?PO="
                           + po.PurchaseOrderCode + "';", true);
                }
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

            if (hfRequestType.Value == "btnModalApprove")
            {
                btnApproveRequest_Click(sender, e);
            }
            if (hfRequestType.Value == "btnModalReject")
            {
                btnRejectRequest_Click(sender, e);
            }
        }

        protected void btnModal_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Button btnSender = (Button)sender;
                hfRequestType.Value = btnSender.ID;
                
                txtPassword.Text = "";
                lblVerifyError.Visible = false;
                ScriptManager.RegisterStartupScript(this, GetType(), "emailPopup", "$('#emailModal').modal('show');", true);
            }
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
        
        protected void btnSaveFinalNotes_Click(object sender, EventArgs e)
        {
            string finalNotes = txtFinalNotes.Text;
            po.Notes = finalNotes;
            scController.UpdatePurchaseOrder(po);
            btnSaveFinalNotes.Visible = false;
            po = scController.GetPurchaseOrderByCode(poNum);
        }

        protected void txtFinalNotes_TextChanged(object sender, EventArgs e)
        {
            if (IsEditable())
            {
                btnSaveFinalNotes.Visible = true;
            }
        }

        protected void ValidFinalNotes_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (source is CustomValidator && IsPostBack)
            {
                string notes = args.Value;
                args.IsValid = notes.Count<char>() <= 200;
                if (!args.IsValid)
                {
                    txtFinalNotes.CssClass = "control error";
                }
                else
                {
                    txtFinalNotes.CssClass = "control";
                }
            }
        }
    }
}