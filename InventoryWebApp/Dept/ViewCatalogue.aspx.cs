using InventoryWebApp.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.Dept
{
    public partial class ViewCatalogue : System.Web.UI.Page
    {
        EmployeeController ec = new EmployeeController();
        string RequestC;
        Request RO;
        static List<StationeryCatalogue> list;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["REQUESTCODE"] != null)
            {
                RequestC = Request.QueryString["REQUESTCODE"];
                RO = ec.GetRequestbyRequestCode(RequestC);

            }
            if (!IsPostBack)
            {
                list = ec.Gridview();
                BindGrid();
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            list = ec.Gridview();
            string keyword = txbkeyword.Text;
            string type = ddlSearchBy.Text;
            if (type == "Description")
            {
                list = ec.SearchByDescription(keyword);
            }
            else if (type == "Stationery Number")
            {
                list = ec.SearchByItemCode(keyword);
            }
            else if (type == "Category")
            {
                list = ec.SearchByCategoryCode(keyword);
            }
            else if (list == null)
            {
                lblSearch.Text = "No result found";
            }
            try
            {
                this.gvCatalogue.DataSource = list;
                this.gvCatalogue.DataBind();
            }
            catch (Exception ex)
            {
                string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
                Response.Write(errormsg);
            }
        }
        private void BindGrid()
        {
            gvCatalogue.DataSource = list;
            gvCatalogue.DataBind();
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCatalogue.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected bool IsRedirect()
        {
            if (Request.QueryString["REQUESTCODE"] != null)
            {
                return true;
            }
            else
                return false;
        }

        protected void gvCatalogue_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string itcode;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HyperLink HyperLink1 = e.Row.FindControl("itemcode") as HyperLink;
                itcode = HyperLink1.Text;
                if (IsRedirect())
                {
                    HyperLink1.NavigateUrl = "ItemDetails.aspx?ItemCode=" +
                         itcode + "&REQUESTCODE=" + RequestC;
                }
                else
                {
                    HyperLink1.NavigateUrl = "ItemDetails.aspx?ItemCode=" +
                         itcode;
                }

            }


        }
    }





}
