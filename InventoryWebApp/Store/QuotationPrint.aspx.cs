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

namespace InventoryWebApp
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
                lblTenderDate.Text = Convert.ToDateTime(sClerkCtrl.GetTender(supplierPick.SupplierCode).DateCreated).ToString("d MMM yyyy");
                gvItemsSupplied.DataSource = sClerkCtrl.LoadQuotationPriceList(Request.QueryString["SupplierCode"], supplierPick);
                gvItemsSupplied.DataBind();
            }
            else
            {
                panelNoForm.Visible = true;
                panelForm.Visible = false;
            }
        }
        
    }
}