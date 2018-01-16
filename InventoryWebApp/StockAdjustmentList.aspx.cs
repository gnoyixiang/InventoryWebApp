using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models;

namespace InventoryWebApp
{
    public partial class StockAdjustmentList : System.Web.UI.Page
    {
        EntityModel em = new EntityModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvAdjustmentStatus.DataSource = em.Adjustments.Select
                (x => new { x.AdjustmentCode, x.ItemCode, x.QuantOnHand, x.DateCreated, x.Status, x.Reason }).ToList();
            //programmatically add hyperlinks dependent on status
            //AdjustmentStatusList.Columns.Add("");
            gvAdjustmentStatus.DataBind();
        }

        protected void btnNewStockAdjustment_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockAdjustmentNew.aspx");
        }
    }
}