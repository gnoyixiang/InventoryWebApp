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

namespace InventoryWebApp.Store
{
    public partial class CreateNewOrder : System.Web.UI.Page
    {
        StoreClerkController scController = new StoreClerkController();
        EmailController emailController = new EmailController();        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPurchaseItems();
                BindData();
                RefreshCategory();
            }

        }

        protected void LoadPurchaseItems()
        {
            List<StationeryCatalogue> stationeries = scController.GetStationeriesBelowReorderLevel();
            List<PurchaseItem> purchaseItems = new List<PurchaseItem>();
            if (Session["purchaseItems"] != null)
            {
                purchaseItems = (List<PurchaseItem>)Session["purchaseItems"];
            }
            else
            {
                foreach (StationeryCatalogue s in stationeries)
                {
                    int existingOrdersQty = scController.SumOfItemQtyInPendingAndApprovedOrders(s.ItemCode);
                    if (s.Stock + existingOrdersQty <= s.ReorderLevel)
                    {
                        PurchaseItem p = new PurchaseItem();
                        p.Stationery = s;
                        p.SupplierCode = s.Supplier1;
                        p.OrderQuantity = s.ReorderQuantity;
                        purchaseItems.Add(p);
                    }
                }
            }

            Session["purchaseItems"] = purchaseItems;
        }

        private void RefreshCategory()
        {
            List<String> categories = scController.GetCategories();
            string defaultCatValue = "-- Select a category --";
            categories.Insert(0, defaultCatValue);

            ddlAddCategory.DataSource = categories;
            ddlAddCategory.DataBind();

            ddlAddCategory.SelectedValue = defaultCatValue;

            ddlAddDescription.Enabled = false;
            ddlAddDescription.Items.Clear();
            hfAddItemCode.Value = "";
            hfAddReorderQty.Value = "";
            lblAddReorderLevel.Text = "";
            lblAddStock.Text = "";
            lblAddMeasureUnitStock.Text = "";
            txtAddOrderQuantity.Text = "";
            txtAddOrderQuantity.Enabled = false;
            txtAddOrderQuantity.CssClass = "control";
            lblAddPrice.Text = "";
            lblAddAmount.Text = "";
            btnAddItem.Enabled = false;
            ddlAddSuppliers.Enabled = false;
            ddlAddSuppliers.Items.Clear();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            var purchaseItems = (List<PurchaseItem>)Session["purchaseItems"];
            if (purchaseItems.Count == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "alertMessage", "alert('You have not added any items to order!')", true);
                return;
            }
            try
            {
                List<PurchaseOrder> poList = scController.CreatePurchaseOrders(purchaseItems, Context.User.Identity.Name);
                Session["CreatedPO"] = true;

                //send email
                string fromEmail = Util.EMAIL;                
                string password = Util.PASSWORD;
                string username = Context.User.Identity.Name;
                try
                {
                    emailController.CreatePurchaseOrdersSendEmail(fromEmail, password, username, poList);
                    Session["SendCreatePOEmail"] = true;
                }
                catch(Exception ex)
                {
                    Session["SendCreatePOEmail"] = false;                    
                }
            }
            catch (Exception ex)
            {
                Session["CreatedPO"] = false;                
            }

            Session["purchaseItems"] = null;
            Response.Redirect("/Store/ViewPurchaseOrders");

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["purchaseItems"] = null;
            Response.Redirect("/Store/ViewPurchaseOrders");
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

                var purchaseItems = (List<PurchaseItem>)Session["purchaseItems"];
                if (purchaseItems != null)
                {
                    purchaseItems[parentItem.DataItemIndex].SupplierCode = supplierCode;
                }
                Session["purchaseItems"] = purchaseItems;
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

            var lblRecommendQty = (Label)e.Item.FindControl("lblRecommendQty");
            int recommendQty = scController.RecommendReorderQty(item.ItemCode);
            lblRecommendQty.Text = recommendQty.ToString();

            var lblModalRecommendQty = (Label)e.Item.FindControl("lblModalRecommendQty");
            lblModalRecommendQty.Text = recommendQty.ToString();

            //var listRequests = (ListView)e.Item.FindControl("listRequests");
            //listRequests.DataSource = scController.ListIncompleteOrProcessingRequestsDetails(item.ItemCode);
            //listRequests.DataBind();

            //var listOrders = (ListView)e.Item.FindControl("listOrders");
            //listOrders.DataSource = scController.ListPendingAndApprovedOrderDetails(item.ItemCode);
            //listOrders.DataBind();


        }

        private decimal GetAmount(string orderQty, string price)
        {
            return int.Parse(orderQty) * decimal.Parse(price);
        }

        private decimal? GetAmount(int orderQty, decimal? price)
        {
            return orderQty * price;
        }

        protected void listItems_PreRender(object sender, EventArgs e)
        {
            var lblGrandTotal = (Label)listItems.FindControl("lblGrandTotal");
            if (lblGrandTotal != null)
            {
                decimal total = 0;
                foreach (ListViewDataItem item in listItems.Items)
                {
                    var lblAmount = (Label)item.FindControl("lblAmount");
                    total += decimal.Parse(lblAmount.Text);
                }
                lblGrandTotal.Text = total.ToString();
            }

        }

        protected void txtOrderQuantity_TextChanged(object sender, EventArgs e)
        {
            Validate();
            if (sender is TextBox)
            {
                TextBox txt = (TextBox)sender;

                ListViewDataItem parentItem = (ListViewDataItem)txt.Parent;
                int quantity = Convert.ToInt32(txt.Text);

                var purchaseItems = (List<PurchaseItem>)Session["purchaseItems"];
                if (purchaseItems != null)
                {
                    purchaseItems[parentItem.DataItemIndex].OrderQuantity = quantity;
                }
                Session["purchaseItems"] = purchaseItems;


                Label lblPrice = (Label)parentItem.FindControl("lblPrice");
                var txtOrderQty = (TextBox)parentItem.FindControl("txtOrderQuantity");
                var lblAmount = (Label)parentItem.FindControl("lblAmount");
                lblAmount.Text = GetAmount(txtOrderQty.Text, lblPrice.Text).ToString();
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

                validator.ErrorMessage = "Order quantity cannot be less than " + minReorderQty;
            }
        }

        protected void ddlAddSuppliers_SelectedIndexChanged(object sender, EventArgs e)
        {
            decimal? price = scController.GetSupplierItemPrice(ddlAddSuppliers.SelectedValue, hfAddItemCode.Value);
            lblAddPrice.Text = String.Format("{0:c}", price);
            int orderQty = int.Parse(txtAddOrderQuantity.Text);
            decimal? amount = GetAmount(orderQty, price);
            lblAddAmount.Text = String.Format("{0:c}", amount);
        }

        protected void validAddOrderQuantity_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (source is CustomValidator)
            {
                CustomValidator validator = (CustomValidator)source;
                //ListViewItem parentItem = (ListViewItem)validator.Parent;
                //var hfReorderQty = (HiddenField)parentItem.FindControl("hfReorderQty");
                int minReorderQty = int.Parse(hfAddReorderQty.Value);
                int num = int.Parse(args.Value);
                args.IsValid = num >= minReorderQty;
                //var txtAddOrderQuantity = (TextBox)parentItem.FindControl("txtAddOrderQuantity");
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
            Validate();
        }

        protected void ddlAddCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<String> productList = new List<String>();
            if (ddlAddCategory.SelectedIndex != 0)
            {

                string categoryCode = ddlAddCategory.SelectedValue;
                List<String> descriptionList = scController.GetProductListByCat(categoryCode);

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

                if (productList.Count == 0)
                {
                    lblNoItems.Visible = true;
                    ddlAddDescription.Enabled = false;
                }
                else
                {
                    lblNoItems.Visible = false;
                    ddlAddDescription.Enabled = true;
                }
            }
            else
            {
                lblNoItems.Visible = false;
            }

            ddlAddDescription.DataSource = productList;
            ddlAddDescription.DataBind();
            ddlAddDescription_SelectedIndexChanged(sender, e);
        }



        protected void ddlAddDescription_SelectedIndexChanged(object sender, EventArgs e)
        {
            string description = ddlAddDescription.SelectedValue;
            ddlAddSuppliers.Items.Clear();
            if (description == "")
            {
                hfAddItemCode.Value = "";
                hfAddReorderQty.Value = "";
                lblAddReorderLevel.Text = "";
                lblAddStock.Text = "";
                lblAddMeasureUnitStock.Text = "";
                txtAddOrderQuantity.Text = "";
                txtAddOrderQuantity.Enabled = false;
                txtAddOrderQuantity.CssClass = "control";
                lblAddPrice.Text = "";
                lblAddAmount.Text = "";
                btnAddItem.Enabled = false;
                ddlAddSuppliers.Enabled = false;

            }
            else
            {
                StationeryCatalogue s = scController.GetStationeryByDescription(description);
                hfAddItemCode.Value = s.ItemCode;
                hfAddReorderQty.Value = s.ReorderQuantity.ToString();
                lblAddReorderLevel.Text = s.ReorderLevel.ToString();
                lblAddStock.Text = s.Stock.ToString();
                lblAddMeasureUnitStock.Text = lblAddMeasureUnitReorderLevel.Text = lblAddMeasureUnitQty.Text = s.MeasureUnit;
                txtAddOrderQuantity.Text = s.ReorderQuantity.ToString();
                txtAddOrderQuantity.Enabled = true;
                txtAddOrderQuantity.CssClass = "control";
                btnAddItem.Enabled = true;
                ddlAddSuppliers.Enabled = true;

                ddlAddSuppliers.Items.Add(new ListItem(scController.GetSupplierName(s.Supplier1), s.Supplier1));
                ddlAddSuppliers.Items.Add(new ListItem(scController.GetSupplierName(s.Supplier2), s.Supplier2));
                ddlAddSuppliers.Items.Add(new ListItem(scController.GetSupplierName(s.Supplier3), s.Supplier3));
                ddlAddSuppliers_SelectedIndexChanged(sender, e);
            }

        }


        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                Validate();
                return;
            }
            string itemCode = hfAddItemCode.Value;
            StationeryCatalogue stationery = scController.GetStationeryByItemCode(itemCode);
            string supplierCode = ddlAddSuppliers.SelectedValue;
            Supplier supplier = scController.GetSupplier(supplierCode);
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

            BindData();

            RefreshCategory();
        }

        protected void listItems_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            var purchaseItems = (List<PurchaseItem>)Session["purchaseItems"];
            if (purchaseItems != null)
            {
                PurchaseItem deleteItem = purchaseItems[e.ItemIndex];
                purchaseItems.Remove(deleteItem);
                Session["purchaseItems"] = purchaseItems;
                BindData();
            }
        }

        private void BindData()
        {
            var purchaseItems = (List<PurchaseItem>)Session["purchaseItems"];
            if (purchaseItems != null)
            {
                listItems.Visible = true;
                btnSubmit.Enabled = true;
                btnCancel.Enabled = true;
                listItems.DataSource = purchaseItems;
                listItems.DataBind();
                if (IsPostBack)
                {
                    Validate();
                }
            }
            else
            {
                listItems.Visible = false;
                btnSubmit.Enabled = false;
                btnCancel.Enabled = false;
            }
        }

        protected void txtNotes_TextChanged(object sender, EventArgs e)
        {
            Validate();
            if (sender is TextBox)
            {
                TextBox t = (TextBox)sender;
                ListViewDataItem item = (ListViewDataItem)t.Parent;
                string notes = t.Text;
                var purchaseItems = (List<PurchaseItem>)Session["purchaseItems"];
                if (purchaseItems != null)
                {
                    purchaseItems[item.DataItemIndex].Notes = notes;
                }
                Session["purchaseItems"] = purchaseItems;

            }
        }


        protected void listRequests_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var requestDetail = (RequestDetail)e.Item.DataItem;
            var stationery = scController.GetStationeryByItemCode(requestDetail.ItemCode);
            int qtyRequiredForRequestDetail = Convert.ToInt32(requestDetail.RemainingQuant);
            Request request = scController.GetRequest(requestDetail.RequestCode);
            List<DisbursementDetail> dDetails = scController.ListDisbursingDDetails(request, stationery);
            int disbursingQty = scController.SumOfDisbursingQty(dDetails);
            qtyRequiredForRequestDetail -= disbursingQty;

            var lblRemainingQty = (Label)e.Item.FindControl("lblRemainingQty");
            lblRemainingQty.Text = Convert.ToString(requestDetail.RemainingQuant);

            var lblDisbursingOrAllocating = (Label)e.Item.FindControl("lblDisbursingOrAllocating");
            lblDisbursingOrAllocating.Text = disbursingQty.ToString();

            var lblRequiredQty = (Label)e.Item.FindControl("lblRequiredQty");
            lblRequiredQty.Text = qtyRequiredForRequestDetail.ToString();

            var listRequests = (ListView)e.Item.Parent.Parent;
            var lblTotalRemainingQty = (Label)listRequests.FindControl("lblTotalRemainingQty");
            lblTotalRemainingQty.Text = Convert.ToString(Convert.ToInt32(lblTotalRemainingQty.Text) + requestDetail.RemainingQuant);
            var lblTotalDisbursingOrAllocating = (Label)listRequests.FindControl("lblTotalDisbursingOrAllocating");
            lblTotalDisbursingOrAllocating.Text = Convert.ToString(Convert.ToInt32(lblTotalDisbursingOrAllocating.Text) + disbursingQty);
            var lblTotalRequiredQty = (Label)listRequests.FindControl("lblTotalRequiredQty");
            lblTotalRequiredQty.Text = Convert.ToString(Convert.ToInt32(lblTotalRequiredQty.Text) + qtyRequiredForRequestDetail);

            //var listDisbursements = (ListView)e.Item.FindControl("listDisbursements");
            //listDisbursements.DataSource = dDetails;
            //listDisbursements.DataBind();
        }

        protected void linkBreakdown_Command(object sender, CommandEventArgs e)
        {
            var linkBreakdown = (LinkButton)sender;
            var listViewDataItem = (ListViewDataItem)linkBreakdown.Parent;
            var item = scController.GetStationeryByItemCode((string)e.CommandArgument);

            var listRequests = (ListView)listViewDataItem.FindControl("listRequests");
            listRequests.DataSource = null;
            listRequests.DataBind();

            var panelNoRequests = (Panel)listViewDataItem.FindControl("panelNoRequests");
            if (scController.ListIncompleteOrProcessingRequestsDetails(item.ItemCode).Count > 0)
            {

                panelNoRequests.Visible = false;
                listRequests.Visible = true;
                listRequests.DataSource = scController.ListIncompleteOrProcessingRequestsDetails(item.ItemCode);
                listRequests.DataBind();
            }
            else
            {
                panelNoRequests.Visible = true;
                listRequests.Visible = false;
            }


            var listOrders = (ListView)listViewDataItem.FindControl("listOrders");
            listOrders.DataSource = null;
            listOrders.DataBind();

            var panelNoOrders = (Panel)listViewDataItem.FindControl("panelNoOrders");
            if (scController.ListPendingAndApprovedOrderDetails(item.ItemCode).Count > 0)
            {
                panelNoOrders.Visible = false;
                listOrders.Visible = true;
                listOrders.DataSource = scController.ListPendingAndApprovedOrderDetails(item.ItemCode);
                listOrders.DataBind();
            }
            else
            {
                panelNoOrders.Visible = true;
                listOrders.Visible = false;
            }

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#modalBreakdown" + item.ItemCode + "').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", sb.ToString(), false);
        }

        protected void listOrders_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var poDetail = (PODetail)e.Item.DataItem;
            var purchaseOrder = scController.GetPurchaseOrderByCode(poDetail.PurchaseOrderCode);

            List<PODetail> poDetails = scController.ListPendingAndApprovedOrderDetails(poDetail.ItemCode);

            var lblOrderStatus = (Label)e.Item.FindControl("lblOrderStatus");
            lblOrderStatus.Text = purchaseOrder.Status;

            var lblDate = (Label)e.Item.FindControl("lblDate");
            lblDate.Text = purchaseOrder.Status.ToUpper() == "PENDING" ?
                Convert.ToDateTime(purchaseOrder.DateCreated).ToString("dd MMM yyyy")
                : Convert.ToDateTime(purchaseOrder.DateApproved).ToString("dd MMM yyyy");

            var listOrders = (ListView)e.Item.Parent.Parent;
            var lblTotalOrderQty = (Label)listOrders.FindControl("lblTotalOrderQty");
            int totalOrderQty = Convert.ToInt32(lblTotalOrderQty.Text != "" ? lblTotalOrderQty.Text : "0");
            lblTotalOrderQty.Text = Convert.ToString(Convert.ToInt32(totalOrderQty) + Convert.ToInt32(poDetail.Quantity));
        }
    }


}

