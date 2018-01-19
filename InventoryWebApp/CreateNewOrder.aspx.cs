using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Classes;

namespace InventoryWebApp
{
    public partial class CreateNewOrder : System.Web.UI.Page
    {
        StoreClerkController scController = new StoreClerkController();

        protected void Page_Load(object sender, EventArgs e)
        {
            List<StationeryCatalogue> stationeries = scController.GetStationeriesBelowReorderLevel();
            List<PurchaseItem> purchaseItems = new List<PurchaseItem>();
            if (Session["purchaseItems"] != null)
            {
                purchaseItems = (List<PurchaseItem>)Session["purchaseItems"];

                var copyPurchaseItems = new List<PurchaseItem>(purchaseItems);
                foreach (StationeryCatalogue s in stationeries)
                {
                    bool isFound = false;
                    for (int i = 0; i < copyPurchaseItems.Count; i++)
                    {
                        //check if there are changes in stock for the same product
                        if (copyPurchaseItems[i].Stationery.ItemCode == s.ItemCode)
                        {
                            isFound = true;
                            if (copyPurchaseItems[i].Stationery.Stock != s.Stock)
                            {
                                purchaseItems[i].Stationery = s;
                            }
                            break;
                        }
                    }
                    //item has fallen below reorder level but not in purchaseItems list (not found)
                    if (!isFound)
                    {
                        PurchaseItem p = new PurchaseItem();
                        p.Stationery = s;
                        p.SupplierCode = s.Supplier1;
                        p.OrderQuantity = s.ReorderQuantity;
                        purchaseItems.Add(p);
                    }
                }
            }
            else
            {
                foreach (StationeryCatalogue s in stationeries)
                {
                    PurchaseItem p = new PurchaseItem();
                    p.Stationery = s;
                    p.SupplierCode = s.Supplier1;
                    p.OrderQuantity = s.ReorderQuantity;
                    purchaseItems.Add(p);
                }
            }

            Session["purchaseItems"] = purchaseItems;

            if (!IsPostBack)
            {
                listItems.DataSource = purchaseItems;
                listItems.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            var purchaseItems = (List<PurchaseItem>)Session["purchaseItems"];
            if (scController.CreatePurchaseOrders(purchaseItems) != 0)
            {
                Session["CreatedPO"] = true;
                Session["purchaseItems"] = null;
            }
            else
            {
                Session["CreatedPO"] = false;
            }
            Response.Redirect("/ViewPurchaseOrders");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void listItems_ItemCreated(object sender, ListViewItemEventArgs e)
        {

        }

        protected void ddlSuppliers_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (sender is DropDownList)
            {
                DropDownList ddl = (DropDownList)sender;
                ListViewDataItem parentItem = (ListViewDataItem)ddl.Parent;
                Label lblPrice = (Label)parentItem.FindControl("lblPrice");
                //string itemCode = (parentItem.DataItem as StationeryCatalogue).ItemCode;
                var hfItemCode = (HiddenField)parentItem.FindControl("hfItemCode");
                string itemCode = hfItemCode.Value;
                string supplierCode = ddl.SelectedValue;
                lblPrice.Text = scController.GetSupplierItemPrice(supplierCode, itemCode).ToString();
                var txtOrderQty = (TextBox)parentItem.FindControl("txtOrderQuantity");
                var lblAmount = (Label)parentItem.FindControl("lblAmount");
                lblAmount.Text = GetAmount(txtOrderQty.Text, lblPrice.Text).ToString();
            }
        }

        protected void listItems_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var purchaseItem = (PurchaseItem)e.Item.DataItem;
            var item = (StationeryCatalogue)purchaseItem.Stationery;

            var lblSN = (Label)e.Item.FindControl("lblSN");
            lblSN.Text = (e.Item.DataItemIndex + 1).ToString();

            var ddl = (DropDownList)e.Item.FindControl("ddlSuppliers");
            ddl.Items.Clear();
            ddl.Items.Add(new ListItem(scController.GetSupplierName(item.Supplier1), item.Supplier1));
            ddl.Items.Add(new ListItem(scController.GetSupplierName(item.Supplier2), item.Supplier2));
            ddl.Items.Add(new ListItem(scController.GetSupplierName(item.Supplier3), item.Supplier3));

            var lblPrice = (Label)e.Item.FindControl("lblPrice");
            lblPrice.Text = scController.GetSupplierItemPrice(purchaseItem.SupplierCode, item.ItemCode).ToString();

            var lblAmount = (Label)e.Item.FindControl("lblAmount");
            var txtOrderQty = (TextBox)e.Item.FindControl("txtOrderQuantity");
            decimal amount = GetAmount(txtOrderQty.Text, lblPrice.Text);
            lblAmount.Text = amount.ToString();

            var validOrderQuantity = (CustomValidator)e.Item.FindControl("validOrderQuantity");
            validOrderQuantity.ErrorMessage = "Order quantity cannot be less than " + item.ReorderQuantity;

            if ((e.Item.ItemType == ListViewItemType.InsertItem))
            {
                var ddlCat = (DropDownList)e.Item.FindControl("ddlAddCategory");
                ddlCat.DataSource = scController.GetCategories();
                ddlCat.DataBind();
            }
        }

