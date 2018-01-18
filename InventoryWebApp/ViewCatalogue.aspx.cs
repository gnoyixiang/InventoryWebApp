using InventoryWebApp.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class ViewCatalogue : System.Web.UI.Page
    {
        EmployeeController ec = new EmployeeController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                try
                {
                    BindGrid();
                }
                catch (Exception ex)
                {
                    string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
                    Response.Write(errormsg);
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var list = ec.Gridview();
            string keyword = txbkeyword.Text;
            string type = ddlSearchBy.Text;
            if(type == "Description")
            {
                list = ec.SearchByDescription(keyword);
            }
            else if(type == "Stationery Number")
            {
                list = ec.SearchByItemCode(keyword);
            }
            else if (type == "Category")
            {
                list = ec.SearchByCategoryCode(keyword);
            }
            try
            {
                this.gvCatalogue.DataSource = list;
                this.gvCatalogue.DataBind();
            }
            catch(Exception ex)
            {
                string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
                Response.Write(errormsg);
            }
        }
        private void BindGrid()
        {
            gvCatalogue.DataSource = ec.Gridview();
            gvCatalogue.DataBind();
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCatalogue.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}