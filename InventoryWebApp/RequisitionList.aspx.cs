using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class RequisitionList : System.Web.UI.Page
    {
        BusinessLogic bl = new BusinessLogic();

        protected void Page_Load(object sender, EventArgs e)
        {
            List<Request> requestList = bl.getNotDisbursedRequestList();
            lvRequestList.DataSource = requestList;
            lvRequestList.DataBind();

            int? itemCount = 0;
            foreach (Request r in requestList)
            {
                foreach (RequestDetail rd in r.RequestDetails)
                {
                    itemCount += bl.getQuantOfRequestDetail(rd);
                }
            }
            //lblTest.Text = getTotalQuantOfRequest("RQ123456789").ToString() + "Test";

            lblTotalQuant.Text = itemCount.ToString();
        }

        protected int? getTotalQuantOfRequest(String requestCode)
        {
            List<RequestDetail> rdList;
            int? quant = 0;
            if (bl.getRequest(requestCode) != null)
            {
                rdList = bl.getRequest(requestCode).RequestDetails.ToList<RequestDetail>();

                quant = 0;
                foreach (RequestDetail rdetail in rdList)
                {
                    quant += rdetail.RemainingQuant;
                }
            }

            return quant;
        }
        protected Department getDeptByCode(String code)
        {
            return bl.getDeptByCode(code);
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("/RetrievalPage.aspx");
        }
    }
}