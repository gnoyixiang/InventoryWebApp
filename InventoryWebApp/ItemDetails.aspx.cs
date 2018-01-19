using InventoryWebApp.Controllers;
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
        EmployeeController ec = new EmployeeController();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string itemcode = Request.QueryString["ItemCode"];
                try
                {
                    Session["ItemDetails"] = Session["ItemDetails"] != null ? (List<RequestDTO>)Session["ItemDetails"] : new List<RequestDTO>();
                    var itemInfo = ec.GetStationery(itemcode);
                    if (itemInfo != null)
                    {
                        lblItemCode.Text = Request.QueryString["ItemCode"].ToString();
                        lblCategory.Text = itemInfo.CategoryCode;
                        lblDescription.Text = itemInfo.Description;
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
            if (!String.IsNullOrEmpty(tbxQuantity.Text))
            {
                rdlQuantity.Enabled = false;
                rdlRequiredValidator.Visible = false;
                int quantity = -1;
                if (!int.TryParse(tbxQuantity.Text, out quantity))
                {
                    lblQuantityResult.Text = "";
                }
                else if(int.TryParse(tbxQuantity.Text, out quantity) && int.Parse(tbxQuantity.Text) < 0)
                {
                    lblQuantityResult.Text = "";
                }
                else 
                {
                    lblQuantityResult.Text = "Quantity for this item is:" + Convert.ToInt32(tbxQuantity.Text);
                }
            }
        }
        protected void rdlQuantity_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdlQuantity.SelectedItem != null)
            {
                tbxQuantity.Visible = false;
                tbxRequiredValidator.Visible = false;
                lblQuantityResult.Text = "Quantity for this item is: " + rdlQuantity.SelectedItem.Text;
            }
        }

        protected void btnAddToRequest_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //show success message
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#myModal').modal('show');", true);

                List<RequestDTO> addItem = (List<RequestDTO>)Session["ItemDetails"];
                RequestDTO newItem = addItem.FirstOrDefault(x => x.ItemCode == lblItemCode.Text);
                if (newItem == null)
                {
                    if (!String.IsNullOrEmpty(tbxQuantity.Text))
                    {
                        newItem = new RequestDTO(lblItemCode.Text, lblCategory.Text, lblDescription.Text, Convert.ToInt32(tbxQuantity.Text));
                        addItem.Add(newItem);
                        Session["ItemDetails"] = addItem;
                    }
                    else if (rdlQuantity.SelectedItem.Selected)
                    {
                        newItem = new RequestDTO(lblItemCode.Text, lblCategory.Text, lblCategory.Text, Convert.ToInt32(rdlQuantity.SelectedItem.Text));
                        addItem.Add(newItem);
                        Session["ItemDetails"] = addItem;
                    }
                }
                else
                {
                    if (!String.IsNullOrEmpty(tbxQuantity.Text))
                    {
                        newItem.Quantity += Convert.ToInt32(tbxQuantity.Text);
                        addItem.RemoveAll(x => x.ItemCode == lblItemCode.Text);
                        addItem.Add(newItem);
                        Session["ItemDetails"] = addItem;
                    }
                    else if (rdlQuantity.SelectedItem.Selected)
                    {
                        newItem.Quantity += Convert.ToInt32(rdlQuantity.SelectedItem.Text);
                        addItem.RemoveAll(x => x.ItemCode == lblItemCode.Text);
                        addItem.Add(newItem);
                        Session["ItemDetails"] = addItem;
                    }
                }
            }
        }
    }
}