using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;
namespace InventoryWebApp
{
    public partial class ViewStockCard : System.Web.UI.Page
    {
        StoreSupervisorController supervisorController = new StoreSupervisorController();
        StationeryCatalogue sCatalogue;
        static List<TransactionOfRetrieval_Adjustment_PurchaseOrder> tranList ;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {

                Page.DataBind();
           
                
                sCatalogue = (StationeryCatalogue)Session["StationaryCatalogue"];
                lblItemCodeValue.Text = sCatalogue.ItemCode;
                lblDesValue.Text = sCatalogue.Description;
                lblUOMValue.Text = sCatalogue.MeasureUnit;
                lblfirstSupplierValue.Text = sCatalogue.Supplier1;
                lblsecondSupplierValue.Text = sCatalogue.Supplier2;
                lblthirdSupplierValue.Text = sCatalogue.Supplier3;
                int year = DateTime.Now.Year;
                int month = DateTime.Now.Month;
              
                if (month == 1)
                   tranList=supervisorController. GetAllTransaction(sCatalogue.ItemCode, new DateTime(year - 1, 12, 01), new DateTime(year - 1, 12, DateTime.DaysInMonth(year, month)));
                else
                    tranList=supervisorController. GetAllTransaction(sCatalogue.ItemCode, new DateTime(year, month - 1, 01), new DateTime(year, month - 1, DateTime.DaysInMonth(year, month)));
                BindGrid();
            } 
        }

        public void BindGrid()
        {
            gvStockCard.DataSource = tranList;
            gvStockCard.DataBind();
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TransactionOfRetrieval_Adjustment_PurchaseOrder trans = (TransactionOfRetrieval_Adjustment_PurchaseOrder)e.Row.DataItem;
                Label supDepLabel = (e.Row.FindControl("lblDepSup") as Label);
                Label quantityLabel = (e.Row.FindControl("lblQuantity") as Label);
                if (trans.SupplierId != "")
                {
                    supDepLabel.Text = supervisorController.GetSupplier(trans.SupplierId).SupplierName;
                    quantityLabel.Text = "+" + trans.Quantity;
                }
                else if (trans.DeptId != "")
                {
                    supDepLabel.Text = supervisorController.GetDepartment(trans.DeptId).DepartmentName;
                    quantityLabel.Text = "-" + trans.Quantity;
                }
                else
                {
                    supDepLabel.Text = "Adjustment";
                    if (trans.Quantity > 0)
                        quantityLabel.Text = "ADJ+" + trans.Quantity;
                    else
                        quantityLabel.Text = "ADJ" + trans.Quantity;
                }  
             
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
           
            sCatalogue = (StationeryCatalogue)Session["StationaryCatalogue"];

            String a = tbxMonth.Text;
            string[] arr = tbxMonth.Text.Split('-');
            int year = Convert.ToInt32(arr[0]);
            int month = Convert.ToInt32(arr[1]);
            tranList = supervisorController.GetAllTransaction(sCatalogue.ItemCode, new DateTime(year
                , month, 01), new DateTime(year, month, DateTime.DaysInMonth(year, month)));
            if (tranList==null)
            {
                lblShowStatus.Text = "NO RECORD FOUND ";
                lblShowStatus.Visible = true;
                BindGrid();

            }
            else
            {
                lblShowStatus.Visible = false;
                BindGrid();
            }
        }
        protected void GvStockCard_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStockCard.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}