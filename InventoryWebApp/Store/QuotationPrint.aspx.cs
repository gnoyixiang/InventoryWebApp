using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;
using System.Data;
using InventoryWebApp.Controllers;

namespace InventoryWebApp.Store
{
    public partial class QuotationPrint : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        Supplier supplierPick;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["SupplierCode"]))
            {                
                supplierPick = sClerkCtrl.GetSupplier(Request.QueryString["SupplierCode"]);                
            }
            if (supplierPick != null)
            {
                
                panelNoForm.Visible = false;
                panelForm.Visible = true;
                lblSupplierName.Text = supplierPick.SupplierName;
                lblSupplierAddress.Text = supplierPick.Address;

                if (!IsPostBack)
                {
                    List<string> tenderYears = sClerkCtrl.GetTenderYearsFromSupplier(supplierPick.SupplierCode);
                    tenderYears.Sort();
                    tenderYears.Reverse();
                    ddlYear.DataSource = tenderYears;
                    ddlYear.DataBind();
                    ddlYear.SelectedIndex = 0;

                    int yearSelected = Convert.ToInt32(ddlYear.SelectedValue);

                    Tender tender = sClerkCtrl.GetTenderByCodeAndDate(supplierPick, yearSelected);
                    lblTenderDate.Text = Convert.ToDateTime(tender.DateCreated).ToString("d MMMM yyyy");

                    BindQuotation(yearSelected);
                }
            }
            else
            {
                panelNoForm.Visible = true;
                panelForm.Visible = false;
            }
        }

        protected void BindQuotation(int yearSelected)
        {
            List<TenderDetail> tenderDetails = sClerkCtrl.LoadQuotationPriceList(supplierPick, yearSelected);
            
            gvItemsSupplied.DataSource = tenderDetails;
            gvItemsSupplied.DataBind();
        }

        protected void gvItemsSupplied_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var tenderDetail = (TenderDetail)e.Row.DataItem;
                Label lblDescription = (Label)e.Row.FindControl("lblDescription");
                lblDescription.Text = sClerkCtrl.GetItemDescription(tenderDetail.ItemCode);

                Label lblPrice = (Label)e.Row.FindControl("lblPrice");
                lblPrice.Text = Convert.ToString(tenderDetail.Price);
            }
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {           
            int yearSelected = Convert.ToInt32(ddlYear.SelectedValue);
            Tender tender = sClerkCtrl.GetTenderByCodeAndDate(supplierPick, yearSelected);
            lblTenderDate.Text = Convert.ToDateTime(tender.DateCreated).ToString("d MMMM yyyy");
            BindQuotation(yearSelected);
        }
    }
}