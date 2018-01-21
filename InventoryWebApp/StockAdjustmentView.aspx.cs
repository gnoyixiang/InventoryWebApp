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
    public partial class StockAdjustmentView : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        string s;
        EntityModel em;
        protected void Page_Load(object sender, EventArgs e)
        {
            s = Request.QueryString["AdjustmentCode"];

            em = new EntityModel();
            Adjustment adjRetrieved = sClerkCtrl.GetAdjustment(s);

            lblItemChoiceName.Text = sClerkCtrl.DisplayItemChoiceName(adjRetrieved);
            lblQuantityAdjustedShow.Text = adjRetrieved.AdjustmentQuant.ToString();

            lblReasonSubmitted.Text = adjRetrieved.Reason;
            lblRejectionReasonShow.Text = adjRetrieved.HeadRemarks;

            ////get current stock present
            //lblNewQuantityAmount.Text = em.StationeryCatalogues.Where
            //    (x => x.ItemCode == adjRetrieved.ItemCode).FirstOrDefault().Stock.ToString();

            ////calc old stock
            //int showPreviousQuantity = Convert.ToInt32(lblNewQuantityAmount.Text) + (int)adjRetrieved.AdjustmentQuant;
            //lblCurrentStockAmount.Text = showPreviousQuantity.ToString();
        }

        protected void ReturnToAdjustmentList_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockAdjustmentList.aspx");
        }
    }
}