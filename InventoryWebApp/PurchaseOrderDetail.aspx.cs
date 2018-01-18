using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class PurchaseOrderDetail : System.Web.UI.Page
    {
        StoreClerkController scController = new StoreClerkController();

        string poNum;
        PurchaseOrder po;
        List<PODetail> poDetails;
        decimal? grandTotal;
        EntityModel em;

        protected void Page_Load(object sender, EventArgs e)
        {
            em = new EntityModel();
            poNum = Request.QueryString["PO"];
            po = scController.GetPurchaseOrderByCode(poNum);
            if (po != null)
            {
                poDetails = scController.GetPODetailsByPOCode(po.PurchaseOrderCode);
            }


            if (!IsPostBack)
            {
                if (poDetails != null)
                {
                    BindData();
                    
                }
                else
                {
                    listDetails.Visible = false;
                    panelDetails.Visible = true;
                }
            }
        }

        protected bool IsEditable()
        {
            return scController.IsPurchaseOrderEditable(po);
        }

        protected string GetAmount(object quantity, object price)
        {
            double amount = 0;
            if (quantity != null && price != null)
            {
                amount = double.Parse(quantity.ToString()) * double.Parse(price.ToString());
            }
            return String.Format("{0:0.00}", amount);
        }

        protected string GetGrandTotal()
        { 
            grandTotal = 0;
            foreach(PODetail pod in scController.GetPODetailsByPOCode(po.PurchaseOrderCode))
            {
                if (pod.Quantity != null && pod.Price != null)
                {
                    grandTotal += pod.Quantity * pod.Price;
                }
            }
            return String.Format("{0:0.00}", grandTotal);
        }

        protected string GetItemDescription(object itemCode)
        {
            if (itemCode == null) return "";
            return scController.GetItemDescription(itemCode.ToString());
        }


        protected override void OnPreRenderComplete(EventArgs e)
        {            
            base.OnPreRenderComplete(e);

            if (po == null)
            {
                panelError.Visible = true;
                panelDetails.Visible = false;
                return;
            }
            
            lblOrderID.Text = po.PurchaseOrderCode;
            lblStatus.Text = "Status: " + po.Status;
            lblSupplierName.Text = scController.GetSupplierName(po.SupplierCode);
            lblDeliverAddress.Text = "";
            lblAttnTo.Text = po.UserName;
            lblEstDeliverDate.Text = po.DateSupplyExpected == null ? "Not Approved" : String.Format("{0:dd MMM yyyy}", po.DateSupplyExpected);
            lblOrderDate.Text = String.Format("{0:dd MMM yyyy}", po.DateCreated);
            lblApprovedDate.Text = po.DateApproved == null ? "Not Approved" : String.Format("{0:dd MMM yyyy}", po.DateApproved);
            lblReceivedDate.Text = po.DateReceived == null ? "Not Recieved" : String.Format("{0:dd MMM yyyy}", po.DateReceived);
            lblOrderBy.Text = po.UserName;
            lblApprovedBy.Text = po.ApprovedBy;
            lblReceivedBy.Text = po.ReceivedBy;
            lblNotes.Value = po.Notes;

            Label lblGrandTotal = (Label)listDetails.FindControl("lblGrandTotal");
            lblGrandTotal.Text = GetGrandTotal();

            switch (po.Status)
            {
                case "PENDING":
                    lblStatus.ForeColor = System.Drawing.Color.Gray;
                    btnAckReceipt.Visible = false;
                    btnCancelOrder.Visible = true;
                    linkEdit.Visible = true;
                    break;
                case "APPROVED":
                    lblStatus.ForeColor = System.Drawing.Color.Blue;
                    btnAckReceipt.Visible = true;
                    btnCancelOrder.Visible = true;
                    linkEdit.Visible = false;
                    break;
                case "RECEIVED":
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                    btnAckReceipt.Visible = false;
                    btnCancelOrder.Visible = false;
                    linkEdit.Visible = false;
                    break;
                case "REJECTED":
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    btnAckReceipt.Visible = false;
                    btnCancelOrder.Visible = false;
                    linkEdit.Visible = false;
                    break;
                case "CANCELLED":
                    lblStatus.ForeColor = System.Drawing.Color.OrangeRed;
                    btnAckReceipt.Visible = false;
                    btnCancelOrder.Visible = false;
                    linkEdit.Visible = false;
                    break;
            }



        }

        protected void btnAckReceipt_Click(object sender, EventArgs e)
        {
            int isAck = scController.AckPurchaseOrder(po, poDetails);
            if (isAck == -1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", 
                    "alert('Error acknowledging order!')", true);
            }
            else if (isAck == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('No order was acknowledged!')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('Order has been acknowledged!')", true);
            }
        }

        protected void btnCancelOrder_Click(object sender, EventArgs e)
        {
            if (scController.CancelPurchaseOrder(po) != 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('Error cancelling order!')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage", "alert('Order has been cancelled!')", true);

            }
        }
        
       

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            //Response.Redirect("/EditPurchaseOrder?PO=" + poNum);
            scController.ApprovePurchaseOrder(po);
        }
        

        protected void listDetails_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            if (!IsPurchaseOrderingEditing(po))
            {
                //scController.EditingPurchaseOrder(po);
                listDetails.EditIndex = e.NewEditIndex;
                BindData();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, 
                    this.GetType(), "alertMessage", 
                    "alert('Invalid request! Purchase Order is being edited by another user!')", true);
            }
        }

        protected void listDetails_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            listDetails.EditIndex = -1;
            BindData();
        }

        protected void listDetails_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            
            PODetail poDetail = poDetails[e.ItemIndex];
            poDetail.Quantity = Convert.ToInt32(e.NewValues["Quantity"]);
            scController.UpdatePODetail(poDetail);
            scController.FinishEditingPurchaseOrder(po);
            listDetails.EditIndex = -1;
            BindData();
        }


        protected void validOrderQuantity_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (source is CustomValidator && IsPostBack)
            {
                CustomValidator validator = (CustomValidator)source;
                ListViewItem parentItem = (ListViewItem)validator.Parent;
                string itemCode = listDetails.DataKeys[listDetails.EditIndex].Value.ToString();
                int? minReorderQty = scController.GetStationeryReorderQty(itemCode);
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

        protected void listDetails_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            scController.FinishEditingPurchaseOrder(po);
            listDetails.EditIndex = -1;
            BindData();
        }

        protected void listDetails_PreRender(object sender, EventArgs e)
        {

        }

        private void BindData()
        {
            if (poDetails != null)
            {
                listDetails.DataSource = poDetails;
                listDetails.DataBind();
            }
        }

        private bool IsPurchaseOrderingEditing(PurchaseOrder po)
        {
            if (po.Status == "EDITING") return true;
            return false;
        }

        private bool IsPurchaseOrderUpdater()
        {
            if (Session["USER"].ToString() == po.LastUpdatedBy)
                return true;
            return false;
        }

    }
}