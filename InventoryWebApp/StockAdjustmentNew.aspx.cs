using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp
{
    public partial class StockAdjustmentNew : System.Web.UI.Page
    {
        private static IStationeryCatalogueDAO stDAO = new StationeryCatalogueDAO();
        EntityModel em = new EntityModel();
        protected int CreateQuantityUpdate(String a, String b)
        {
            int c = Int32.Parse(a) - Int32.Parse(b);
            return c;
        }
        protected Adjustment PrefillAdjustment(int q)
        {
            Adjustment a = new Adjustment();
            a.AdjustmentCode = em.Adjustments.Last().AdjustmentCode;
            a.ItemCode = ddlItemChoice.SelectedValue;
            //a.DateCreated = new Date();
            a.AdjustmentQuant = q;
            a.Reason = tbxReason.Text;

            return a;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //ddlItemChoice.DataSource = stDAO.ListAllStationery().ToString();
            //ddlItemChoice.DataBind();

            ddlItemChoice.DataSource = em.StationeryCatalogues.Select(x => x.Description).ToList();
            ddlItemChoice.DataBind();

            //ddlItemChoice.SelectedValue = "0";
            //ddlItemChoice.SelectedItem = 0;
            //ddlItemChoice.SelectedItem.ToString() = 0;
            //lblCurrentStockAmount.Text = stDAO.GetStationery(ddlItemChoice.SelectedItem.Value.ToString()).ItemCode;
            
            //lblCurrentStockAmount.Text = stDAO.GetStationery(ddlItemChoice.SelectedValue).ItemCode;

            //using EntityModel
            //ddlItemChoice.DataSource = em.StationeryCatalogues.Select(x => x.Description).ToList();
            //ddlItemChoice.DataBind();

            //lblCurrentStockAmount.Text = em.StationeryCatalogues.Select(x => x.Stock).First().ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int QuantUpdate = CreateQuantityUpdate(lblNewQuantityShow.Text,lblCurrentStockAmount.Text);

            Adjustment a = PrefillAdjustment(QuantUpdate);
            //Adjustment a = new Adjustment();
            //...handled by PrefillAdjustment
            //a.Reason = tbxReason.Text;

            em.Adjustments.Add(a);
            em.SaveChanges();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int QuantUpdate = CreateQuantityUpdate(lblNewQuantityShow.Text,lblCurrentStockAmount.Text);

            Adjustment a = PrefillAdjustment(QuantUpdate);
            //Adjustment a = new Adjustment();
            //...handled by PrefillAdjustment
            //a.Reason = tbxReason.Text;

            //"Default Value or Binding" in MSSQL sets status to 'pending'
            //a.Status = "pending";

            em.Adjustments.Add(a);
            em.SaveChanges();
        }

        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockAdjustmentList.aspx");
        }
    }
}