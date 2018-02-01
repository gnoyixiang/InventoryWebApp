using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.Dept
{
    public partial class AuthoriseStaff : System.Web.UI.Page
    {
        DepartmentHeadController dCon = new DepartmentHeadController();
        String assignrolecode;

        protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            assignrolecode = Request.QueryString["AssignRoleCode"];
            if (!IsPostBack)
            {
                Page.DataBind();
                BindGrid();
            }
        }
        private void BindGrid()
        {
            gv.DataSource = dCon.ListOfAssignRoleInDepartment("CPSC");
            gv.DataBind();
        }

        protected void gv_SelectedIndexChanged(object sender, EventArgs e)
        {
            string assignrolecode = (string)gv.SelectedDataKey.Value;
            AssignRole a = dCon.GetAssignRoleInfo(assignrolecode);
            lblEmpName.Text = dCon.GetEmployeeByCode(a.EmployeeCode).EmployeeName;
            lblEmpCode.Text = a.EmployeeCode;
            //string rolename=dCon.GetRoleName(a.TemporaryRoleCode);
            tbxStartDate.Text = a.StartDate.ToString();
            tbxEndDate.Text = a.EndDate.ToString();
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                AssignRole assignrole = (AssignRole)e.Row.DataItem;
                string assignrolecode = assignrole.AssignRoleCode.ToString();

                string employeecode = assignrole.EmployeeCode.ToString();
                string employeename = dCon.GetEmployeeByCode(employeecode).EmployeeName;
                Label employeelabel = (e.Row.FindControl("lblEmployeeName") as Label);
                if (employeelabel != null)
                {
                    employeelabel.Text = employeename;
                }
                string rolecode = assignrole.TemporaryRoleCode.ToString();
                string rolename = dCon.GetRoleName(rolecode);
                Label rolelabel = (e.Row.FindControl("lblRoleName") as Label);
                if (rolelabel != null)
                {
                    rolelabel.Text = rolename;
                }
                if (rolecode == "ActHead")
                {
                    Label startdate = (e.Row.FindControl("lblStartDate") as Label);
                    DateTime d1 = (DateTime)assignrole.StartDate;
                    startdate.Text = d1.ToShortDateString();

                    Label enddate = (e.Row.FindControl("lblEndDate") as Label);
                    DateTime d2 = (DateTime)assignrole.EndDate;
                    enddate.Text = d2.ToShortDateString();
                }

            }
        }



        protected void btnAssign_Click(object sender, EventArgs e)
        {

            string employeecode = lblEmpCode.Text;
            string assignrolecode = (string)gv.SelectedDataKey.Value;
            AssignRole assignRole = dCon.GetAssignRoleInfo(assignrolecode);
            string rolecodeselected = assignRole.TemporaryRoleCode;
            if (rolecodeselected == "ActHead")
            {
                if (tbxStartDate.Text == "" || tbxEndDate.Text == "")
                {
                    lblSuccessMsg.Text = "";
                    lblErrorMsg.Text = "Can't be empty";
                }
                else
                {
                    DateTime startdateselected = Convert.ToDateTime(tbxStartDate.Text);
                    DateTime enddateselected = Convert.ToDateTime(tbxEndDate.Text);
                    bool checkvalue = dCon.CheckTemporaryRoleAndDates(rolecodeselected, startdateselected, enddateselected);
                    if (assignrolecode != null)
                    {
                        if (checkvalue)
                        {
                            dCon.UpdateAssignRole(assignrolecode, rolecodeselected, startdateselected, enddateselected);

                            lblSuccessMsg.Text = "Assign Role updated";
                            lblErrorMsg.Text = "";
                        }
                        else
                        {
                            lblSuccessMsg.Text = "";
                            lblErrorMsg.Text = "Already present for this period";
                        }

                    }
                    else
                    {
                        lblSuccessMsg.Text = "";
                        lblErrorMsg.Text = "Can't update, there's no temporaryrole";
                    }
                }
            }
            else
            {
                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = "Can't update";
            }
            BindGrid();
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string assignrolecode = (string)gv.DataKeys[e.RowIndex].Values[0];

            AssignRole ass = dCon.GetAssignRoleInfo(assignrolecode);
            //if (ass.TemporaryRoleCode == "ActHead")
            // {
            dCon.DeleteAssignRole(assignrolecode);
            //}
            /* else
             {
                 Employee emp = dCon.GetEmployeeInfo(ass.EmployeeCode);
                 Role role = dCon.getRoleNameByUsername(emp.UserName);
                 em.Users.Where(x => x.UserName == emp.UserName).FirstOrDefault<User>().Roles.Remove(role);
                 em.SaveChanges();
                 dCon.DeleteAssignRole(assignrolecode);
             }*/
            BindGrid();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Dept/AddAuthorise.aspx");
        }
    }
}
