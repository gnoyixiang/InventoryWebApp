using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;
namespace InventoryWebApp.Store
{
    public partial class ViewStockCard : System.Web.UI.Page
    {
        StoreSupervisorController supervisorController = new StoreSupervisorController();
        StationeryCatalogue sCatalogue;
        static List<TransactionOfRetrieval_Adjustment_PurchaseOrder> tranList;
      
        DateTime startDate;
        DateTime endDate;

        public GridLines Both { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string itemCode;

            if (!String.IsNullOrEmpty(Request.QueryString["itemCode"]))
            {
                itemCode = Request.QueryString["itemCode"];
                sCatalogue = supervisorController.GetStationeryCatalogue(itemCode);
            }

            if (sCatalogue != null)
            {
                panelItem.Visible = true;
                panelNoItem.Visible = false;
                if (!IsPostBack)
                {

                    lblItemCodeValue.Text = sCatalogue.ItemCode;
                    lblDesValue.Text = sCatalogue.Description;
                    lblUOMValue.Text = sCatalogue.MeasureUnit;
                    lblfirstSupplierValue.Text = sCatalogue.Supplier1;
                    lblsecondSupplierValue.Text = sCatalogue.Supplier2;
                    lblthirdSupplierValue.Text = sCatalogue.Supplier3;
                    int year = DateTime.Now.Year;
                    int month = DateTime.Now.Month;

                    if (month == 1)
                    {
                        startDate = new DateTime(year - 1, 12, 01);
                        endDate = new DateTime(year - 1, 12, DateTime.DaysInMonth(year, month));
                        tranList = supervisorController.GetAllTransaction(sCatalogue.ItemCode, startDate, endDate);
                    }
                    else
                    {
                        startDate = new DateTime(year, month - 1, 01);
                        endDate = new DateTime(year, month - 1, DateTime.DaysInMonth(year, month));
                        tranList = supervisorController.GetAllTransaction(sCatalogue.ItemCode, startDate, endDate);
                    }
                    if (tranList != null)
                        BindGrid();
                }
            }
            else
            {
                panelItem.Visible = false;
                panelNoItem.Visible = true;

            }
            
        }

        public void BindGrid()
        {
          
            List<List<TransactionOfRetrieval_Adjustment_PurchaseOrder>> tList = new List<List<TransactionOfRetrieval_Adjustment_PurchaseOrder>>();
            for(DateTime i = startDate; i <= endDate; i=i.AddMonths(1))
            {

                tranList = supervisorController.GetAllTransaction(sCatalogue.ItemCode, i, new DateTime(i.Year, i.Month, DateTime.DaysInMonth(i.Year, i.Month)));
                tList.Add(tranList);
             

            }
            if (tList==null && tList.Count==0)
            {
                lblShowStatus.Text = "NO RECORD FOUND ";
                lblShowStatus.Visible = true;

            }
            else
            {
                lblShowStatus.Visible = false;
                
            }


            foreach (List<TransactionOfRetrieval_Adjustment_PurchaseOrder> entry in tList)
            {
              
                GridView gvStockCard = new GridView();
                gvStockCard.AutoGenerateColumns = false;

                BoundField boundfield1 = new BoundField();
                boundfield1.DataField = "Date";
                boundfield1.DataFormatString = "{0:dd MMM yyyy}";
                BoundField boundfield2 = new BoundField();
                boundfield2.DataField = "Dept_SupId";
                BoundField boundfield3 = new BoundField();
                boundfield3.DataField = "Quantity";
                BoundField boundfield4 = new BoundField();
                boundfield4.DataField = "Balance";

                boundfield1.HeaderText = "Date";
                boundfield2.HeaderText = "Dept/Supplier";
                boundfield3.HeaderText = "Qty";
                boundfield4.HeaderText = "Balance";

                gvStockCard.Columns.Add(boundfield1);
                gvStockCard.Columns.Add(boundfield2);
                gvStockCard.Columns.Add(boundfield3);
                gvStockCard.Columns.Add(boundfield4);


                gvStockCard.DataSource =entry ;
                gvStockCard.DataBind();
                gvStockCard.Width = Unit.Percentage(100); 

                gvStockCard.Columns[0].ItemStyle.Width = Unit.Percentage(20);
                gvStockCard.Columns[1].ItemStyle.Width = Unit.Percentage(50);
                gvStockCard.Columns[2].ItemStyle.Width = Unit.Percentage(15);
                gvStockCard.Columns[3].ItemStyle.Width = Unit.Percentage(15);

                //gvStockCard.HeaderRow.CssClass = "header";
                //gvStockCard.RowStyle.CssClass = "rowstyle";
                gvStockCard.CssClass = "table";
                gvStockCard.GridLines =Both;
                panelStockCard.Controls.Add(gvStockCard);
               
            }

        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (sCatalogue != null)
            {
                string[] arr = tbxStart.Text.Split('-');
                int startYear = Convert.ToInt32(arr[0]);
                int startMonth = Convert.ToInt32(arr[1]);

                arr = tbxEnd.Text.Split('-');
                int endYear = Convert.ToInt32(arr[0]);
                int endMonth = Convert.ToInt32(arr[1]);

                startDate = new DateTime(startYear, startMonth, 01);
                endDate = new DateTime(endYear, endMonth, DateTime.DaysInMonth(endYear, endMonth));
                BindGrid();
            }
        }
        protected void valDateRange_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime minDate = DateTime.Parse(tbxStart.Text);
            DateTime maxDate = DateTime.Parse(tbxEnd.Text);
            DateTime dt;

            args.IsValid = (DateTime.TryParse(args.Value, out dt)
                            && dt <= maxDate
                            && dt >= minDate);
        }

    }
}