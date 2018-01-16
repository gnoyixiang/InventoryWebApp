using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using InventoryWebApp.Models;

namespace InventoryWebApp
{
    public partial class RequisitionList : System.Web.UI.Page
    {
        Models.EntityModel em = new Models.EntityModel();
        static private readonly string[] SEARCH_ITEMS = { "--Select Category--", "RequestCode", "DateCreated", "Status" };

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

            ListView1.DataSource = GetAllRequest();
            ListView1.DataBind();
        }


        private List<Request> GetAllRequest()
        {
            var listRequest = em.Requests.ToList();
            return listRequest;
        }      

        private List<Request> SearchRequest(string SearchParam, string SearchString)
        {

            using (em)
            {
                if (SearchParam == "RequestCode")
                {
                    return em.Requests.Where(b => b.RequestCode.ToUpper().Contains(SearchString.Trim().ToUpper())).ToList();
                }
                if (SearchParam == "Status")
                {
                    return em.Requests.Where(b => b.Status.ToUpper().Contains(SearchString.Trim().ToUpper())).ToList();
                }
                if (SearchParam == "DateCreated")
                {
                    return em.Requests.Where(b => b.DateCreated==Convert.ToDateTime(SearchString)).ToList();
                }
                return em.Requests.ToList();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
                ListView1.DataSource = SearchRequest(DropDownList1.SelectedItem.ToString(), txtBxSearchRequisition.Text);
                ListView1.DataBind();
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("RequisitionList.aspx");
            txtBxSearchRequisition.Text = null;
        }
    }


}