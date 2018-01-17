using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
namespace InventoryWebApp
{
    public partial class PendingPO : System.Web.UI.Page
    {
        StoreSupervisorController supervisorController = new StoreSupervisorController();
        static List<PurchaseOrder> poList;
        protected void Page_Load(object sender, EventArgs e)
        {
            poList = supervisorController.ListAllPendingPO();
            gvPendingPO.DataSource = poList;
            gvPendingPO.DataBind();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                PurchaseOrder order = (PurchaseOrder)e.Row.DataItem;
                string id = order.SupplierCode;
                string suppliername = BusinessLogic.GetFoodName(id);

                Label foodlabel = (e.Row.FindControl("Label3A") as Label);
                if (foodlabel != null)
                    foodlabel.Text = foodname;
            }
        }
    }
}