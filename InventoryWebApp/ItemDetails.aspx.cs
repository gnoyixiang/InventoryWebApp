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
        Team8_SSISEntities SSIS = new Team8_SSISEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                string itemcode = Request.QueryString["ItemCode"];
                try
                {
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
                List<InventoryWebApp.Models.StationeryCatalogue> addItem = (List<InventoryWebApp.Models.StationeryCatalogue>)Session["ItemDetails"];
                addItem = addItem ?? new List<InventoryWebApp.Models.StationeryCatalogue>();
                InventoryWebApp.Models.StationeryCatalogue newItem = new InventoryWebApp.Models.StationeryCatalogue(tbxItemCode.Text, tbxCategory.Text, tbxDescription.Text, Convert.ToInt32(tbxQuantity.Text));
                addItem.Add(newItem);
                Session["ItemDetails"] = addItem;
            }
        }
    }
}