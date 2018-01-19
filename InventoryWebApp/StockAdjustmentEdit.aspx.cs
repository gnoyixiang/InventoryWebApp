using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp
{
    public partial class StockAdjustmentEdit : System.Web.UI.Page
    {
        String s;
        EntityModel em;
        protected void Page_Load(object sender, EventArgs e)
        {
            s = Request.QueryString["AdjustmentCode"];

            em = new EntityModel();
            Adjustment adjRetrieved = em.Adjustments.Where(x => x.AdjustmentCode == s).FirstOrDefault();

            lblItemChoiceName.Text = em.StationeryCatalogues.Where
                (x => x.ItemCode == adjRetrieved.ItemCode).FirstOrDefault().Description.ToString();
            lblCurrentStockAmount.Text = em.StationeryCatalogues.Where
                (x => x.ItemCode == adjRetrieved.ItemCode).FirstOrDefault().Stock.ToString();

        }

        protected void tbxQuantityAdjust_TextChanged(object sender, EventArgs e)
        {

                s = Request.QueryString["AdjustmentCode"];

                em = new EntityModel();
                Adjustment adjRetrieved = em.Adjustments.Where(x => x.AdjustmentCode == s).FirstOrDefault();

                lblCurrentStockAmount.Text = em.StationeryCatalogues.Where
                    (x => x.ItemCode == adjRetrieved.ItemCode).FirstOrDefault().Stock.ToString();

                int updateQuantityShow = (Convert.ToInt32(lblCurrentStockAmount.Text) + Convert.ToInt32(tbxQuantityAdjust.Text));
                lblNewQuantityShow.Text = updateQuantityShow.ToString();

        }

        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockAdjustmentList.aspx");
        }
    }
}