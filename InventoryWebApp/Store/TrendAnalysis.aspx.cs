using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;

namespace InventoryWebApp.Store
{
    public partial class TrendAnalysis : System.Web.UI.Page
    {
        public static string TrendTitle;
        public static string TrendSubTitle;
        public static string xAxisTitle;
        public static string yAxisTitle;
        public static List<string> Months = new List<string> {"Jan","Feb", "Mar", "Apr", "May", "Jun", "Jul",  "Aug",
            "Sep", "Oct", "Nov", "Dec"};
        public static List<string> Year = new List<string> { "2013", "2014", "2015", "2016", "2017", "2018" };
        public string monthData { get; set; }
        public string SeriesTitle1;
        public string SeriesTitle2;
        public string SeriesTitle3;
        public string Seriesdata1 { get; set; }
        public string Seriesdata2 { get; set; }
        public string Seriesdata3 { get; set; }
        public int count;

        public List<double> SeriesData1 = new List<double>();
        public List<double> SeriesData2 = new List<double>();
        public List<double> SeriesData3 = new List<double>();
        public List<string> MonthData = new List<string>();

        static private readonly int[] COUNT_ITEMS = { 2, 3 };

        StoreClerkController sc = new StoreClerkController();
        EmployeeController ec = new EmployeeController();
        TrendAnalysisController tc = new TrendAnalysisController();
        JavaScriptSerializer jss = new JavaScriptSerializer();

        static private readonly string[] SEARCH_ITEMS = { "Department and Item Requisition", "Supplier and Item Price" };
        public List<DateTime> monthList = new List<DateTime>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rblAnalysisType.DataSource = SEARCH_ITEMS;
                rblAnalysisType.DataBind();
                rblAnalysisType.SelectedIndex = 0;

