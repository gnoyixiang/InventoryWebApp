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
            if (GridViewNewRequest.Rows.Count > 0)
            {
                for (int i = 0; i <= GridViewNewRequest.Rows.Count; i++)
                {
                    GridViewNewRequest.Columns.Clear();
                    GridViewNewRequest.DataBind();
                }
            }
        }

        protected void GridViewNewRequest_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewNewRequest.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridViewNewRequest_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

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
            StationeryDTO st =(StationeryDTO)Session["ItemDetails"];
            
            //st.Add(quantity);
            ////GridViewRow dr = GridViewNewRequest.Rows[e.RowIndex];

            //quantity = dr.RowIndex;
            //dr["tbxQuantity"] = quantity;
            //dr.AcceptChanges();
            //Session["ItemDetails"] = st;
            //GridViewNewRequest.EditIndex = -1;
            //BindGrid();
            //DataGrid dg = (DataGrid)sender;
            //DataTable dt = (DataTable)dg.DataSource;
            //DataRow dr = dt.Rows[dg.]
        }

        protected void GridViewNewRequest_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewNewRequest.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}