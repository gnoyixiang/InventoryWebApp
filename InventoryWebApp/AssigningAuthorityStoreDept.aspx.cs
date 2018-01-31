using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using System.Collections;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace InventoryWebApp
{
    public partial class AssigningAuthorityStoreDept : System.Web.UI.Page
    {
        //string searchValue = null;
        StoreSupervisorController storeSpController = new StoreSupervisorController();
        List<AssignRole> empList = null;
        List<Employee> empListInEMployee = null;
         

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.DataBind();

                //compStartTodayValidatorFooter.ValueToCompare = DateTime.Now.ToShortDateString();


            }
        }



       protected  void gvSearchResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSearchResult.PageIndex = e.NewPageIndex;
            gvSearchResult.DataSource = PopulateGridView(tbxSearch.Text);
            gvSearchResult.DataBind();
        }

        List<AssignRole> PopulateGridView(string searchValue)
        {
            int result = 0;

            bool searchcondition = Int32.TryParse(searchValue, out result);

            if (searchcondition)
            {
                empList = storeSpController.ListOfEmployeeCodeInAssignRole(searchValue);
                // empListInEMployee = storeSpController.ListOfEmployeeCodeInEmp(searchValue);
                if (empList.Count == 0)
                {


                    return empList;
                }
               
                
                gvSearchResult.DataSource = empList;
                gvSearchResult.DataBind();

                //gvSearchResult.DataSource = empListInEMployee;
                //gvSearchResult.DataBind();
                ImageButton img = (gvSearchResult.FooterRow.FindControl("btnAdd") as ImageButton);
                img.Enabled = false;
                //return empListInEMployee;
                return empList;
            }
            else
            {
                empList = storeSpController.ListOfEmployeeNameInAssignRole(searchValue);
                //empListInEMployee = storeSpController.ListOfEmployeeNameInEmp(searchValue);
                if (empList.Count == 0)
                {
                    

                    return empList;
                }
                else
                {

                    gvSearchResult.DataSource = empList;
                    gvSearchResult.DataBind();

                    //gvSearchResult.DataSource = empListInEMployee;
                    //gvSearchResult.DataBind();
                    ImageButton img = (gvSearchResult.FooterRow.FindControl("btnAdd") as ImageButton);
                    img.Enabled = false;
                    return empList;
                }
            }

            
        }


        public List<Employee> PopulateGridViewFromEmp(string searchValue)
        {

            int result = 0;

            bool searchcondition = Int32.TryParse(searchValue, out result);

            if (searchcondition)
            {
                
                 empListInEMployee = storeSpController.ListOfEmployeeCodeInEmp(searchValue);
                if (empListInEMployee.Count == 0)
                {

                    lblNoresultFound.Text = "No Result Found";
                    gvSearchResult.DataSource = empListInEMployee;
                    gvSearchResult.DataBind();
                    return empListInEMployee;
                }
                else
                {
                    gvSearchResult.DataSource = empListInEMployee;
                    gvSearchResult.DataBind();

                    //gvSearchResult.DataSource = empListInEMployee;
                    //gvSearchResult.DataBind();
                    ImageButton img = (gvSearchResult.FooterRow.FindControl("btnAdd") as ImageButton);
                    img.Enabled = false;
                    //ImageButton editimage = (gvSearchResult.FooterRow.FindControl("btnEdit") as ImageButton);
                    //editimage.Enabled = false;

                    //return empListInEMployee;
                    return empListInEMployee;
                }
            }
            else
            {
                //empList = storeSpController.ListOfEmployeeNameInStore(searchValue);
                empListInEMployee = storeSpController.ListOfEmployeeNameInEmp(searchValue);
                if (empListInEMployee.Count == 0)
                {
                    // gvSearchResult.DataSource = empListInEMployee;
                    //gvSearchResult.DataBind();
                    lblNoresultFound.Text = "No Result Found";

                    //if (empListInEMployee.Count == 0)
                    //{
                    //    lblNoresultFound.Text = "No Result Found";
                    //}
                    gvSearchResult.DataSource = empListInEMployee;
                    gvSearchResult.DataBind();
                    return empListInEMployee;
                }
                else
                {


                    gvSearchResult.DataSource = empListInEMployee;
                    gvSearchResult.DataBind();

                    //gvSearchResult.DataSource = empListInEMployee;
                    //gvSearchResult.DataBind();
                    ImageButton img = (gvSearchResult.FooterRow.FindControl("btnAdd") as ImageButton);
                    img.Enabled = false;
                    return empListInEMployee;
                }
            }










        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            
          string  searchCriteria= tbxSearch.Text;
            //if (searchCriteria == "")
            //{
            //    lblNoresultFound.Text = "SearchBox cann't be Empty";
            //}
            //else
            //{
                List<AssignRole> asRoleList = PopulateGridView(searchCriteria);


                if (asRoleList.Count == 0)
                {

                    PopulateGridViewFromEmp(searchCriteria);


                }
                else
                {

                    PopulateGridView(searchCriteria);


                }
            //}

        }

        protected void gvSearchResult_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                string empdatakey = gvSearchResult.DataKeys[e.Row.RowIndex].Values["EmployeeCode"].ToString();
                
               string as2 = storeSpController.GetAssignRoleCode(empdatakey);


                if (as2 != null)
                {


                    AssignRole emp = (AssignRole)e.Row.DataItem;
                    //Employee emp = (Employee)e.Row.DataItem;
                    string id = emp.EmployeeCode;

                    //string assignRoleCode = storeSpController.GetAssignRoleCode(id);
                    string assignRoleCode = emp.AssignRoleCode;
                    string temporaryRoleCode = storeSpController.GetTemporaryRole(id);
                    string empName = storeSpController.GetUserName(id);

                    Label lblEmpName = (e.Row.FindControl("lblEmployeeName") as Label);

                    if (lblEmpName != null)
                    {
                        lblEmpName.Text = storeSpController.GetEmployeeName(empName);
                    }
                    Label lblTempRole = (e.Row.FindControl("lblTemporaryRoleCode") as Label);

                    if (lblTempRole != null)
                    {
                        lblTempRole.Text = temporaryRoleCode;
                    }
                    //emp.UserName;

                    string userCurrentRole = storeSpController.GetUserRoleName(empName);

                    Label lblCurRole = (e.Row.FindControl("lblCurrentRole") as Label);


                    if (lblCurRole != null)
                    {
                        lblCurRole.Text = userCurrentRole;
                    }

                    DateTime startDate = storeSpController.GetTemporaryRoleStartDate(assignRoleCode);

                    Label lblStartDate = (e.Row.FindControl("lblStartDate") as Label);

                    if (lblStartDate != null)
                    {
                        lblStartDate.Text = startDate.ToShortDateString();
                    }

                    TextBox tbxStartDate = (e.Row.FindControl("tbxStartDate") as TextBox);
                    if (tbxStartDate != null)
                    {
                        tbxStartDate.Text = new Calendar().TodaysDate.ToString();

                    }

                    DateTime endDate = storeSpController.GetTemporaryRoleEndDate(assignRoleCode);

                    Label lblEndDate = (e.Row.FindControl("lblEndDate") as Label);
                    if (lblEndDate != null)
                    {
                        lblEndDate.Text = endDate.ToShortDateString();
                    }
                    TextBox tbxEndDate = (e.Row.FindControl("tbxEndDate") as TextBox);

                    if (tbxEndDate != null)
                    {
                        tbxEndDate.Text = new Calendar().TodaysDate.ToString();

                    }
                }


                else
                {
                    
                    //DataBinding from employee Table.
                    Employee emp2 = (Employee)e.Row.DataItem;
                    string id2 = emp2.EmployeeCode;

                    string assignRoleCode2 = storeSpController.GetAssignRoleCode(id2);
                    
                    string temporaryRoleCode2 = storeSpController.GetTemporaryRole(id2);
                    string empName2 = storeSpController.GetUserName(id2);

                    Label lblEmpName2 = (e.Row.FindControl("lblEmployeeName") as Label);

                    if (lblEmpName2 != null)
                    {
                        lblEmpName2.Text = storeSpController.GetEmployeeName(empName2);
                    }
                    Label lblTempRole2 = (e.Row.FindControl("lblTemporaryRoleCode") as Label);

                    if (lblTempRole2 != null)
                    {
                        lblTempRole2.Text = temporaryRoleCode2;
                    }
                    //emp.UserName;

                    string userCurrentRole2 = storeSpController.GetUserRoleName(empName2);

                    Label lblCurRole2 = (e.Row.FindControl("lblCurrentRole") as Label);


                    if (lblCurRole2 != null)
                    {
                        lblCurRole2.Text = userCurrentRole2;
                    }

                    DateTime startDate2 = storeSpController.GetTemporaryRoleStartDate(assignRoleCode2);

                    Label lblStartDate2 = (e.Row.FindControl("lblStartDate") as Label);

                    if (lblStartDate2 != null)
                    {
                       // lblStartDate2.Text = startDate2.ToShortDateString();
                    }

                    TextBox tbxStartDate2 = (e.Row.FindControl("tbxStartDate") as TextBox);
                    if (tbxStartDate2 != null)
                    {
                        tbxStartDate2.Text = new Calendar().TodaysDate.ToString();

                    }

                    DateTime endDate2 = storeSpController.GetTemporaryRoleEndDate(assignRoleCode2);

                    Label lblEndDate2 = (e.Row.FindControl("lblEndDate") as Label);
                    if (lblEndDate2 != null)
                    {
                       // lblEndDate2.Text = endDate2.ToShortDateString();
                    }
                    TextBox tbxEndDate2 = (e.Row.FindControl("tbxEndDate") as TextBox);

                    if (tbxEndDate2 != null)
                    {
                        tbxEndDate2.Text = new Calendar().TodaysDate.ToString();

                    }

                }
            }

        }

            
        

        protected void gvSearchResult_RowEditing(object sender, GridViewEditEventArgs e)
        {

            gvSearchResult.EditIndex = e.NewEditIndex;

            GridViewRow row = gvSearchResult.Rows[e.NewEditIndex];


            string empCode = gvSearchResult.DataKeys[e.NewEditIndex].Value.ToString();


            string assignCode = storeSpController.GetAssignRoleCode(empCode);

            if (assignCode != null)
            {


                PopulateGridView(tbxSearch.Text);

            }
            else
            {


                PopulateGridViewFromEmp(tbxSearch.Text);
            }

            //try
            //{
            //    gvSearchResult.EditIndex = e.NewEditIndex;
            //    GridViewRow row = gvSearchResult.Rows[e.NewEditIndex];
            //    string empCode = gvSearchResult.DataKeys[e.NewEditIndex].Value.ToString();


            //    string assignCode = storeSpController.GetAssignRoleCode(empCode);

            //    if (assignCode != null)
            //    {
            //        //storeSpController.DeleteAssignRoleByAssignCode(assignCode);

            //        PopulateGridView(tbxSearch.Text);
            //        // lblSuccessMsg.Text = "Selected record Deleted.";
            //        // lblErrorMsg.Text = "";
            //    }
            //    else
            //    {
            //        lblSuccessMsg.Text = "";
            //        lblErrorMsg.Text = "Cann't Edit.Don't have any TemporaryRole";
            //    }
            //}
            //catch (Exception ex)
            //{

            //    lblSuccessMsg.Text = "";
            //    lblErrorMsg.Text = ex.Message;
            //}


        }

        protected void gvSearchResult_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
          GridViewRow row =  gvSearchResult.Rows[e.RowIndex];
           string empCode =  gvSearchResult.DataKeys[e.RowIndex].Value.ToString();

            
            
            try

            {

                string assignCode = storeSpController.GetAssignRoleCode(empCode);

                string tempRoleCode = (row.FindControl("ddlTemporaryRoleCode") as DropDownList).SelectedValue;

                string employeeCode = (row.FindControl("lblEmployeeCode") as Label).Text;

                TextBox txtstartDate = (row.FindControl("tbxStartDate") as TextBox);
                //DateTime startDate = DateTime.MinValue ;




                DateTime startDate = DateTime.Parse(txtstartDate.Text);

                

                


                TextBox txtEndDate = (row.FindControl("tbxEndDate") as TextBox);
                DateTime endDate = DateTime.Parse(txtEndDate.Text);

                //This method will use when we login to application and this method can acess who logged in and can get the user 
                var user = HttpContext.Current.GetOwinContext().Get<ApplicationUserManager>().FindById(User.Identity.GetUserName());
                //this is getting username from user.
                //string userName =  user.UserName;

                bool checkValue = storeSpController.CheckTempRoleAndDates(tempRoleCode, startDate, endDate);
                // string checkAssignCode = storeSpController.GetAssignRoleCode(empCode);
                if (assignCode != null)
                {
                    if (checkValue)
                    {
                        storeSpController.UpdateAssignRole(assignCode, tempRoleCode, employeeCode, startDate, endDate);
                        gvSearchResult.EditIndex = -1;
                        PopulateGridView(tbxSearch.Text);
                        lblSuccessMsg.Text = "AssignRole Updated";
                        lblErrorMsg.Text = "";

                    }
                    else
                    {
                        lblSuccessMsg.Text = "";
                        lblErrorMsg.Text = "StoreSuperVisor already present for this period";

                    }
                }
                else
                {
                    lblSuccessMsg.Text = "";
                    lblErrorMsg.Text = "Cann't Update.Don't have any TemporaryRole";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }

        }

        protected void gvSearchResult_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            

            gvSearchResult.EditIndex = -1;
            PopulateGridView(tbxSearch.Text);


            GridViewRow row = gvSearchResult.Rows[e.RowIndex];


            string empCode = gvSearchResult.DataKeys[e.RowIndex].Value.ToString();


            string assignCode = storeSpController.GetAssignRoleCode(empCode);

            if (assignCode != null)
            {
                // storeSpController.DeleteAssignRoleByAssignCode(assignCode);
                //gvSearchResult.EditIndex = e.NewEditIndex;
                PopulateGridView(tbxSearch.Text);
                //lblSuccessMsg.Text = "Selected record Deleted.";
                // lblErrorMsg.Text = "";
            }
            else
            {


                PopulateGridViewFromEmp(tbxSearch.Text);
            }
        }

        protected void gvSearchResult_SelectedIndexChanged(object sender, EventArgs e)
        {
          Label empCodeFooter =   (gvSearchResult.FooterRow.FindControl("lblEmployeeCodeFooter") as Label);

           Label empNameFooter = (gvSearchResult.FooterRow.FindControl("lblEmployeeNameFooter") as Label);

            Label currentRoleFooter = (gvSearchResult.FooterRow.FindControl("lblCurrentRoleFooter") as Label);

            Label empCode  = (gvSearchResult.SelectedRow.FindControl("lblEmployeeCode") as Label);

            Label empName = (gvSearchResult.SelectedRow.FindControl("lblEmployeeName") as Label);

            Label currentRole = (gvSearchResult.SelectedRow.FindControl("lblCurrentRole") as Label);

            empCodeFooter.Text = empCode.Text;
            empNameFooter.Text = empName.Text;
            currentRoleFooter.Text = currentRole.Text;
            ImageButton img = (gvSearchResult.FooterRow.FindControl("btnAdd") as ImageButton);
            img.Enabled = true;


        }

        protected void gvSearchResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    //we cant directly paste the footername so we have to use gridview name to find FooterRow and the use findControl() method to 
                    //find the foooter id and then typecast as Textbox and then get the text and trim it if any space
                    string assignRoleCode = "AS" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                    string empCode = (gvSearchResult.FooterRow.FindControl("lblEmployeeCodeFooter") as Label).Text;
                    // string empName = (gvSearchResult.FooterRow.FindControl("lblEmployeeNameFooter") as Label).Text;

                    string currentRole = (gvSearchResult.FooterRow.FindControl("lblCurrentRoleFooter") as Label).Text;

                    string tempRoleCode = (gvSearchResult.FooterRow.FindControl("ddlTemporaryRoleCodeFooter") as DropDownList).SelectedValue;

                    TextBox txtstartDate = (gvSearchResult.FooterRow.FindControl("tbxStartDateFooter") as TextBox);
                    DateTime startDate = DateTime.Parse(txtstartDate.Text);

                    TextBox txtEndDate = (gvSearchResult.FooterRow.FindControl("tbxEndDateFooter") as TextBox);
                    DateTime endDate = DateTime.Parse(txtEndDate.Text);

                    //This method will use when we login to application and this method can acess who logged in and can get the user 
                    var user = HttpContext.Current.GetOwinContext().Get<ApplicationUserManager>().FindById(User.Identity.GetUserName());
                    //this is getting username from user.
                    //string userName =  user.UserName;
                    Page.Validate();
                    if (Page.IsValid)
                    {
                        bool checkValue = storeSpController.CheckTempRoleAndDates(tempRoleCode, startDate, endDate);

                        if (checkValue)
                        {
                            storeSpController.CreateNewAssignRole(assignRoleCode, tempRoleCode, empCode, startDate, endDate, "yufei@logic.edu.sg");
                            PopulateGridView(tbxSearch.Text);
                            lblSuccessMsg.Text = "New AssignRole added.";
                            lblErrorMsg.Text = "";

                        }
                        else
                        {
                            lblSuccessMsg.Text = "";
                            lblErrorMsg.Text = "StoreSuperVisor already present for this period";

                        }

                    }
                    else
                    {
                        lblSuccessMsg.Text = "";
                        lblErrorMsg.Text = "Invalid Dates";

                    }
                }
            }
            catch (Exception ex)
            {

                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }

        protected void gvSearchResult_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                GridViewRow row = gvSearchResult.Rows[e.RowIndex];
                string empCode = gvSearchResult.DataKeys[e.RowIndex].Value.ToString();

                
                string assignCode = storeSpController.GetAssignRoleCode(empCode);

                if (assignCode != null)
                {
                    storeSpController.DeleteAssignRoleByAssignCode(assignCode);
                    lblSuccessMsg.Text = "Selected record Deleted.";
                    lblErrorMsg.Text = "";
                    PopulateGridView(tbxSearch.Text);
                    
                }
                else
                {
                    lblSuccessMsg.Text = "";
                    lblErrorMsg.Text = "Cann't Delete.Don't have any TemporaryRole";
                }
            }
            catch (Exception ex)
            {

                lblSuccessMsg.Text = "";
                lblErrorMsg.Text = ex.Message;
            }
        }
    }
    }
