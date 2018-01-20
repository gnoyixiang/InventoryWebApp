using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
namespace InventoryWebApp
{
    public partial class PendingPO : System.Web.UI.Page
    {
        StoreSupervisorController supervisorController = new StoreSupervisorController();
        static List<PurchaseOrder> poList;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                poList = supervisorController.ListAllPendingPO();
                BindGrid();
            }
        }

        private void BindGrid()
        {
            gvPendingPO.DataSource = poList;
            gvPendingPO.DataBind();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            decimal? price = 0;
          
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                PurchaseOrder order = (PurchaseOrder)e.Row.DataItem;
                string id = order.SupplierCode;
                string suppliername = supervisorController.GetSupplier(id).SupplierName;
                List<PODetail> poDetailList = (List<PODetail>)supervisorController.ListPODetailsByPOCode(order.PurchaseOrderCode);
                foreach (PODetail p in poDetailList)
                {
                    price += p.Price*p.Quantity;
                }

                Label priceLabel = (e.Row.FindControl("lblPrice") as Label);
                if (priceLabel != null)
                    priceLabel.Text = "$"+price.ToString();

                Label supplierLabel = (e.Row.FindControl("lblSupplierName") as Label);
                if (supplierLabel != null)
                    supplierLabel.Text = suppliername;
            }
        }

        protected void GvPendingPO_SelectedIndexChanged(object sender, EventArgs e)
        {
            string poCode = gvPendingPO.SelectedDataKey.Value.ToString();
            Session["No"] = gvPendingPO.SelectedIndex+1;
            Session["POrderCode"] = poCode;
            Response.Redirect("PendingPODetails.aspx");
        }

        protected void gvPendingPO_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPendingPO.PageIndex = e.NewPageIndex;
            BindGrid();
        }

       
    }
}