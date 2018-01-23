using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;
namespace InventoryWebApp
{
    public partial class StockCardSearch : System.Web.UI.Page
    {
        StoreSupervisorController supervisorController = new StoreSupervisorController();
        static List<StationeryCatalogue> sList;
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] choices = { "Item Description", "Item Code" };
            if (!IsPostBack)
            {
                ddlStockCardSearch.DataSource = choices;
                ddlStockCardSearch.DataBind();
                Repeater1.DataSource = supervisorController.ListAllCategory();
                Repeater1.DataBind();
                sList = supervisorController.SearchStationeryCatalogueByCategoryCode("Clip");
                BindGrid();
            }
        }
        public void BindGrid()
        {
            gvItem.DataSource = sList;
            gvItem.DataBind();
        }
        protected void txtChangedEvent(object sender, EventArgs e)
        {
            string searchName = txtSearch.Text;
            List<StationeryCatalogue> sClist=new List<StationeryCatalogue>();

            if(ddlStockCardSearch.SelectedValue.Equals("Item Description"))
            {
                sClist=supervisorController.SearchStationeryCatalogueByDescription(searchName);
            }
            else
            {
                sClist=supervisorController.SearchStationeryCatalogueByItemCode(searchName);
            }

            sList = sClist;
            BindGrid();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Category")
            {
                Control control;
                control = e.Item.FindControl("btnCategory");
                string categoryCode = ((Button)control).Text;
                sList = supervisorController.SearchStationeryCatalogueByCategoryCode(categoryCode);
                BindGrid();
            }
        }

        protected void GvItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            string itemCode = gvItem.SelectedDataKey.Value.ToString();
            StationeryCatalogue catalogue = supervisorController.GetStationeryCatalogue(itemCode);
           
            Session["StationaryCatalogue"] = catalogue;
            
            Response.Redirect("ViewStockCard.aspx");
        }

        protected void GVItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvItem.PageIndex = e.NewPageIndex;
            BindGrid();
        }
    }
}