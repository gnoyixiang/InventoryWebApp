using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;

namespace InventoryWebApp.Store
{
    public partial class QuotationView : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        //private static ISupplierDAO suppDAO = new SupplierDAO();
        //EntityModel em = new EntityModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvQuotation.DataSource = sClerkCtrl.ListOfSupplier();
            gvQuotation.DataBind();


            //gvQuotation.DataSource = em.Suppliers.Select
            //    (x => new { x.SupplierCode,x.SupplierName, x.Address, x.ContactName, x.PhoneNo}).ToList();
        }
    }
}