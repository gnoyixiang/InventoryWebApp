using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Classes;

namespace InventoryWebApp
{
    public partial class ViewPurchaseOrders : System.Web.UI.Page
    {
        private static readonly string[] SEARCH_ITEMS = { "-- Search By --",
            "PO Number", "Supplier Name", "Order Date", "Created By", "Status" };
        enum sortBy
        {
            PONum, SupplierName, OrderDate, CreatedBy, EstimatedSupplyDate, Status
        }

        List<PurchaseOrder> poList;
        StoreClerkController scController = new StoreClerkController();

        protected void Page_Load(object sender, EventArgs e)
        {
            poList = scController.GetAllPurchaseOrders();
            poList.Sort(new ComparePurchaseOrderByPONum());
            if (!IsPostBack)
            {                
                ddlSearch.Items.Clear();
                ddlSearch.DataSource = SEARCH_ITEMS;
                ddlSearch.DataBind();
            }
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);
            if (isSearchDate())
            {
                panelDate.Visible = true;
                txtSearch.Visible = false;
            }
            else
            {
                panelDate.Visible = false;
                txtSearch.Visible = true;
            }
                        
            foreach (PurchaseOrder p in poList)
            {
                p.SupplierCode = scController.GetSupplierName(p.SupplierCode);
            }
            
            listPO.DataSource = poList;
            listPO.DataBind();
        }

        protected void Page_PreRender(EventArgs e)
        {
            
        }

        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtEndDate.Text = "";
            txtStartDate.Text = "";
            txtSearch.Text = "";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            poList = searchList();
        }

        private bool isSearchDate()
        {
            int searchIndex = ddlSearch.SelectedIndex;
            if (searchIndex == 3) return true;
            return false;
        }

        private List<PurchaseOrder> searchList()
        {
            string searchBy = ddlSearch.SelectedValue;
            int searchIndex = ddlSearch.SelectedIndex;
            string searchText = txtSearch.Text.Trim();

            if (isSearchDate())
            {
                DateTime startDate = DateTime.Parse(txtStartDate.Text);
                DateTime endDate = DateTime.Parse(txtEndDate.Text);
                return scController.GetPurchaseOrdersByDateCreated(startDate, endDate);    
            }
            return scController.GetPurchaseOrdersBySearchText(searchIndex, searchText);            

        }        
        
        protected void lisPOPager_PreRender(object sender, EventArgs e)
        {

        }

        protected void sortStatusAsc_Command(object sender, CommandEventArgs e)
        {

        }
    }
}