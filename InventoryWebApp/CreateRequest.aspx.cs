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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        private void BindGrid()
        {
            GridViewNewRequest.DataSource = (List<StationeryDTO>)Session["ItemDetails"];
            GridViewNewRequest.DataBind();
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ViewCatalogue.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Session["ItemDetails"] = null;
            BindGrid();
        }

        protected void GridViewNewRequest_RowEditing(object sendr, GridViewEditEventArgs e)
        {
            GridViewNewRequest.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridViewNewRequest_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            List<StationeryDTO> st = (List<StationeryDTO>)Session["ItemDetails"];
            st.Remove(st[e.RowIndex]);
            BindGrid();
        }

        protected void GridViewNewRequest_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewNewRequest.EditIndex = -1;
            BindGrid();
        }

        protected void GridViewNewRequest_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewNewRequest.Rows[e.RowIndex];
            string quantity = (row.FindControl("tbxQuantity") as TextBox).Text;
            List<StationeryDTO> st = (List<StationeryDTO>)Session["ItemDetails"];
            st[e.RowIndex].Quantity = Convert.ToInt32(quantity);
            Session["ItemDetails"] = st;
            GridViewNewRequest.EditIndex = -1;
            BindGrid();
        }

        protected void GridViewNewRequest_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewNewRequest.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}