        private decimal GetAmount(string orderQty, string price)
        {
            return int.Parse(orderQty) * decimal.Parse(price);
        }

        protected void listItems_PreRender(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //{
            //    listItems.DataSource = (List<PurchaseItem>)Session["purchaseItems"];
            //    listItems.DataBind();
            //}

            var lblGrandTotal = (Label)listItems.FindControl("lblGrandTotal");
            decimal total = 0;
            foreach (ListViewDataItem item in listItems.Items)
            {
                var lblAmount = (Label)item.FindControl("lblAmount");
                total += decimal.Parse(lblAmount.Text);
            }
            //var lblInsertAmount = (Label)listItems.InsertItem.FindControl("lblAmount");
            //total+= decimal.Parse(lblInsertAmount.Text);
            //lblGrandTotal.Text = total.ToString();
            
        }

        protected void txtOrderQuantity_TextChanged(object sender, EventArgs e)
        {
            if (sender is TextBox)
            {
                TextBox txt = (TextBox)sender;
                ListViewDataItem parentItem = (ListViewDataItem)txt.Parent;
                //HiddenField hfOrderQtyIsValid = (HiddenField)parentItem.FindControl("hfOrderQtyIsValid");
                //if (hfOrderQtyIsValid.Value.Equals("true"))
                //{
                Label lblPrice = (Label)parentItem.FindControl("lblPrice");
                var txtOrderQty = (TextBox)parentItem.FindControl("txtOrderQuantity");
                var lblAmount = (Label)parentItem.FindControl("lblAmount");
                lblAmount.Text = GetAmount(txtOrderQty.Text, lblPrice.Text).ToString();
                //} 
            }
        }

        protected void validOrderQuantity_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (source is CustomValidator)
            {
                CustomValidator validator = (CustomValidator)source;
                ListViewDataItem parentItem = (ListViewDataItem)validator.Parent;
                //int? minReorderQty = (parentItem.DataItem as StationeryCatalogue).ReorderQuantity;
                var hfReorderQty = (HiddenField)parentItem.FindControl("hfReorderQty");
                int minReorderQty = int.Parse(hfReorderQty.Value);
                int num = int.Parse(args.Value);
                args.IsValid = num >= minReorderQty;
                var txtOrderQuantity = (TextBox)parentItem.FindControl("txtOrderQuantity");
                if (!args.IsValid)
                {
                    txtOrderQuantity.CssClass = "control error";
                }
                else
                {
                    txtOrderQuantity.CssClass = "control";
                }
            }
        }

        protected void ddlAddSuppliers_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlAddSuppliers = (DropDownList)listItems.InsertItem.FindControl("ddlAddSuppliers"); ;
            HiddenField hfItemCode = (HiddenField)listItems.InsertItem.FindControl("hfItemCode");
            TextBox txtAddOrderQuantity = (TextBox)listItems.InsertItem.FindControl("txtAddOrderQuantity");