                ddlCount.DataSource = COUNT_ITEMS;
                ddlCount.DataBind();
                ddlmonthsCount.DataSource = COUNT_ITEMS;
                ddlmonthsCount.DataBind();
            }

        }


        private void PropogateGraph(string dptCode, string itemCat, int month)
        {

        }

        protected void btnAnalysis_Click(object sender, EventArgs e)
        {


            if (rblAnalysisType.SelectedIndex == 0)
            {
                panelMonth.Visible = true;
                panelMonth.Enabled = true;
                lblMonth.Visible = true;
                tbMonth.Visible = true;
                PanelDept.Visible = true;
                PanelSupplier.Visible = false;
                cvalidSup.Enabled = false;
                cvYear.Enabled = false;
                cvMonth.Enabled = true;
                lblDept.Visible = true;
                ddlDept.Visible = true;
                pYear.Visible = false;
                cvalidDept.Enabled = true;
                cvMonth.Enabled = true;
                PanelSupplier.Enabled = false;



                if (ddlmonthsCount.SelectedIndex >= 0)
                {
                    lblMonth2.Visible = true;
                    tbMonth2.Visible = true;
                    lblMonth3.Visible = false;
                    tbMonth3.Visible = false;

                    if (ddlmonthsCount.SelectedIndex == 1)
                    {
                        lblMonth3.Visible = true;
                        tbMonth3.Visible = true;
                    }
                }


                ddlDept.DataSource = sc.ListAllDepartmentName();
                ddlDept.DataBind();
                ddlCatCode.DataSource = ec.ListAllStationeryCategory();
                ddlCatCode.DataBind();
                if (ddlCount.SelectedIndex >= 0)
                {
                    lblDept2.Visible = true;
                    ddlDept2.Visible = true;
                    lblDept3.Visible = false;
                    ddlDept3.Visible = false;
                    ddlDept2.DataSource = sc.ListAllDepartmentName();
                    ddlDept2.DataBind();

                    if (ddlCount.SelectedIndex >= 1)
                    {
                        lblDept3.Visible = true;
                        ddlDept3.Visible = true;
                        ddlDept3.DataSource = sc.ListAllDepartmentName();
                        ddlDept3.DataBind();
                    }
                }

            }
            else if (rblAnalysisType.SelectedIndex == 1)
            {
                panelMonth.Visible = false;
                panelMonth.Enabled = false;
                PanelDept.Enabled = false;
                lblMonth.Visible = false;
                tbMonth.Visible = true;
                PanelDept.Visible = false;
                PanelSupplier.Visible = true;
                PanelSupplier.Enabled = true;
                cvalidDept.Enabled = false;
                cvalidSup.Enabled = true;
                cvMonth.Enabled = false;
                cvYear.Enabled = true;
                lblDept.Visible = false;
                ddlDept.Visible = false;
                lblYear.Visible = true;
                pYear.Visible = true;
                pYear.Enabled = true;
                lblYear.Visible = true;
                ddlYear.Visible = true;
                ddlYear.DataSource = Year;
                ddlYear.DataBind();
                ddlItemCode.DataSource = tc.ListAllItemCode();
                ddlItemCode.DataBind();


                if (ddlmonthsCount.SelectedIndex >= 0)
                {
                    lblYear2.Visible = true;
                    ddlYear2.Visible = true;
                    ddlYear2.DataSource = Year;
                    ddlYear2.DataBind();
                    lblYear3.Visible = false;
                    ddlYear3.Visible = false;


                    if (ddlmonthsCount.SelectedIndex == 1)
                    {
                        lblYear3.Visible = true;
                        ddlYear3.Visible = true;
                        ddlYear3.DataSource = Year;
                        ddlYear3.DataBind();
                    }
                }

                lblSupplier.Visible = true;
                ddlSupplier.Visible = true;
                ddlSupplier.DataSource = tc.ListAllSupplierName();
                ddlSupplier.DataBind();
                ddlCatCode.DataSource = tc.ListAllItemCode();
                ddlCatCode.DataBind();
                if (ddlCount.SelectedIndex >= 0)
                {
                    lblSupplier2.Visible = true;
                    ddlSupplier2.Visible = true;
                    lblSupplier3.Visible = false;
                    ddlSupplier3.Visible = false;
                    ddlSupplier2.DataSource = tc.ListAllSupplierName();
                    ddlSupplier2.DataBind();

                    if (ddlCount.SelectedIndex >= 1)
                    {
                        lblSupplier3.Visible = true;
                        ddlSupplier3.Visible = true;
                        ddlSupplier3.DataSource = tc.ListAllSupplierName();
                        ddlSupplier3.DataBind();
                    }
                }


            }
            btnGenerateGraph.Visible = true;
            PanelTable.Visible = false;
        }

        private void PropogateDeptGraph()
        {


        }

        protected void btnGenerateGraph_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }


            if (rblAnalysisType.SelectedValue == "Department and Item Requisition")
            {
                DateTime month1 = Convert.ToDateTime(tbMonth.Text);
                DateTime month2 = Convert.ToDateTime(tbMonth2.Text);

                PanelTable.Visible = true;

                monthList.Add(month1);
                monthList.Add(month2);
                if (ddlmonthsCount.SelectedIndex == 1)
                {
                    DateTime month3 = Convert.ToDateTime(tbMonth3.Text);
                    monthList.Add(month3);
                }
                monthList.Sort();

                TrendTitle = "Analysis of Department's Category Requisition";
                MonthData.Add(/*tbMonth.Text*/monthList[0].ToString("yyyy-MM"));
                SeriesData1.Add(ec.GetCategoryQuantityByDept(ddlDept.SelectedValue, ddlCatCode.SelectedValue,
                    (/*Convert.ToDateTime(tbMonth.Text)*/monthList[0].Month), (/*Convert.ToDateTime(tbMonth.Text)*/monthList[0].Year)));
                SeriesTitle1 = ddlDept.SelectedValue;
                if (ddlCount.SelectedIndex == 0)
                {
                    SeriesData2.Add(ec.GetCategoryQuantityByDept(ddlDept2.SelectedValue, ddlCatCode.SelectedValue,
                        (/*Convert.ToDateTime(tbMonth.Text)*/monthList[0].Month), (/*Convert.ToDateTime(tbMonth.Text)*/monthList[0].Year)));
                    SeriesTitle2 = ddlDept2.SelectedValue;

                    if (ddlmonthsCount.SelectedIndex >= 0)
                    {
                        SeriesData1.Add(ec.GetCategoryQuantityByDept(ddlDept.SelectedValue, ddlCatCode.SelectedValue,
                            (/*Convert.ToDateTime(tbMonth2.Text)*/monthList[1].Month), (/*Convert.ToDateTime(tbMonth2.Text)*/monthList[1].Year)));
                        SeriesData2.Add(ec.GetCategoryQuantityByDept(ddlDept2.SelectedValue, ddlCatCode.SelectedValue,
                            (/*Convert.ToDateTime(tbMonth2.Text)*/monthList[1].Month), (/*Convert.ToDateTime(tbMonth2.Text)*/monthList[1].Year)));
                        MonthData.Add(/*tbMonth2.Text*/monthList[1].ToString("yyyy-MM"));

                        if (ddlmonthsCount.SelectedIndex >= 1)
                        {
                            SeriesData1.Add(ec.GetCategoryQuantityByDept(ddlDept.SelectedValue, ddlCatCode.SelectedValue,
                                (/*Convert.ToDateTime(tbMonth3.Text)*/monthList[2].Month), (/*Convert.ToDateTime(tbMonth3.Text)*/monthList[2].Year)));
                            SeriesData2.Add(ec.GetCategoryQuantityByDept(ddlDept2.SelectedValue, ddlCatCode.SelectedValue,
                                (/*Convert.ToDateTime(tbMonth3.Text)*/monthList[2].Month), (/*Convert.ToDateTime(tbMonth3.Text)*/monthList[2].Year)));
                            MonthData.Add(/*tbMonth3.Text*/monthList[2].ToString("yyyy-MM"));

                        }
                    }

                }


                else if (ddlCount.SelectedIndex == 1)
                {
                    SeriesData2.Add(ec.GetCategoryQuantityByDept(ddlDept2.SelectedValue, ddlCatCode.SelectedValue,
                        (monthList[0].Month), (monthList[0].Year)));
                    SeriesData3.Add(ec.GetCategoryQuantityByDept(ddlDept3.SelectedValue, ddlCatCode.SelectedValue,
                       (monthList[0].Month), (monthList[0].Year)));
                    SeriesTitle2 = ddlDept2.SelectedValue;
                    SeriesTitle3 = ddlDept3.SelectedValue;
                    if (ddlmonthsCount.SelectedIndex >= 0)
                    {
                        SeriesData1.Add(ec.GetCategoryQuantityByDept(ddlDept.SelectedValue, ddlCatCode.SelectedValue,
                            (monthList[1].Month), (monthList[1].Year)));
                        SeriesData2.Add(ec.GetCategoryQuantityByDept(ddlDept2.SelectedValue, ddlCatCode.SelectedValue,
                            (monthList[1].Month), (monthList[1].Year)));
                        SeriesData3.Add(ec.GetCategoryQuantityByDept(ddlDept3.SelectedValue, ddlCatCode.SelectedValue,
                            (monthList[1].Month), (monthList[1].Year)));
                        MonthData.Add(monthList[1].ToString("yyyy-MM"));

                        if (ddlmonthsCount.SelectedIndex >= 1)
                        {
                            SeriesData1.Add(ec.GetCategoryQuantityByDept(ddlDept.SelectedValue, ddlCatCode.SelectedValue,
                                (monthList[2].Month), (monthList[2].Year)));
                            SeriesData2.Add(ec.GetCategoryQuantityByDept(ddlDept2.SelectedValue, ddlCatCode.SelectedValue,
                                (monthList[2].Month), (monthList[2].Year)));
                            SeriesData3.Add(ec.GetCategoryQuantityByDept(ddlDept3.SelectedValue, ddlCatCode.SelectedValue,
                                (monthList[2].Month), (monthList[2].Year)));
                            MonthData.Add(monthList[2].ToString("yyyy-MM"));

                        }
                    }

                }
            }
            else if (rblAnalysisType.SelectedValue == "Supplier and Item Price")
            {

                TrendTitle = "Analysis of Supplier Item Pricing";
                int year1 = Convert.ToInt32(ddlYear.SelectedValue);
                int year2 = Convert.ToInt32(ddlYear2.SelectedValue);
                int year3;
                List<int> yearList = new List<int>();
                yearList.Add(year1);
                yearList.Add(year2);
                if (ddlmonthsCount.SelectedIndex == 1)
                {
                    year3 = Convert.ToInt32(ddlYear3.SelectedValue);
                    yearList.Add(year3);
                }
                yearList.Sort();
                MonthData.Add(yearList[0].ToString());
                SeriesData1.Add(tc.GetPriceForAnalysis(ddlSupplier.Text, yearList[0], ddlItemCode.SelectedValue));
                SeriesTitle1 = ddlSupplier.SelectedValue;
                if (ddlCount.SelectedIndex == 0)
                {
                    SeriesData2.Add(tc.GetPriceForAnalysis(ddlSupplier2.Text,
                       yearList[0], ddlItemCode.SelectedValue));
                    SeriesTitle2 = ddlSupplier2.SelectedValue;

                    if (ddlmonthsCount.SelectedIndex >= 0)
                    {
                        SeriesData1.Add(tc.GetPriceForAnalysis(ddlSupplier.Text,
                       yearList[1], ddlItemCode.SelectedValue));
                        SeriesData2.Add(tc.GetPriceForAnalysis(ddlSupplier2.Text,
                        yearList[1], ddlItemCode.SelectedValue));
                        MonthData.Add(yearList[1].ToString());

                        if (ddlmonthsCount.SelectedIndex >= 1)
                        {
                            SeriesData1.Add(tc.GetPriceForAnalysis(ddlSupplier.Text,
                        yearList[2], ddlItemCode.SelectedValue));
                            SeriesData2.Add(tc.GetPriceForAnalysis(ddlSupplier2.Text,
                        yearList[2], ddlItemCode.SelectedValue));
                            MonthData.Add(yearList[2].ToString());

                        }
                    }

                }
                else if (ddlCount.SelectedIndex == 1)
                {
                    SeriesData2.Add(tc.GetPriceForAnalysis(ddlSupplier2.Text,
                        yearList[0], ddlItemCode.SelectedValue));
                    SeriesData3.Add(tc.GetPriceForAnalysis(ddlSupplier3.Text,
                       yearList[0], ddlItemCode.SelectedValue));
                    SeriesTitle2 = ddlSupplier2.SelectedValue;
                    SeriesTitle3 = ddlSupplier3.SelectedValue;
                    if (ddlmonthsCount.SelectedIndex >= 0)
                    {
                        SeriesData1.Add(tc.GetPriceForAnalysis(ddlSupplier.Text,
                        yearList[1], ddlItemCode.SelectedValue));
                        SeriesData2.Add(tc.GetPriceForAnalysis(ddlSupplier2.Text,
                        yearList[1], ddlItemCode.SelectedValue));
                        SeriesData3.Add(tc.GetPriceForAnalysis(ddlSupplier3.Text,
                        yearList[1], ddlItemCode.SelectedValue));
                        MonthData.Add(yearList[1].ToString());

                        if (ddlmonthsCount.SelectedIndex >= 1)
                        {
                            SeriesData1.Add(tc.GetPriceForAnalysis(ddlSupplier.Text,
                       yearList[2], ddlItemCode.SelectedValue));
                            SeriesData2.Add(tc.GetPriceForAnalysis(ddlSupplier2.Text,
                           yearList[2], ddlItemCode.SelectedValue));
                            SeriesData3.Add(tc.GetPriceForAnalysis(ddlSupplier3.Text,
                            yearList[2], ddlItemCode.SelectedValue));
                            MonthData.Add(yearList[2].ToString());
                        }
                    }

                }

                //monthData = jss.Serialize(MonthData); //this make your list in jSON format like [88,99,10]
                //Seriesdata1 = jss.Serialize(SeriesData1);
                //Seriesdata2 = jss.Serialize(SeriesData2);
                //Seriesdata3 = jss.Serialize(SeriesData3);
                //ScriptManager.RegisterClientScriptBlock(this, GetType(), "none", "<script>executeAfter();</script>", false);


            }
        }



        //for dept1

        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);

            monthData = jss.Serialize(MonthData); //this make your list in jSON format like [88,99,10]
            Seriesdata1 = jss.Serialize(SeriesData1);
            Seriesdata2 = jss.Serialize(SeriesData2);
            Seriesdata3 = jss.Serialize(SeriesData3);
            count = Convert.ToInt32(ddlCount.SelectedValue);
        }

        protected void cvalidDept_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (ddlDept.SelectedIndex != ddlDept2.SelectedIndex && ddlDept2.SelectedIndex != ddlDept3.SelectedIndex &&
                ddlDept3.SelectedIndex != ddlDept.SelectedIndex)
            {
                args.IsValid = true;

            }

            else args.IsValid = false;

        }

        protected void cvMonth_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var validator = (CustomValidator)source;
            if (ddlmonthsCount.SelectedIndex == 0)
            {
                if (String.IsNullOrEmpty(tbMonth.Text) || String.IsNullOrEmpty(tbMonth2.Text))
                {
                    args.IsValid = false;
                    validator.ErrorMessage = "All months must be selected";
                    return;
                }
            }
            if (ddlmonthsCount.SelectedIndex == 1)
            {
                if (String.IsNullOrEmpty(tbMonth.Text) || String.IsNullOrEmpty(tbMonth2.Text)
                    || String.IsNullOrEmpty(tbMonth3.Text))
                {
                    args.IsValid = false;
                    validator.ErrorMessage = "All months must be selected";
                    return;
                }
            }

            if (tbMonth.Text != tbMonth2.Text && tbMonth2.Text != tbMonth3.Text &&
                tbMonth3.Text != tbMonth.Text)
            {
                args.IsValid = true;


            }

            else args.IsValid = false;
            validator.ErrorMessage = "Month contains duplicate!!";
        }

        protected void cvSupplier_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (ddlSupplier.SelectedIndex != ddlSupplier2.SelectedIndex && ddlSupplier2.SelectedIndex != ddlSupplier3.SelectedIndex &&
               ddlSupplier3.SelectedIndex != ddlSupplier.SelectedIndex)
            {
                args.IsValid = true;

            }

            else args.IsValid = false;

        }

        protected void cvYear_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var validator = (CustomValidator)source;
            if (ddlmonthsCount.SelectedIndex == 0)
            {
                if (String.IsNullOrEmpty(ddlYear.SelectedValue) || String.IsNullOrEmpty(ddlYear2.SelectedValue))
                {
                    args.IsValid = false;
                    validator.ErrorMessage = "All years must be selected";
                    return;
                }
            }
            if (ddlmonthsCount.SelectedIndex == 1)
            {
                if (String.IsNullOrEmpty(ddlYear.SelectedValue) || String.IsNullOrEmpty(ddlYear2.SelectedValue)
                    || String.IsNullOrEmpty(ddlYear3.SelectedValue))
                {
                    args.IsValid = false;
                    validator.ErrorMessage = "All years must be selected";
                    return;
                }
            }

            if (ddlYear.SelectedValue != ddlYear2.SelectedValue && ddlYear2.SelectedValue != ddlYear3.SelectedValue &&
                ddlYear.SelectedValue != ddlYear3.SelectedValue)
            {
                args.IsValid = true;


            }

            else args.IsValid = false;
            validator.ErrorMessage = "Month contains duplicate!!";

        }
    }

}