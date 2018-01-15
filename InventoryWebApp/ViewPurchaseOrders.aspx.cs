using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class ViewPurchaseOrders : System.Web.UI.Page
    {
        private static readonly string[] SEARCH_ITEMS = { "-- Search By --", "PO Number", "Supplier Name", "Order Date", "Created By", "Status" };
        List<PurchaseOrder> poList;

        protected void Page_Load(object sender, EventArgs e)
        {
            poList = getPurchaseOrders();
            if (!IsPostBack)
            {                
                ddlSearch.Items.Clear();
                ddlSearch.DataSource = SEARCH_ITEMS;
                ddlSearch.DataBind();
            }
        }
        private string getSupplierName(string supplierCode)
        {
            return getSupplier(supplierCode).SupplierName;
        }

        private Supplier getSupplier(string supplierCode)
        {
            return new EntityModel().Suppliers.Where(s => s.SupplierCode.Equals(supplierCode)).FirstOrDefault<Supplier>();
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
                p.SupplierCode = getSupplierName(p.SupplierCode);
            }
            poList.Sort();
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
                return getPurchaseOrdersByDate(startDate, endDate);    
            }
            return getPurchaseOrdersBySearch(searchIndex, searchText);            

        }

        private List<PurchaseOrder> getPurchaseOrdersByDate(DateTime startDate, DateTime endDate)
        {
            List<PurchaseOrder> orders = new List<PurchaseOrder>();
            foreach (PurchaseOrder p in getPurchaseOrders())
            {
                DateTime pDate = Convert.ToDateTime(p.DateCreated);
                if (pDate.Date >= startDate.Date && pDate.Date <= endDate.Date)
                {
                    orders.Add(p);
                }
            }
            return orders;
        }

        private List<PurchaseOrder> getPurchaseOrdersBySearch(int searchIndex, string searchText)
        {
            using (EntityModel em = new EntityModel())
            {
                switch (searchIndex)
                {
                    case 1:
                        return em.PurchaseOrders.Where(p => p.PurchaseOrderCode.ToUpper().Contains(searchText.ToUpper())).ToList();
                    case 2:
                        List<PurchaseOrder> orders = new List<PurchaseOrder>();
                        foreach (PurchaseOrder p in getPurchaseOrders())
                        {
                            if (getSupplierName(p.SupplierCode).ToUpper().Contains(searchText.ToUpper()))
                            {
                                orders.Add(p);
                            }
                        }
                        return orders;
                    case 4:
                        return em.PurchaseOrders.Where(p => p.Username.ToUpper().Contains(searchText.ToUpper())).ToList();
                    case 5:
                        return em.PurchaseOrders.Where(p => p.Status.ToUpper().Contains(searchText.ToUpper())).ToList();
                    default:
                        return getPurchaseOrders();
                }
            }
        }

        private List<PurchaseOrder> getPurchaseOrders()
        {
            return new EntityModel().PurchaseOrders.ToList();
        }

        protected void lisPOPager_PreRender(object sender, EventArgs e)
        {

        }
    }
}