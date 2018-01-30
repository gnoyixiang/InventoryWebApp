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
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);

            if (!IsPostBack)
            {
                ddlSearch.Items.Clear();
                ddlSearch.DataSource = SEARCH_ITEMS;
                ddlSearch.DataBind();

                if (Session["CreatedPO"] != null)
                {
                    if ((bool)Session["CreatedPO"])
                    {                        
                        if (!(bool)Session["SendCreatePOEmail"])
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                "alertMessage", "alert('Purchase orders have been successfully created! However an error has occurred when sending email!')", true);
                        }
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage", "alert('Purchase orders have been successfully created! Email notifications have been sent successfully!')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                   "alertMessage", "alert('An error has occurred when creating purchase orders!')", true);
                    }
                    Session["CreatedPO"] = null;
                    Session["SendCreatePOEmail"] = null;
                }
            }

            poList = scController.GetAllPurchaseOrders();
            if (!String.IsNullOrEmpty(Request.QueryString["search"]))
            {
                string search = Request.QueryString["search"];

                switch (search)
                {
                    case "1":
                    case "2":
                    case "4":
                    case "5":
                        if (!IsPostBack)
                        {
                            ddlSearch.SelectedIndex = Convert.ToInt32(search);
                        }
                        string searchText = (string)Request.QueryString["q"];
                        if (!IsPostBack)
                        {
                            txtSearch.Text = searchText;
                        }
                        poList = scController.GetPurchaseOrdersBySearchText(Convert.ToInt32(search), searchText);
                        break;
                    case "3":
                        if (!IsPostBack)
                        {
                            ddlSearch.SelectedIndex = Convert.ToInt32(search);
                        }
                        DateTime startDate, endDate;

                        if (DateTime.TryParse((string)Request.QueryString["d1"], out startDate)
                            && DateTime.TryParse((string)Request.QueryString["d2"], out endDate))
                        {
                            if (!IsPostBack)
                            {
                                txtStartDate.Text = startDate.ToString("yyyy-MM-dd");
                                txtEndDate.Text = endDate.ToString("yyyy-MM-dd");
                            }
                            if (endDate >= startDate)
                            {
                                poList = scController.GetPurchaseOrdersByDateCreated(startDate, endDate);
                            }
                            else
                            {
                                poList = new List<PurchaseOrder>();
                            }
                        }
                        else if (DateTime.TryParse((string)Request.QueryString["d1"], out startDate))
                        {
                            if (!IsPostBack)
                            {
                                txtStartDate.Text = startDate.ToString("yyyy-MM-dd");
                            }
                            poList = scController.GetPurchaseOrdersByDateCreated(startDate);
                        }
                        else if (DateTime.TryParse((string)Request.QueryString["d2"], out endDate))
                        {
                            if (!IsPostBack)
                            {
                                txtEndDate.Text = endDate.ToString("yyyy-MM-dd");
                            }
                            poList = scController.GetPurchaseOrdersByDateCreated(endDate);
                        }
                        break;
                    default:
                        break;
                }
            }


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

            if (poList.Count > 0)
            {
                panelList.Visible = true;
                panelNoList.Visible = false;

                poList.Sort(new ComparePurchaseOrderByPONum());
                poList.Reverse();

                foreach (PurchaseOrder p in poList)
                {
                    p.SupplierCode = scController.GetSupplierName(p.SupplierCode);
                }

                listPO.DataSource = poList;
                listPO.DataBind();
            }
            else
            {
                panelList.Visible = false;
                panelNoList.Visible = true;
            }
        }
        
        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtEndDate.Text = "";
            txtStartDate.Text = "";
            txtSearch.Text = "";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //poList = searchList();

            string searchBy = ddlSearch.SelectedValue;
            int searchIndex = ddlSearch.SelectedIndex;
            string searchText = txtSearch.Text.Trim();

            if (isSearchDate())
            {
                //DateTime startDate = DateTime.Parse(txtStartDate.Text);
                //DateTime endDate = DateTime.Parse(txtEndDate.Text);
                Response.Redirect("/Store/ViewPurchaseOrders?search=" + searchIndex + "&d1=" + txtStartDate.Text + "&d2=" + txtEndDate.Text);
                //return scController.GetPurchaseOrdersByDateCreated(startDate, endDate);
            }
            Response.Redirect("/Store/ViewPurchaseOrders?search=" + searchIndex + "&q=" + searchText);
            //return scController.GetPurchaseOrdersBySearchText(searchIndex, searchText);
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