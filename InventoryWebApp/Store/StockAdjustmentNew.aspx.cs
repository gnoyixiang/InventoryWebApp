using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;
using System.Text;
using InventoryWebApp.Controllers;

namespace InventoryWebApp.Store
{
    public partial class StockAdjustmentNew : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        EmailController emailCtrl = new EmailController();
        StationeryCatalogue stationery;
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
                stationery = sClerkCtrl.GetStationeryByDescription(ddlItemChoice.SelectedValue);
                
                if (stationery != null)
                {
                    tbxNewQuantity.Text = Convert.ToString(stationery.Stock);
                }
            }
            tbxNewQuantity.CssClass = "form-control";
            //em to get information for the dropdownlist
            //ddlItemChoice.DataSource = em.StationeryCatalogues.Select(x => x.Description).ToList();
            //ddlItemChoice.DataBind();

        }
        protected void ddlItemChoice_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblCurrentStockAmount.Text = refreshCurrentStockAmount(ddlItemChoice.SelectedItem.Text);
                int updateQuantityShow = (Convert.ToInt32(tbxNewQuantity.Text)) - (Convert.ToInt32(lblCurrentStockAmount.Text));
                lblQuantityAdjustShow.Text = updateQuantityShow.ToString();
            }
        }
        protected void ddlItemChoice_SelectedIndexChanged(object sender, EventArgs e)
        {            
            lblCurrentStockAmount.Text = sClerkCtrl.UpdateViewCurrentStockAmount(ddlItemChoice.SelectedItem.Text);
            stationery = sClerkCtrl.GetStationeryByDescription(ddlItemChoice.SelectedValue);
            if (stationery != null)
            {
                tbxNewQuantity.Text = Convert.ToString(stationery.Stock);
            }
            if (tbxNewQuantity.Text != "")
            {
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
            if (Page.IsValid)
            {
                lblCurrentStockAmount.Text = sClerkCtrl.UpdateViewCurrentStockAmount(ddlItemChoice.SelectedItem.Text);
                int QuantUpdate = CreateQuantityUpdate(tbxNewQuantity.Text, lblCurrentStockAmount.Text);

                //...handled by PrefillAdjustment:ItemCode,AdjustmentQuant,Reason
                Adjustment a = sClerkCtrl.PrefillAdjustment(ddlItemChoice.SelectedValue, QuantUpdate, tbxReason.Text);

                sClerkCtrl.SubmitAdjustment(a);

                //send email
                string fromEmail = Util.EMAIL;
                string password = Util.PASSWORD;
                string username = Context.User.Identity.Name;
                try
                {
                    emailCtrl.NewAdjustmentSendEmail(fromEmail, password, username, a);
                    Session["SendCreateAdjEmail"] = true;
                }
                catch (Exception ex)
                {
                    Session["SendCreateAdjEmail"] = false;
                }

                Response.Redirect("StockAdjustmentList.aspx");
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblCurrentStockAmount.Text = sClerkCtrl.UpdateViewCurrentStockAmount(ddlItemChoice.SelectedItem.Text);
                int QuantUpdate = CreateQuantityUpdate(tbxNewQuantity.Text, lblCurrentStockAmount.Text);

                //...handled by PrefillAdjustment:ItemCode,AdjustmentQuant,Reason
                Adjustment a = sClerkCtrl.PrefillAdjustment(ddlItemChoice.SelectedValue, QuantUpdate, tbxReason.Text);

                int submitResult = sClerkCtrl.SaveAdjustment(a);

                Response.Redirect("StockAdjustmentList.aspx");
            }
        }
        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockAdjustmentList.aspx");
        }

        protected void validNewQuantity_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int newQuantity = Convert.ToInt32(args.Value);

            if (!(newQuantity >= 0))
            {
                args.IsValid = false;
                tbxNewQuantity.CssClass = "form-control error";
                validNewQuantity.ErrorMessage = "New quantity cannot be lower than 0";
            }
            else
            {
                stationery = sClerkCtrl.GetStationeryByDescription(ddlItemChoice.SelectedValue);
                if (newQuantity == stationery.Stock)
                {
                    args.IsValid = false;
                    tbxNewQuantity.CssClass = "form-control error";
                    validNewQuantity.ErrorMessage = "New quantity cannot same as current stock";
                }
                else
                {
                    args.IsValid = true;
                    tbxNewQuantity.CssClass = "form-control";
                }
            }
            

        }
    }
}