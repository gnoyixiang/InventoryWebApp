using InventoryWebApp.Controllers;
using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp.Dept
{
    public partial class CreateRequest : System.Web.UI.Page
    {
        EmployeeController ec = new EmployeeController();
        EmailController emailController = new EmailController();

        protected void Page_Load(object sender, EventArgs e)
        {
            btnSubmit.Visible = false;
            btnClear.Visible = false;
            if (!IsPostBack)
            {
                string userName = Context.User.Identity.Name;
                lblEmpName.Text = ec.GetEmployeeNameByUserName(userName);
                string deptCode = ec.GetDeptCodeByUserName(userName);
                string deptName = ec.GetDeptNameByCode(deptCode);
                lblDeptName.Text = deptName;
                BindGrid();
            }
            if ((List<RequestDTO>)Session["ItemDetails"] != null)
            {
                var itemDetails = (List<RequestDTO>)Session["ItemDetails"];
                if (itemDetails.Count != 0)
                {
                    btnSubmit.Visible = true;
                    btnClear.Visible = true;
                }
            }
        }   
        private void BindGrid()
        {
            gvNewRequest.DataSource = (List<RequestDTO>)Session["ItemDetails"];
            gvNewRequest.DataBind();
        }
        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCatalogue.aspx");
        }

        protected void btnModal_Click(object sender, EventArgs e)
        {                
            try
            {
                var stationaries = (List<RequestDTO>)Session["ItemDetails"];
                if (stationaries.Count != 0) {
                    if (IsValid)
                    {
                        txtPassword.Text = "";
                        lblVerifyError.Visible = false;
                        ScriptManager.RegisterStartupScript(this, GetType(), "emailPopup", "$('#emailModal').modal('show');", true);
                    }
                }
            }
            catch (NullReferenceException ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                           "alertMessage", "alert('No items have been added to request!');", true);
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
            if (Page.IsValid)
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

                var stationaries = (List<RequestDTO>)Session["ItemDetails"];
                //TODO: change back to userName to session["userName"]
                string userName = Context.User.Identity.Name;
                string deptCode = ec.GetDeptCodeByUserName(userName);
                string requestcode = ec.AddRequest(userName, deptCode, stationaries);

                //send email
                string fromEmail = Util.EMAIL;
                string password = Util.PASSWORD;
                string username = Context.User.Identity.Name;
                try
                {
                    emailController.NewRequestSendEmail(fromEmail, password, username, requestcode);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage", "alert('Request have been successfully created! Email notifications have been sent successfully!');window.location ='DeptRequisitionList';", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage", "alert('Request have been successfully created! However an error has occurred when sending email!');window.location ='DeptRequisitionList';", true);
                }

                //clear
                Session["ItemDetails"] = null;
                BindGrid();
                //show success message and Request Code
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModal').modal('show');");
                sb.Append("$('#lblRequestCode').text('"+ requestcode +"');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", sb.ToString(), false);

            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Session["ItemDetails"] = null;
            BindGrid();
        }
        protected void gvNewRequest_RowEditing(object sendr, GridViewEditEventArgs e)
        {
            gvNewRequest.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvNewRequest_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            List<RequestDTO> st = (List<RequestDTO>)Session["ItemDetails"];
            st.Remove(st[e.RowIndex]);
            BindGrid();
        }

        protected void gvNewRequest_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvNewRequest.EditIndex = -1;
            BindGrid();
        }

        protected void gvNewRequest_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvNewRequest.Rows[e.RowIndex];
            string quantity = (row.FindControl("tbxQuantity") as TextBox).Text;
            List<RequestDTO> st = (List<RequestDTO>)Session["ItemDetails"];
            st[e.RowIndex].Quantity = Convert.ToInt32(quantity);
            Session["ItemDetails"] = st;
            gvNewRequest.EditIndex = -1;
            BindGrid();
        }
        protected void gvNewRequest_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvNewRequest.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void gvNewRequest_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                RequestDTO request = (RequestDTO)e.Row.DataItem;

                TextBox quantity = (e.Row.FindControl("tbxQuantity") as TextBox);
                if(quantity != null)
                {
                    try
                    {
                        quantity.Text = request.Quantity.ToString();
                    }
                    catch (Exception ex)
                    {

                    }
                }
            }
        }
    }
}