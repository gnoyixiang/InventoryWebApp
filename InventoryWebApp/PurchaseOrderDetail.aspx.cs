using InventoryWebApp.Models.Entities;
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
        string poNum;
        PurchaseOrder po;
        decimal? grandTotal;
        EntityModel em;

        protected void Page_Load(object sender, EventArgs e)
        {
            em = new EntityModel();

            poNum = Request.QueryString["PO"];
            
            po = getPurchaseOrderByCode(poNum);
        }

        protected string getItemDescription(string itemCode)
        {
            
            return em.StationeryCatalogues.Where(s => s.ItemCode == itemCode).Select(s => s.Description).FirstOrDefault<String>();
        }

        protected string getAmount(string quantity, string price)
        {
            double amount = double.Parse(quantity) * double.Parse(price);
            return String.Format("{0:0.00}", amount);
        }

        protected string getGrandTotal()
        {
            grandTotal = 0;
            foreach(PODetail pod in po.PODetails)
            {
                grandTotal += pod.Quantity * pod.Price;
            }
            return String.Format("{0:0.00}", grandTotal);
        }

        private PurchaseOrder getPurchaseOrderByCode(string poNum)
        {
            return em.PurchaseOrders.Where(p=>p.PurchaseOrderCode==poNum).FirstOrDefault<PurchaseOrder>();
        }

        private string getSupplierName(string supplierCode)
        {
            return getSupplier(supplierCode).SupplierName;
        }

        private Supplier getSupplier(string supplierCode)
        {
            return em.Suppliers.Where(s => s.SupplierCode.Equals(supplierCode)).FirstOrDefault<Supplier>();
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);
            if (po == null)
            {
                panelDetails.Visible = false;
                panelError.Visible = true;
                return;
            }
            lblOrderID.Text = po.PurchaseOrderCode;
            lblStatus.Text = "Status: " + po.Status;
            lblSupplierName.Text = getSupplierName(po.SupplierCode);
            lblDeliverAddress.Text = "";
            lblAttnTo.Text = po.Username;
            lblEstDeliverDate.Text = po.DateSupplyExpected == null ? "Not Approved" : String.Format("{0:dd MMM yyyy}", po.DateSupplyExpected);
            lblOrderDate.Text = String.Format("{0:dd MMM yyyy}", po.DateCreated);
            lblApprovedDate.Text = po.DateApproved == null ? "Not Approved" : String.Format("{0:dd MMM yyyy}", po.DateApproved);
            lblReceivedDate.Text = po.DateReceived == null ? "Not Recieved" : String.Format("{0:dd MMM yyyy}", po.DateReceived);
            lblOrderBy.Text = po.Username;
            lblApprovedBy.Text = po.ApprovedBy;
            lblReceivedBy.Text = po.ReceivedBy;
            lblNotes.Value = po.Notes;

            listDetails.DataSource = po.PODetails;
            listDetails.DataBind();
            Label lblGrandTotal = (Label)listDetails.FindControl("lblGrandTotal");
            lblGrandTotal.Text = getGrandTotal();

            switch (po.Status)
            {
                case "PENDING":
                    lblStatus.ForeColor = System.Drawing.Color.Gray;
                    btnAckReceipt.Visible = false;
                    break;
                case "APPROVED":
                    lblStatus.ForeColor = System.Drawing.Color.Blue;
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
            if (AckPurchaseOrder(po) != 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error acknowledging order!')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order has been acknowledged!')", true);

            }
        }

        protected void btnCancelOrder_Click(object sender, EventArgs e)
        {
            if (CancelPurchaseOrder(po) != 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error cancelling order!')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order has been cancelled!')", true);

            }
        }
        
        private int CancelPurchaseOrder(PurchaseOrder po)
        {
            po.Status = "CANCELLED";
            int changes = 0;
            em.Entry(po).State = System.Data.Entity.EntityState.Modified;
            changes = em.SaveChanges();
            return changes;

        }

        private int AckPurchaseOrder(PurchaseOrder po)
        {
            po.Status = "RECEIVED";
            int changes = 0;
            em.Entry(po).State = System.Data.Entity.EntityState.Modified;
            changes = em.SaveChanges();
            return changes;
        }

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("/EditPurchaseOrder?PO=" + poNum);
        }



        protected void listDetails_ItemEditing(object sender, ListViewEditEventArgs e)
        {
        }

        private StationeryCatalogue getStationeryByItemCode(string itemCode)
        {
            return em.StationeryCatalogues
                .Where(s => s.ItemCode == itemCode)
                .FirstOrDefault<StationeryCatalogue>();
        }

        protected void listDetails_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            listDetails.EditIndex = -1;
        }

        protected void listDetails_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            listDetails.EditIndex = -1;
        }

        protected void txtOrderQuantity_TextChanged(object sender, EventArgs e)
        {
            TextBox txtOrderQuantity = (TextBox)sender;
            ListViewItem item = (ListViewItem)txtOrderQuantity.Parent;
            int qty = int.Parse(txtOrderQuantity.Text);
            var hfItemCode = (HiddenField)listDetails.EditItem.FindControl("hfItemCode");
            string itemCode = hfItemCode.Value;
            foreach (PODetail pod in po.PODetails)
            {
                if (pod.ItemCode == itemCode)
                {
                    pod.Quantity = qty;
                    break;
                }
            }
        }

        protected void validOrderQuantity_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (source is CustomValidator)
            {
                CustomValidator validator = (CustomValidator)source;
                ListViewItem parentItem = (ListViewItem)validator.Parent;
                var hfItemCode = (HiddenField)parentItem.FindControl("hfItemCode");
                string itemCode = hfItemCode.Value;
                int? minReorderQty = em.StationeryCatalogues.Where(s => s.ItemCode == itemCode).Select(s => s.ReorderQuantity).FirstOrDefault<int?>();
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
            listDetails.EditIndex = -1;
        }
    }
}