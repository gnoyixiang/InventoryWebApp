using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.DAO;
using InventoryWebApp.Controllers;
namespace InventoryWebApp
{
    public partial class DeptRequisitionList : System.Web.UI.Page
    {
        public static EmployeeController ec = new EmployeeController();
        static private string searchParam;
        static private string searchString;

        static private readonly string[] SEARCH_ITEMS = { "--Select Category--", "RequestCode",  "Status" };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGridData();
                DropDownList1.DataSource = SEARCH_ITEMS;
                DropDownList1.DataBind();

            }

        }
        private void LoadGridData()
        {
            ListView1.DataSource = ec.ListAllRequest().Where(r=>r.DepartmentCode==this.Master.userDepartmentCode).ToList();
            ListView1.DataBind();
            
        }
   

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            List<Request> RList = ec.SearchRequest(DropDownList1.SelectedItem.ToString(), txtBxSearchRequisition.Text).Where(r=>r.DepartmentCode==Master.userDepartmentCode).ToList();
            ListView1.DataSource = RList;            
            ListView1.DataBind();
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("RequisitionList.aspx");
            txtBxSearchRequisition.Text = null;
        }

        //protected void dpList_PreRender(object sender, EventArgs e)
        //{
        //    ListView1.DataSource = ec.ListAllRequest();
        //    ListView1.DataBind();
        //}
    }


}