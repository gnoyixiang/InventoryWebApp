﻿using InventoryWebApp.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class ViewCatalogue : System.Web.UI.Page
    {
        //CatalogueController cC = new CatalogueController();
        EmployeeController ec = new EmployeeController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                try
                {
                    BindGrid();
                }
                catch (Exception ex)
                {
                    string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
                    Response.Write(errormsg);
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //List<StationeryCatalogue> list = new List<StationeryCatalogue>();
            var list = ec.gridview();
            string keyword = txbkeyword.Text;
            string type = ddlSearchBy.Text;
            if(type == "Description")
            {
                //list = cC.searchByDescription(keyword);
                list = ec.searchByDescription(keyword);
            }
            else if(type == "ItemCode")
            {
                //list = cC.searchByItemCode(keyword);
                list = ec.searchByItemCode(keyword);
            }
            else if (type == "Category")
            {
                //list = cC.searchByCategory(keyword);
                list = ec.searchByCategoryCode(keyword);
            }
            try
            {
                this.gvCatalogue.DataSource = list;
                this.gvCatalogue.DataBind();
            }
            catch(Exception ex)
            {
                string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
                Response.Write(errormsg);
            }
        }
        private void BindGrid()
        {
            //List<StationeryCatalogue> stationerylist = new List<StationeryCatalogue>();
            //stationerylist = cC.listAll();
            gvCatalogue.DataSource = ec.gridview();
            gvCatalogue.DataBind();
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCatalogue.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}