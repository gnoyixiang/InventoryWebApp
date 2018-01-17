using InventoryWebApp.Controllers;
using InventoryWebApp.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class CreateRequest : System.Web.UI.Page
    {
        EmployeeController ec = new EmployeeController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        private void BindGrid()
        {
            gvNewRequest.DataSource = (List<StationeryDTO>)Session["ItemDetails"];
            gvNewRequest.DataBind();
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ViewCatalogue.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var requestCode = "RQ" + DateTime.Now.ToString("yyyyMMddHHmmss") + 100;
            if(requestCode != ec.GetRequestCode)
            ec.AddRequest(requestCode, tbxDeptName.Text, DateTime.Now, "pending");
            //Department dp = new Department();
            //if(tbxDeptName.Text != null)
            //{
            //    dp.DepartmentName = tbxDeptName.Text;
            //    dp.DepartmentName = dp.DepartmentCode;
            //}
            //Employee emp = new Employee();
            //if (tbxEmpName.Text != null)
            //{
            //    emp.EmployeeName = tbxEmpName.Text;
            //    emp.EmployeeName = emp.User.UserName;
            //}
            //Request request = new Request()
            //{
            //    RequestCode = requestCode + 1,
            //    DepartmentCode = dp.DepartmentName,
            //    DateCreated = DateTime.Now,
            //    Status = "pending",
            //    User = , 
            //};
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
            List<StationeryDTO> st = (List<StationeryDTO>)Session["ItemDetails"];
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
            List<StationeryDTO> st = (List<StationeryDTO>)Session["ItemDetails"];
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
    }
}