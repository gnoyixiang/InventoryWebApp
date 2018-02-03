using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;
using Microsoft.AspNet.Identity.Owin;

namespace InventoryWebApp.Store
{
    public partial class StockAdjustmentEdit : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        EmailController emailController = new EmailController();
        string s;
        Adjustment adjRetrieved;
        protected int CreateQuantityUpdate(String a, String b)
        {
            int c = Int32.Parse(a) - Int32.Parse(b);
            return c;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            s = (string)Request.QueryString["AdjustmentCode"];
            adjRetrieved = sClerkCtrl.GetAdjustment(s);

            if (adjRetrieved == null)
            {
                panelNoAdj.Visible = true;
                panelAdj.Visible = false;
                return;
            }
            else
            {
                panelNoAdj.Visible = false;
                panelAdj.Visible = true;
            }

            if (!IsPostBack)
            {
                lblItemChoiceName.Text = sClerkCtrl.DisplayItemChoiceName(adjRetrieved);
                lblCurrentStockAmount.Text = sClerkCtrl.DisplayCurrentStock(adjRetrieved);
                lblQuantityAdjustShow.Text = adjRetrieved.AdjustmentQuant.ToString();
                tbxReason.Text = adjRetrieved.Reason;

                int displayNewQuantity = (Convert.ToInt32(lblCurrentStockAmount.Text)) + (Convert.ToInt32(lblQuantityAdjustShow.Text));
                tbxNewQuantity.Text = displayNewQuantity.ToString();
            }
            

        }

        protected void tbxQuantityAdjust_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(tbxNewQuantity.Text))
            {
                s = Request.QueryString["AdjustmentCode"];

                //em = new EntityModel();
                Adjustment adjRetrieved = sClerkCtrl.GetAdjustment(s);

                lblCurrentStockAmount.Text = sClerkCtrl.DisplayCurrentStock(adjRetrieved);

                int updateQuantityShow = (Convert.ToInt32(tbxNewQuantity.Text)) - (Convert.ToInt32(lblCurrentStockAmount.Text));
                lblQuantityAdjustShow.Text = updateQuantityShow.ToString();
            }
        }
        protected void tbxReason_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(tbxNewQuantity.Text))
            {
                s = Request.QueryString["AdjustmentCode"];

                //em = new EntityModel();
                Adjustment adjRetrieved = sClerkCtrl.GetAdjustment(s);

                lblCurrentStockAmount.Text = sClerkCtrl.DisplayCurrentStock(adjRetrieved);

                int updateQuantityShow = (Convert.ToInt32(tbxNewQuantity.Text)) - (Convert.ToInt32(lblCurrentStockAmount.Text));
                lblQuantityAdjustShow.Text = updateQuantityShow.ToString();
            }
        }

        protected void btnModal_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

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


            s = Request.QueryString["AdjustmentCode"];
            adjRetrieved = sClerkCtrl.GetAdjustment(s);

            lblCurrentStockAmount.Text = sClerkCtrl.DisplayCurrentStock(adjRetrieved);
            int QuantUpdate = CreateQuantityUpdate(tbxNewQuantity.Text, lblCurrentStockAmount.Text);

            //...handled by PrefillAdjustment:ItemCode,AdjustmentQuant,Reason
            //Adjustment a = sClerkCtrl.PrefillAdjustment(adjRetrieved, QuantUpdate, tbxReason.Text);

            adjRetrieved.Status = "pending";
            int submitResult = sClerkCtrl.UpdateAdjustment(adjRetrieved, QuantUpdate, tbxReason.Text);

            //send email
            string fromEmail = emailController.GetUserEmail(Context.User.Identity.Name);
            string password = txtPassword.Text;
            string username = Context.User.Identity.Name;
            try
            {
                emailController.NewAdjustmentSendEmail(fromEmail, password, username, adjRetrieved);
                //Session["SendCreateAdjEmail"] = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('Adjustment have been successfully created! Email notifications have been sent successfully!');window.location ='StockAdjustmentList';", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                   "alertMessage", "alert('Adjustment have been successfully created! However an error has occurred when sending email!');window.location ='StockAdjustmentList';", true);
            }

            //Response.Redirect("/Store/StockAdjustmentList.aspx");
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            s = Request.QueryString["AdjustmentCode"];
            adjRetrieved = sClerkCtrl.GetAdjustment(s);

            lblCurrentStockAmount.Text = sClerkCtrl.DisplayCurrentStock(adjRetrieved);
            int QuantUpdate = CreateQuantityUpdate(tbxNewQuantity.Text, lblCurrentStockAmount.Text);

            //...handled by PrefillAdjustment:ItemCode,AdjustmentQuant,Reason
            //Adjustment a = sClerkCtrl.PrefillAdjustment(adjRetrieved, QuantUpdate, tbxReason.Text);

            //a.Status = "unsubmitted";
            int submitResult = sClerkCtrl.UpdateAdjustment(adjRetrieved, QuantUpdate, tbxReason.Text);

            Response.Redirect("/Store/StockAdjustmentList.aspx");
        }
        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Store/StockAdjustmentList.aspx");
        }

        protected void validNewQuantity_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int newQuantity = Convert.ToInt32(args.Value);
            args.IsValid = newQuantity >= 0;
            if (!args.IsValid)
            {
                tbxNewQuantity.CssClass = "form-control error";
            }
            else
            {
                tbxNewQuantity.CssClass = "form-control";
            }
            validNewQuantity.ErrorMessage = "New quantity cannot be lower than 0";

        }
    }
}