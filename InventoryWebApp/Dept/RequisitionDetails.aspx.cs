using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models;
using Microsoft.AspNet.Identity.Owin;

namespace InventoryWebApp.Dept
{
    public partial class RequisitionDetails : System.Web.UI.Page
    {
        string RequestC;
        Request RO;
        EmployeeController ec = new EmployeeController();
        DepartmentHeadController dCon = new DepartmentHeadController();
        EmailController emailController = new EmailController();
        string ItCode;
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["REQUESTCODE"]!=null)
            {
                RequestC = Request.QueryString["REQUESTCODE"];
                RO = ec.GetRequestbyRequestCode(RequestC);
                if (Request.QueryString["ItemCode"] != null)
                {
                    ItCode = Request.QueryString["ItemCode"];
                    var rd=Session["ItemDetails"];
                    ec.AddRequestDetailtoCurrentRequest(RequestC, (List<RequestDTO>)rd);
                    Session["ItemDetails"] = null;
                }

            }
            else
            {
                Panel2.Visible = true;
                Panel1.Visible = false;
                return;
            }
            
            if (!IsPostBack)
            {
                FillFields();
                ListView1.DataSource = ec.ListAllRequestDetails(RO);

                ListView1.DataBind();
                ListView2.DataSource = ec.ListDisbursementbyRequest(RO);
                ListView2.DataBind();

            }
        }

        private void RefillFields()
        {
            RequestC = Request.QueryString["REQUESTCODE"];
            RO = ec.GetRequestbyRequestCode(RequestC);
            FillFields();
        }

        private void FillFields()
        {
            lblRequestCode.Text = RO.RequestCode.ToString();
            lblStatus.Text = RO.Status.ToUpper().ToString();
            lblDepartmentName.Text = RO.DepartmentCode.ToString();
            lblEmployeeName.Text = GetEmployeeName(RO.UserName);
            lblComment.Text = (string)RO.HeadRemarks;
        }

        protected bool IsEditable()
        {
            return ec.CheckStatusToEdit(RO);
        }

        protected void listDetails_ItemEditing(object sender, ListViewEditEventArgs e)
        {
                ListView1.EditIndex = e.NewEditIndex;
                BindData();
        }

        private bool IsRequestEditing(Request R)
        {
            if (R.Status.ToUpper() == "PENDING") return true;
            return false;
        }

        private void BindData()
        {
            if (RO != null)
            {
                ListView1.DataSource = ec.ListAllRequestDetails(RO);
                ListView1.DataBind();
            }
        }

        protected void ListView1_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ListView1.EditIndex = -1;
            BindData();
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            int a = Convert.ToInt32(e.NewValues["Quantity"]);
            RequestDetail rd = ec.ListAllRequestDetails(RO)[ListView1.EditIndex];
            rd.Quantity = a;
            rd.RemainingQuant = a;
            ec.UpdateRequestDetail(rd);
            ListView1.EditIndex = -1;
            BindData();
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            RequestDetail rd = ec.ListAllRequestDetails(RO)[e.ItemIndex];
            ec.DeleteRequestDetail(rd);
            BindData();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#myModal').modal('show');", true);

        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCatalogue.aspx?REQUESTCODE=" + RO.RequestCode);
        }

        protected bool IsEmployee()
        {
            return Context.User.IsInRole("Employee");
        }
        protected string GetEmployeeName(string username)
        {
            return ec.GetEmployeeNameByUserName(username);
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            RO.Status = "processing";
            if (tbxCom.Text.Length != 0)
            {
                RO.HeadRemarks = tbxCom.Text;
            }

            RO.DateApproved = DateTime.Now;
            RO.ApprovedBy = Context.User.Identity.Name;

            int i = dCon.UpdateRequest(RO, "processing");

            //send email
            string fromEmail = Util.EMAIL;
            string password = Util.PASSWORD;
            string username = Context.User.Identity.Name;
            try
            {
                emailController.RequestApproveRejectSendEmail(fromEmail, password, username, RO);
                //Session["SendRequestApproveRejectEmail"] = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('Request has been successfully approved! However an error has occurred when sending email!');window.location ='RequisitionDetails?REQUESTCODE="
                           + RO.RequestCode + "';", true);
            }

            if (i == 1)
            {
                btnModalApprove.Visible = false;
                btnModalReject.Visible = false;
                tbxCom.Visible = false;
                lblCom.Visible = false;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "alert('The requisition is approved successfully!');window.location ='RequisitionDetails?REQUESTCODE="
                           + RO.RequestCode + "';", true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "alert('Sorry ,the requisition cannot be approved!');window.location ='RequisitionDetails?REQUESTCODE="
                           + RO.RequestCode + "';", true);
            }
            
            //RefillFields();

        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            RO.Status = "rejected";
            string remark = tbxCom.Text;
            if (tbxCom.Text.Length != 0)
            {
                RO.HeadRemarks = tbxCom.Text;
            }

            int i = dCon.UpdateRequest(RO, "rejected");

            //send email
            string fromEmail = Util.EMAIL;
            string password = Util.PASSWORD;
            string username = Context.User.Identity.Name;
            try
            {
                emailController.RequestApproveRejectSendEmail(fromEmail, password, username, RO);
                //Session["SendRequestApproveRejectEmail"] = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('Request have been successfully rejected! However an error has occurred when sending email!');window.location ='RequisitionDetails?REQUESTCODE="
                           + RO.RequestCode + "';", true);
            }

            if (i == 1)
            {
                btnModalApprove.Visible = false;
                btnModalReject.Visible = false;
                tbxCom.Visible = false;
                lblCom.Visible = false;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "alert('The requisition has been rejected!');window.location ='RequisitionDetails?REQUESTCODE="
                           + RO.RequestCode + "';", true);                
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "alert('Sorry ,the requisition cannot be rejected!');window.location ='RequisitionDetails?REQUESTCODE="
                           + RO.RequestCode + "';", true);
            }
            //RefillFields();
        }

        protected string GetItemDescription(string itemcode)
        {
            return dCon.GetStationeryCatalogue(itemcode).Description;
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
                btnApprove_Click(sender, e);
            }
            if (hfRequestType.Value == "btnModalReject")
            {
                btnReject_Click(sender, e);
            }
        }

        protected void btnModal_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                hfRequestType.Value = (sender as Button).ID;
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
    }
}