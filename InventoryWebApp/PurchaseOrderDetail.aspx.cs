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

        protected void Page_Load(object sender, EventArgs e)
        {
            poNum = Request.QueryString["PO"];
            
            po = getPurchaseOrderByCode(poNum);
        }

        protected string getItemDescription(string itemCode)
        {
            return new EntityModel().StationeryCatalogues.Where(s => s.ItemCode == itemCode).Select(s => s.Description).FirstOrDefault<String>();
        }

        protected string getAmount(string quantity, string price)
        {
            double amount = double.Parse(quantity) * double.Parse(price);
            return String.Format("{0:c}", amount);
        }

        protected string getGrandTotal()
        {
            grandTotal = 0;
            foreach(PODetail pod in po.PODetails)
            {
                grandTotal += pod.Quantity * pod.Price;
            }
            return String.Format("{0:C2}", grandTotal);
        }

        private PurchaseOrder getPurchaseOrderByCode(string poNum)
        {
            return new EntityModel().PurchaseOrders.Where(p=>p.PurchaseOrderCode==poNum).FirstOrDefault<PurchaseOrder>();
        }

        private string getSupplierName(string supplierCode)
        {
            return getSupplier(supplierCode).SupplierName;
        }

        private Supplier getSupplier(string supplierCode)
        {
            return new EntityModel().Suppliers.Where(s => s.SupplierCode.Equals(supplierCode)).FirstOrDefault<Supplier>();
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
            
            listDetails.DataSource = po.PODetails;
            listDetails.DataBind();
            Label lblGrandTotal = (Label)listDetails.FindControl("lblGrandTotal");
            lblGrandTotal.Text = getGrandTotal();
        }
        
    }
}