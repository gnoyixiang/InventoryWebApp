﻿using InventoryWebApp.Controllers;
using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;
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
            if (Page.IsValid)
            {
                var stationaries = (List<StationeryDTO>)Session["ItemDetails"];
                //Todo: change back to username and department code
                //ec.AddRequest("mehmet@ssis.edu.sg","CPSC", stationaries);
                ec.AddRequest(tbxDeptName.Text, tbxEmpName.Text, stationaries);
                //clear
                Session["ItemDetails"] = null;
                BindGrid();
                //show success message else user dont know wat happend
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#myModal').modal('show');", true);
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