using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.DAO;

namespace InventoryWebApp
{
    public partial class AddAuthorise : System.Web.UI.Page
    {
        DepartmentHeadController dCon=new DepartmentHeadController();
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
            string assignrolecode = "AS" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
            if (rolecodeselected == "ActHead")
            {
                DateTime startdateselected = Convert.ToDateTime(tbxStartDate.Text);
                DateTime enddateselected = Convert.ToDateTime(tbxEndDate.Text);
            
                bool checkvalue = dCon.CheckTemporaryRoleAndDates(rolecodeselected, startdateselected, enddateselected);
                bool checkemployee = dCon.CheckEmployee(hfEmployeeCode.Value);
                    if (checkvalue&&checkemployee)
                    {
                    dCon.AddAssignRole(assignrolecode, rolecodeselected,hfEmployeeCode.Value, startdateselected, enddateselected,null);
                    lblmessage.Text = "AssignRole Add";
                    Response.Redirect("AuthoriseStaff.aspx");
                }
                    else 
                    {
                        lblmessage.Text = "Already present for this period";
                    }              
            }
            else
            {
                bool checkvalue = dCon.CheckTemporaryRole(rolecodeselected);
                bool checkemployee = dCon.CheckEmployee(hfEmployeeCode.Value);
                if (checkvalue&& checkemployee)
                {
                    dCon.AddTemporaryRole(assignrolecode, rolecodeselected,hfEmployeeCode.Value);
                    lblmessage.Text = "TemporaryRole add";
                    /*EntityModel em = new EntityModel();
                    AssignRole ass = dCon.GetAssignRoleInfo(assignrolecode);
                    //
                    Employee emp = dCon.GetEmployeeInfo(ass.EmployeeCode);
                    Role r = dCon.GetRoleInfo(rolecodeselected);

                    Role role = dCon.getRoleNameByUsername(emp.UserName);
                    em.Users.Where(x => x.UserName ==emp.UserName).FirstOrDefault<User>().Roles.Remove(role);
                    em.SaveChanges();
                    

                    em.Users.Where(x => x.UserName == emp.UserName).FirstOrDefault<User>().Roles.Add(r);
                    em.SaveChanges();
                    */
                    Response.Redirect("AuthoriseStaff.aspx");

                }
                else
                {
                        lblmessage.Text = "Already present for this period";
                }
                
            }
          

        }

        protected void selectedTextChange(object sender, EventArgs e)
        {
            List<Employee> empList;
            if (Int32.TryParse(tbxSearch.Text, out number))
            {
                empList = dCon.ListOfEmployeeCodeInDepartment(tbxSearch.Text);
            }
            else
            {
                empList = dCon.ListOfEmployeeNameInDepartment(tbxSearch.Text);
            }
            gvEmployee.DataSource = empList;
            gvEmployee.DataBind();
            panelForm.Enabled = false;
        }

    }
}
