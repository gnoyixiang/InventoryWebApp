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
namespace InventoryWebApp.Dept
{
    public partial class DeptRequisitionList : System.Web.UI.Page
    {
        public static EmployeeController ec = new EmployeeController();

        static private readonly string[] SEARCH_ITEMS = { "--Select Category--", "RequestCode",  "Status", "EmployeeName" };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataSource = SEARCH_ITEMS;
                DropDownList1.DataBind();

                if (!String.IsNullOrEmpty(Request.QueryString["search"]))
                {
                    string search = Request.QueryString["search"];
                    if (!String.IsNullOrEmpty(Request.QueryString["q"]))
                    {
                        string q = Request.QueryString["q"];
                        List<Request> RList = ec.SearchRequest(search, q)
                        .Where(r => r.DepartmentCode == Master.UserDepartmentCode).ToList();
                        ListView1.DataSource = RList;
                        ListView1.DataBind();
                        switch (search)
                        {
                            case "RequestCode":
                                DropDownList1.SelectedIndex = 1;
                                break;
                            case "Status":
                                DropDownList1.SelectedIndex = 2;                                
                                break;
                            case "EmployeeName":
                                DropDownList1.SelectedIndex = 3;
                                break;
                        }
                        txtBxSearchRequisition.Text = q;
                    }
                }
                else
                {
                    LoadGridData();
                    DropDownList1.SelectedIndex = -1;
                }             
            }
        }
        private void LoadGridData()
        {
            ListView1.DataSource = ec.ListAllRequest().Where(r=>r.DepartmentCode==this.Master.UserDepartmentCode).ToList();
            ListView1.DataBind();
            
        }
   

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string search = DropDownList1.SelectedValue;
            string q = txtBxSearchRequisition.Text;
            Response.Redirect("DeptRequisitionList.aspx?search=" + search + "&q=" + q);
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeptRequisitionList.aspx");
            txtBxSearchRequisition.Text = null;
            DropDownList1.SelectedIndex = -1;
        }

        protected string GetEmployeeName(string username)
        {
            return ec.GetEmployeeNameByUserName(username);
        }
        
    }


}