using InventoryWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class ItemDetails : System.Web.UI.Page
    {
        EntityModel SSIS = new EntityModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                string itemcode = Request.QueryString["ItemCode"];
                try
                {
                    Session["ItemDetails"] = Session["ItemDetails"] != null?(List<StationeryDTO>)Session["ItemDetails"] : new List<StationeryDTO>();
                    StationeryCatalogue itemInfo = SSIS.StationeryCatalogues.Where(x => x.ItemCode == itemcode).FirstOrDefault();
                    if (itemInfo != null)
                    {
                        tbxItemCode.Text = Request.QueryString["ItemCode"].ToString();
                        tbxCategory.Text = itemInfo.CategoryCode;
                        tbxDescription.Text = itemInfo.Description;
                    }
                }
                catch (Exception ex)
                {
                    string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
                    Response.Write(errormsg);
                }
            }
        }
        protected void tbxQuantity_TextChanged(object sender, EventArgs e)
        {
            if(!String.IsNullOrEmpty(tbxQuantity.ToString()))
            {
                rdlQuantity.Enabled = false;
                rdlRequiredValidator.Visible = false;
                lblQuantityResult.Text = "Quantity for this item is: " + Convert.ToInt32(tbxQuantity.Text);
            }
        }
        protected void rdlQuantity_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(rdlQuantity.SelectedItem != null)
            {
                tbxQuantity.Visible = false;
                tbxRequiredValidator.Visible = false;
                lblQuantityResult.Text = "Quantity for this item is: " + rdlQuantity.SelectedItem.Text;
            }
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#myModal').modal('show');", true);

                List<StationeryDTO> addItem = (List<StationeryDTO>)Session["ItemDetails"];
                StationeryDTO newItem = addItem.FirstOrDefault(x => x.ItemCode == tbxItemCode.Text);
                if (newItem == null)
                {
                    if (!String.IsNullOrEmpty(tbxQuantity.Text))
                    {
                        newItem = new StationeryDTO(tbxItemCode.Text, tbxCategory.Text, tbxDescription.Text, Convert.ToInt32(tbxQuantity.Text));
                        addItem.Add(newItem);
                        Session["ItemDetails"] = addItem;
                    }
                    else if (rdlQuantity.SelectedItem.Selected)
                    {
                        newItem = new StationeryDTO(tbxItemCode.Text, tbxCategory.Text, tbxDescription.Text, Convert.ToInt32(rdlQuantity.SelectedItem.Text));
                        addItem.Add(newItem);
                        Session["ItemDetails"] = addItem;
                    }
                }
                else
                {
                    if (!String.IsNullOrEmpty(tbxQuantity.Text))
                    {
                        newItem.Quantity += Convert.ToInt32(tbxQuantity.Text) ;
                        addItem.RemoveAll(x => x.ItemCode == tbxItemCode.Text);
                        addItem.Add(newItem);
                        Session["ItemDetails"] = addItem;
                    }
                    else if (rdlQuantity.SelectedItem.Selected)
                    {
                        newItem.Quantity += Convert.ToInt32(rdlQuantity.SelectedItem.Text) ;
                        addItem.RemoveAll(x => x.ItemCode == tbxItemCode.Text);
                        addItem.Add(newItem);
                        Session["ItemDetails"] = addItem;
                    }
                }
            }
        }
    }
}