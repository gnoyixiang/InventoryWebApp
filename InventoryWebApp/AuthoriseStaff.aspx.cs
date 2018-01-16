using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class AuthoriseStaff : System.Web.UI.Page
    {

        string assignrolecode;
        protected void Page_Load(object sender, EventArgs e)
        {
            assignrolecode = Request.QueryString["AssignRoleName"];
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            gv.DataSource = BusinessLogic.ListAssignRolesBy(assignrolecode);
            gv.DataBind();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            gv.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gv.Rows[e.RowIndex];
            string assignrolecode = gv.DataKeys[e.RowIndex].Values[0].ToString();
            String 
            string foodId = (row.FindControl("foodlist") as DropDownList).SelectedValue;
            string size = (row.FindControl("radio1") as RadioButtonList).SelectedValue;
            string chilli = (row.FindControl("radio2") as RadioButtonList).SelectedValue;
            string salt = (row.FindControl("radio3") as RadioButtonList).SelectedValue;
            string pepper = ((row.FindControl("CheckBox1") as CheckBox).Checked
                             ? "Y" : "N");

            BusinessLogic.UpdateAssignRole(orderId, foodId, size, chilli, salt, pepper);
            gv.EditIndex = -1;
            BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int orderId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            BusinessLogic.DeleteOrder(orderId);
            BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Order order = (Order)e.Row.DataItem;
                int id = order.FoodID.Value;
                string foodname = BusinessLogic.GetFoodName(id);

                Label foodlabel = (e.Row.FindControl("Label3A") as Label);
                if (foodlabel != null)
                    foodlabel.Text = foodname;

                DropDownList ddl = (e.Row.FindControl("foodlist") as DropDownList);
                if (ddl != null)
                {
                    ddl.DataSource = BusinessLogic.FoodChoice();
                    ddl.DataTextField = "FoodName";
                    ddl.DataValueField = "FoodID";
                    ddl.DataBind();
                    ddl.Items.FindByText(foodname).Selected = true;
                }

                RadioButtonList radio1 = (e.Row.FindControl("radio1") as RadioButtonList);
                if (radio1 != null)
                    radio1.Items.FindByValue(order.Size).Selected = true;
                RadioButtonList radio2 = (e.Row.FindControl("radio2") as RadioButtonList);
                if (radio2 != null)
                    radio2.Items.FindByValue(order.Chilli).Selected = true;
                RadioButtonList radio3 = (e.Row.FindControl("radio3") as RadioButtonList);
                if (radio3 != null)
                    radio3.Items.FindByValue(order.MoreSalt).Selected = true;
                CheckBox checkbox1 = (e.Row.FindControl("CheckBox1") as CheckBox);
                if (checkbox1 != null)
                    checkbox1.Checked = order.Pepper.Equals("Y");
            }

        }
    }