            Label lblPrice = (Label)listItems.InsertItem.FindControl("lblPrice");
            lblPrice.Text = scController.GetSupplierItemPrice(ddlAddSuppliers.SelectedValue, hfItemCode.Value).ToString();
            Label lblAmount = (Label)listItems.InsertItem.FindControl("lblAmount");
            lblAmount.Text = GetAmount(txtAddOrderQuantity.Text, lblPrice.Text).ToString();
        }

        protected void listItems_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            ListViewItem item = e.Item;
            var hfItemCode = (HiddenField)item.FindControl("hfItemCode");
            string itemCode = hfItemCode.Value;
            StationeryCatalogue stationery = scController.GetStationeryByItemCode(itemCode);
            var ddlAddSuppliers = (DropDownList)item.FindControl("ddlAddSuppliers");
            string supplierCode = ddlAddSuppliers.SelectedValue;
            Supplier supplier = scController.GetSupplier(supplierCode);
            var txtAddOrderQuantity = (TextBox)item.FindControl("txtAddOrderQuantity");
            string orderQuantity = txtAddOrderQuantity.Text;
            if (stationery == null || supplier == null || orderQuantity == "")
            {
                return;
            }
            var purchaseItems = (List<PurchaseItem>)Session["purchaseItems"];
            PurchaseItem pi = new PurchaseItem();
            pi.Stationery = stationery;
            pi.SupplierCode = supplier.SupplierCode;
            pi.OrderQuantity = int.Parse(orderQuantity);
            purchaseItems.Add(pi);
            Session["purchaseItems"] = purchaseItems;
            listItems.DataSource = (List<PurchaseItem>)Session["purchaseItems"];
            listItems.DataBind();

        }
        
        

        protected void validAddOrderQuantity_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (source is CustomValidator)
            {
                CustomValidator validator = (CustomValidator)source;
                ListViewItem parentItem = (ListViewItem)validator.Parent;
                var hfReorderQty = (HiddenField)parentItem.FindControl("hfReorderQty");
                int minReorderQty = int.Parse(hfReorderQty.Value);
                int num = int.Parse(args.Value);
                args.IsValid = num >= minReorderQty;
                var txtAddOrderQuantity = (TextBox)parentItem.FindControl("txtAddOrderQuantity");
                if (!args.IsValid)
                {
                    txtAddOrderQuantity.CssClass = "control error";
                }
                else
                {
                    txtAddOrderQuantity.CssClass = "control";
                }
                
                validator.ErrorMessage = "Order quantity cannot be less than " + minReorderQty;
            }
        }

        protected void txtAddOrderQuantity_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ddlAddCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlCat = (DropDownList)listItems.InsertItem.FindControl("ddlAddCategory"); ;
            DropDownList ddlDescription = (DropDownList)listItems.InsertItem.FindControl("ddlAddDescription");
            string categoryCode = ddlCat.SelectedValue;
            List<String> descriptionList = scController.GetProductListByCat(categoryCode);
            var productList = new List<String>();
            var purchaseItems = (List<PurchaseItem>)Session["purchaseItems"];
            if (purchaseItems != null)
            {
                foreach (String description in descriptionList)
                {
                    bool isInPurchaseItem = false;
                    foreach (PurchaseItem pi in purchaseItems)
                    {
                        if (pi.Stationery.Description == description)
                        {
                            isInPurchaseItem = true;
                            break;
                        }                       
                    }
                    if (!isInPurchaseItem)
                    {
                        productList.Add(description);
                    }
                }
            }
            ddlDescription.DataSource = productList;
            ddlDescription.DataBind();
            ddlAddDescription_SelectedIndexChanged(sender, e);
        }


        protected void ddlAddDescription_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlDescription = (DropDownList)listItems.InsertItem.FindControl("ddlAddDescription"); ;
            string description = ddlDescription.SelectedValue;
            StationeryCatalogue s = scController.GetStationeryByDescription(description);
            HiddenField hfItemCode = (HiddenField)listItems.InsertItem.FindControl("hfItemCode");
            hfItemCode.Value = s.ItemCode;
            HiddenField hfReorderQty = (HiddenField)listItems.InsertItem.FindControl("hfReorderQty");
            hfReorderQty.Value = s.ReorderQuantity.ToString();
            Label lblReorderLevel = (Label)listItems.InsertItem.FindControl("lblReorderLevel");
            lblReorderLevel.Text = s.ReorderLevel.ToString();
            Label lblStock = (Label)listItems.InsertItem.FindControl("lblStock");
            lblStock.Text = s.Stock.ToString();
            Label lblMeasureUnitStock = (Label)listItems.InsertItem.FindControl("lblMeasureUnitStock");
            lblMeasureUnitStock.Text = s.MeasureUnit;
            TextBox txtAddOrderQuantity = (TextBox)listItems.InsertItem.FindControl("txtAddOrderQuantity");
            txtAddOrderQuantity.Text = s.ReorderQuantity.ToString();

            DropDownList ddlAddSuppliers = (DropDownList)listItems.InsertItem.FindControl("ddlAddSuppliers");
            ddlAddSuppliers.Items.Clear();
            ddlAddSuppliers.Items.Add(new ListItem(scController.GetSupplierName(s.Supplier1), s.Supplier1));
            ddlAddSuppliers.Items.Add(new ListItem(scController.GetSupplierName(s.Supplier2), s.Supplier2));
            ddlAddSuppliers.Items.Add(new ListItem(scController.GetSupplierName(s.Supplier3), s.Supplier3));
            ddlAddSuppliers_SelectedIndexChanged(sender, e);
            
        }

       

        protected void listItems_DataBound(object sender, EventArgs e)
        {
            DropDownList ddlCat = (DropDownList)listItems.InsertItem.FindControl("ddlAddCategory");
            List<String> categories = scController.GetCategories();
            string defaultCatValue = "-- Select a category --";
            categories.Insert(0, defaultCatValue);

            ddlCat.DataSource = categories;
            ddlCat.DataBind();

            if (!IsPostBack)
            {
                ddlCat.SelectedValue = defaultCatValue;
            }
        }

        protected void linkViewRequest_Command(object sender, CommandEventArgs e)
        {
            LinkButton linkViewRequest = (LinkButton)sender;
            ListViewDataItem listItem = (ListViewDataItem)linkViewRequest.Parent;
            ListView listRequests = (ListView)listItem.FindControl("listRequests");
            LinkButton linkHideRequest = (LinkButton)listItem.FindControl("linkHideRequest");
            HiddenField hfItemCode = (HiddenField)listItem.FindControl("hfItemCode");
            string itemCode = hfItemCode.Value;

            listRequests.Visible = true;
            listRequests.DataSource = scController.GetRequestDetailsByItemCode(itemCode);
            listRequests.DataBind();
            linkViewRequest.Visible = false;
            linkHideRequest.Visible = true;
        }

        protected void linkHideRequest_Command(object sender, CommandEventArgs e)
        {
            LinkButton linkHideRequest = (LinkButton)sender;
            ListViewDataItem listItem = (ListViewDataItem)linkHideRequest.Parent;            
            ListView listRequests = (ListView)listItem.FindControl("listRequests");
            LinkButton linkViewRequest = (LinkButton)listItem.FindControl("linkViewRequest");
            listRequests.Visible = false;
            linkViewRequest.Visible = true;
            linkHideRequest.Visible = false;
        }

        protected void linkHidePO_Command(object sender, CommandEventArgs e)
        {

        }

        protected void linkPageDetail_Command(object sender, CommandEventArgs e)
        {
            string strUrl = "/PurchaseOrderDetail?PO=" + e.CommandArgument;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + strUrl + "','_blank')", true);
        }

        protected void linkViewPO_Command(object sender, CommandEventArgs e)
        {

        }
    }


}

