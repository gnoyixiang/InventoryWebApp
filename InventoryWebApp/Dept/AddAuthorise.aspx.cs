using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.DAO;

namespace InventoryWebApp.Dept
{
    public partial class AddAuthorise : System.Web.UI.Page
    {
        DepartmentHeadController dCon = new DepartmentHeadController();
        int number;




        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Page.DataBind();
                ddlRolecodelist.DataSource = dCon.ListAllDepartmentRoles();
                ddlRolecodelist.DataTextField = "Name";
                ddlRolecodelist.DataValueField = "Id";
                ddlRolecodelist.DataBind();

            }
        }


        protected void gv_SelectedIndexChanged(object sender, EventArgs e)
        {
            string employeecode = (string)gvEmployee.SelectedDataKey.Value;
            Employee emp = dCon.GetEmployeeInfo(employeecode);
            hfEmployeeCode.Value = employeecode;
            lblEmployeeName.Text = emp.EmployeeName;
            panelForm.Enabled = true;

        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            string rolecodeselected = ddlRolecodelist.SelectedItem.Value;
            string assignrolecode = "AS" + DateTime.Now.ToString("yyMMddHHmmssfff");
            if (rolecodeselected == "ActHead")
            {
                if (tbxStartDate.Text == "" || tbxEndDate.Text == "")
                {
                    lblmessage.Text = "Please enter the date";
                }
                else
                {
                    DateTime startdateselected = DateTime.Parse(tbxStartDate.Text);
                    DateTime enddateselected = DateTime.Parse(tbxEndDate.Text);

                    bool checkvalue = dCon.CheckTemporaryRoleAndDates(rolecodeselected, startdateselected, enddateselected,Master.UserDepartmentCode);
                    bool checkemployee = dCon.CheckEmployee(hfEmployeeCode.Value,Master.UserDepartmentCode);
                    if (checkvalue && checkemployee)
                    {
                        dCon.AddAssignRole(assignrolecode, rolecodeselected, hfEmployeeCode.Value, startdateselected, enddateselected, null);
                        Response.Redirect("AuthoriseStaff.aspx");
                    }
                    else if (!checkvalue && checkemployee)
                    {
                        lblmessage.Text = "Already present for this period";
                    }
                    else if (checkvalue && !checkemployee)
                    {
                        lblmessage.Text = "Employee has already assigned";
                    }
                    else
                    {
                        lblmessage.Text = "Both date and employee can't be assigned";
                    }
                }
            }
            else
            {
                bool checkvalue = dCon.CheckTemporaryRole(rolecodeselected,Master.UserDepartmentCode);
                bool checkemployee = dCon.CheckEmployee(hfEmployeeCode.Value,Master.UserDepartmentCode);
                if (checkvalue && checkemployee)
                {
                    dCon.AddTemporaryRole(assignrolecode, rolecodeselected, hfEmployeeCode.Value);
                    Response.Redirect("AuthoriseStaff.aspx");
                }
                else
                {
                    lblmessage.Text = "Can't assign";
                }

            }


        }

        protected void selectedTextChange(object sender, EventArgs e)
        {
            List<Employee> empList;
            if (Int32.TryParse(tbxSearch.Text, out number))
            {
                empList = dCon.ListOfEmployeeCodeInDepartment(tbxSearch.Text, Master.UserDepartmentCode);
            }
            else
            {
                empList = dCon.ListOfEmployeeNameInDepartment(tbxSearch.Text, Master.UserDepartmentCode);
            }
            gvEmployee.DataSource = empList;
            gvEmployee.DataBind();
            panelForm.Enabled = false;

        }



        protected void dropdownSelectIndexdChanged(object sender, EventArgs e)
        {
            if (ddlRolecodelist.SelectedItem.Value == "ActHead")
            {
                tbxStartDate.Enabled = true;
                tbxEndDate.Enabled = true;
            }
            else
            {
                tbxStartDate.Enabled = false;
                tbxEndDate.Enabled = false;
            }
        }
    }
}
