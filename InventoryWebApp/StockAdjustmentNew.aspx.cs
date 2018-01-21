﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;
using System.Text;
using InventoryWebApp.Controllers;

namespace InventoryWebApp
{
    public partial class StockAdjustmentNew : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        protected int CreateQuantityUpdate(String a, String b)
        {
            int c = Int32.Parse(a) - Int32.Parse(b);
            return c;
        }
        protected string refreshCurrentStockAmount(string a)
        {
            string c = sClerkCtrl.UpdateViewCurrentStockAmount(a);
            return c;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlItemChoice.DataSource = sClerkCtrl.LoadDDLStockAdjustmentNew();
                ddlItemChoice.DataBind();
            }

            //em to get information for the dropdownlist
            //ddlItemChoice.DataSource = em.StationeryCatalogues.Select(x => x.Description).ToList();
            //ddlItemChoice.DataBind();

        }
        protected void ddlItemChoice_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblCurrentStockAmount.Text = refreshCurrentStockAmount(ddlItemChoice.SelectedItem.Text);
            }
        }
        protected void ddlItemChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(tbxNewQuantity.Text))
            {
                lblCurrentStockAmount.Text = sClerkCtrl.UpdateViewCurrentStockAmount(ddlItemChoice.SelectedItem.Text);
                
                int updateQuantityShow = (Convert.ToInt32(tbxNewQuantity.Text)) - (Convert.ToInt32(lblCurrentStockAmount.Text));
                lblQuantityAdjustShow.Text = updateQuantityShow.ToString();
            }
        }
        protected void tbxQuantityAdjust_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(tbxNewQuantity.Text))
            {
                lblCurrentStockAmount.Text = sClerkCtrl.UpdateViewCurrentStockAmount(ddlItemChoice.SelectedItem.Text);

                int updateQuantityShow = (Convert.ToInt32(tbxNewQuantity.Text)) - (Convert.ToInt32(lblCurrentStockAmount.Text));
                lblQuantityAdjustShow.Text = updateQuantityShow.ToString();
            }
        }
        protected void tbxReason_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(tbxNewQuantity.Text))
            {
                lblCurrentStockAmount.Text = sClerkCtrl.UpdateViewCurrentStockAmount(ddlItemChoice.SelectedItem.Text);

                int updateQuantityShow = (Convert.ToInt32(tbxNewQuantity.Text)) - (Convert.ToInt32(lblCurrentStockAmount.Text));
                lblQuantityAdjustShow.Text = updateQuantityShow.ToString();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblCurrentStockAmount.Text = sClerkCtrl.UpdateViewCurrentStockAmount(ddlItemChoice.SelectedItem.Text);
            int QuantUpdate = CreateQuantityUpdate(tbxNewQuantity.Text, lblCurrentStockAmount.Text);

            //...handled by PrefillAdjustment:ItemCode,AdjustmentQuant,Reason
            Adjustment a = sClerkCtrl.PrefillAdjustment(ddlItemChoice.SelectedValue, QuantUpdate, tbxReason.Text);

            int submitResult = sClerkCtrl.SubmitAdjustment(a);

            Response.Redirect("StockAdjustmentList.aspx");
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblCurrentStockAmount.Text = sClerkCtrl.UpdateViewCurrentStockAmount(ddlItemChoice.SelectedItem.Text);
            int QuantUpdate = CreateQuantityUpdate(tbxNewQuantity.Text, lblCurrentStockAmount.Text);

            //...handled by PrefillAdjustment:ItemCode,AdjustmentQuant,Reason
            Adjustment a = sClerkCtrl.PrefillAdjustment(ddlItemChoice.SelectedValue, QuantUpdate, tbxReason.Text);

            int submitResult = sClerkCtrl.SaveAdjustment(a);

            Response.Redirect("StockAdjustmentList.aspx");
        }
        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockAdjustmentList.aspx");
        }

    }
}