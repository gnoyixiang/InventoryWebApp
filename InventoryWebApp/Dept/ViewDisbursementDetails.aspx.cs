﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.Dept
{
    public partial class ViewDisbursementDetails : System.Web.UI.Page
    {
        StoreClerkController sc = new StoreClerkController();
        EmployeeController ec = new EmployeeController();
        string dCode;
        string rCode;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["DISBURSEMENTCODE"] != null && Request.QueryString["REQUESTCODE"] != null)
            {
                dCode = Request.QueryString["DISBURSEMENTCODE"];
                rCode = Request.QueryString["REQUESTCODE"];
            }
            else if (Request.QueryString["DISBURSEMENTCODE"] != null && Request.QueryString["REQUESTCODE"] == null)
            {
                dCode = Request.QueryString["DISBURSEMENTCODE"];
            }
            else
            {
                Panel2.Visible = true;
                Panel1.Visible = false;
                return;
            }

            if (!IsPostBack)
            {
                lblDisbursementCode.Text = dCode;
                lvDisbursementDetails.DataSource = sc.GetDisbursementDetails(dCode);
                lvDisbursementDetails.DataBind();
                //if (rCode != null)
                //{
                //    lblRequestCode.Enabled = true;
                //    lblRequestCode.Text = rCode;
                //}
                //else
                //    lblRequestCode.Text = "-";

                lblStatus.Text = ((string)sc.GetDisbursement(dCode).Status).ToUpper();
                lblVenue.Text = sc.GetCollectionPointByCode(sc.GetDisbursement(dCode).CollectionPointCode).CollectionVenue;

                lblDisbursementDate.Text = ((DateTime)sc.GetDisbursement(dCode).DatePlanToCollect).ToString("dd MMM yyyy") + " at " + DateTime.Today.Add((TimeSpan)sc.GetCollectionPointByCode(sc.GetDisbursement(dCode).CollectionPointCode).CollectionTime).ToString("hh:mm tt");


            }
        }

        protected String GetItemDescription(String itemCode)
        {
            return sc.GetItemDescription(itemCode);
        }


    }
}