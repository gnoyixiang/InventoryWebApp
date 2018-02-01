using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.Store
{
    public partial class StoreEmployeeList : System.Web.UI.Page
    {
        StoreSupervisorController storeSpController = new StoreSupervisorController();
        List<Employee> empListInEMployee = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Context.User.IsInRole("Store Supervisor") || !Context.User.IsInRole("Store Manager"))
            {
                if (!Master.IsTempRoleCode("ActSSup"))
                {
                    Response.Redirect("/ErrorPages/401");
                }
            }

            if (!IsPostBack)
            {
                List<Employee> empList = storeSpController.EmployeeList();

                gvEmployeeList.DataSource = empList;
                gvEmployeeList.DataBind();
            }
        }
        public List<Employee> PopulateGridViewFromEmp(string searchValue)
        {
           

            int result = 0;
            bool searchcondition = Int32.TryParse(searchValue, out result);

            if (searchcondition)
            {
                empListInEMployee = storeSpController.ListOfEmployeeCode(searchValue);
                if (empListInEMployee.Count == 0)
                {

                    lblNoresultFound.Text = "No Result Found";
                    gvEmployeeList.DataSource = empListInEMployee;
                    gvEmployeeList.DataBind();
                    return empListInEMployee;
                }
                else
                {
                    gvEmployeeList.DataSource = empListInEMployee;
                    gvEmployeeList.DataBind();


                    return empListInEMployee;
                }
            }
            else
            {
                empListInEMployee = storeSpController.ListOfEmployeeName(searchValue);
                if (empListInEMployee.Count == 0)
                {

                    lblNoresultFound.Text = "No Result Found";


                    gvEmployeeList.DataSource = empListInEMployee;
                    gvEmployeeList.DataBind();
                    return empListInEMployee;
                }
                else
                {
                    gvEmployeeList.DataSource = empListInEMployee;
                    gvEmployeeList.DataBind();

                    

                    return empListInEMployee;
                }
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchCriteria = tbxSearch.Text;
            if (searchCriteria == "")
            {
                lblNoresultFound.Text = "SearchBox cann't be Empty";

            }
            else
            {
                PopulateGridViewFromEmp(searchCriteria);
            }
            
        }
        protected void gvEmployeeList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Employee emp = (Employee)e.Row.DataItem;

                string empCode = emp.EmployeeCode;
                

                Label lblEmpTempRole = (e.Row.FindControl("lblTemporaryRole") as Label);

                string temporaryRoleCode2 = storeSpController.GetTemporaryRole(empCode);

                string userName = storeSpController.GetUserName(empCode);


                if (lblEmpTempRole != null)
                {
                    lblEmpTempRole.Text = temporaryRoleCode2;
                }

                Label lblEmpRole = (e.Row.FindControl("lblEmployeeRole") as Label);

                string userRole = storeSpController.GetUserRoleName(userName);

                if (lblEmpRole != null)
                {
                    lblEmpRole.Text = userRole;
                }


            }
        }

        protected void gvEmployeeList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEmployeeList.PageIndex = e.NewPageIndex;
            if (tbxSearch.Text == "")
            {
                gvEmployeeList.DataSource = storeSpController.EmployeeList();
                gvEmployeeList.DataBind();
            }
            else
            {
                gvEmployeeList.DataSource = PopulateGridViewFromEmp(tbxSearch.Text);
                gvEmployeeList.DataBind();


            }
        }

        protected void btnStoreEmployeeList_Click(object sender, EventArgs e)
        {
            List<Employee> empList = storeSpController.EmployeeList();

            gvEmployeeList.DataSource = empList;
            gvEmployeeList.DataBind();
        }
    }
}