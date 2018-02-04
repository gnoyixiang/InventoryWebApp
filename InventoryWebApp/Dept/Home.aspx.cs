using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using System.Web.Script.Serialization;

namespace InventoryWebApp.Dept
{
    public partial class Home : System.Web.UI.Page
    {
        StoreClerkController scCtrl = new StoreClerkController();
        EmployeeController eCtrl = new EmployeeController();
        DepartmentHeadController dCtrl = new DepartmentHeadController();
        JavaScriptSerializer jss = new JavaScriptSerializer();


        protected void Page_Load(object sender, EventArgs e)
        {        
            lblDisbursementDate.Text = GetNextDisburseDateString();
            lblPendingRequests.Text = CountPendingRequests().ToString();
            lblCompletedRequests.Text = CountCompletedRequests().ToString();
            lblIncompleteRequests.Text = CountIncompleteRequests().ToString();
            lblUncollectedDisbursements.Text = CountUncollectedDisbursements().ToString();
            lblCollectionPtName.Text = GetDeptCollectionPtName(Master.UserDepartmentCode);
            lblCollectionTime.Text = GetDeptCollectionTimeString(Master.UserDepartmentCode);
            lblDeptRepName.Text = GetDeptRepName(Master.UserDepartmentCode);
            listDisbursements.DataSource = GetDisbursingDisbursementDetails();
            listDisbursements.DataBind();
        }

        private List<DisbursementDetail> GetDisbursingDisbursementDetails()
        {
            var d = scCtrl.GetDisbursingDisbursementByDeptCode(Master.UserDepartmentCode);
            if (d != null)
            {
                return scCtrl.GetDisbursementDetails(d.DisbursementCode);
            }
            return null;
        }


        public string Serialize(object o)
        {
            return jss.Serialize(o);
        }

        public List<Department> GetDepartments()
        {
            return scCtrl.ListDepartments().Where(d => d.DepartmentCode.ToUpper() != "STOR").ToList();
        }

        public List<string> GetCategories()
        {
            return scCtrl.GetCategories();
        }

        public List<string> GetListStationariesDescriptionInCat(string catCode)
        {
            return scCtrl.ListStationeries().Where(sc => sc.CategoryCode == catCode).Select(sc => sc.Description).ToList();
        }

        public List<int> GetRequestQtyPerItemInCatPerDept(string catCode)
        {
            List<int> series = new List<int>();  
            foreach(StationeryCatalogue s in scCtrl.ListStationeries().Where(sc=>sc.CategoryCode==catCode))          
            {
                int totalQuantity = 0;
                foreach (Request req in scCtrl.ListRequests().Where(req => ((req.Status.ToUpper() != "PENDING" && req.Status.ToUpper() != "REJECTED") 
                    && req.DepartmentCode == Master.UserDepartmentCode)))
                {
                    foreach (RequestDetail rd in scCtrl.GetRequestDetails(req.RequestCode))
                    {
                        if (rd.ItemCode == s.ItemCode)
                        {
                            totalQuantity += Convert.ToInt32(rd.Quantity);
                        }
                    }
                }
                series.Add(totalQuantity);
            }
            return series;
        }

        public List<int> GetCategoryDeptRequestQtySeries(string deptCode)
        {            
            List<string> categories = GetCategories();
            List<int> series = new List<int>();
            foreach (string cat in categories)
            {
                int totalQuantity = 0;
                foreach (Request req in scCtrl.ListRequests().Where(req=> ((req.Status.ToUpper() != "PENDING" && req.Status.ToUpper() != "REJECTED") && req.DepartmentCode == deptCode)))
                {
                    //if ((req.Status.ToUpper() != "PENDING" && req.Status.ToUpper() != "REJECTED") && req.DepartmentCode==deptCode)
                    //{
                        foreach (RequestDetail rd in scCtrl.GetRequestDetails(req.RequestCode))
                        {
                            if (scCtrl.GetCategoryOfStationery(rd.ItemCode) == cat)
                            {
                                totalQuantity += Convert.ToInt32(rd.Quantity);
                            }
                        }
                    //}
                }
                series.Add(totalQuantity);
            }
            return series;
        }

        private int CountPendingRequests()
        {
            return eCtrl.ListAllRequest().Where(r => r.Status.ToUpper() == "PENDING" && r.DepartmentCode== Master.UserDepartmentCode ).Count();
        }

        private int CountCompletedRequests()
        {
            return eCtrl.ListAllRequest().Where(r => r.Status.ToUpper() == "COMPLETED" && r.DepartmentCode == Master.UserDepartmentCode).Count();
        }

        private int CountIncompleteRequests()
        {
            return eCtrl.ListAllRequest().Where(r => r.Status.ToUpper() == "INCOMPLETED" && r.DepartmentCode == Master.UserDepartmentCode).Count();
        }

        private int CountUncollectedDisbursements()
        {
            return scCtrl.GetAllDisbursement().Where(d => d.DepartmentCode == Master.UserDepartmentCode && d.Status.ToUpper() == "NOT COLLECTED").Count();
        }

        
        private string GetNextDisburseDateString()
        {
            var list = scCtrl.GetDisbursingDisbursements().Where(d=>d.DepartmentCode == Master.UserDepartmentCode).ToList();
            if (list.Count > 0)
            {
                return Convert.ToDateTime(list.Min(d => d.DatePlanToCollect)).ToString("d MMM yyyy");
            }
            return "No Next Disbursement At The Moment.";
        }

        protected string GetDepartmentName(string deptCode)
        {
            try
            { 
                return scCtrl.GetDeptByCode(deptCode).DepartmentName;
            }
            catch (NullReferenceException ex)
            {
                return "";
            }
        }
        protected string GetDeptCollectionPtName(string deptCode)
        {
            try
            {
                string deptName = eCtrl.GetDeptNameByCode(deptCode);
                return eCtrl.GetCollectionPointnameByCode(eCtrl.GetCollectionPoint(deptName));
            }
            catch (NullReferenceException ex)
            {
                return "";
            }
        }
        protected string GetDeptCollectionTimeString(string deptCode)
        {
            try
            {
                string collectionPtCode = eCtrl.GetCollectionPoint(eCtrl.GetDeptNameByCode(deptCode));
                return ((TimeSpan)scCtrl.GetCollectionPointByCode(collectionPtCode).CollectionTime).ToString(@"hhmm") + " h";
            }
            catch (Exception ex)
            {
                return "";
            }
        }
        
        protected string GetDeptRepName(string deptCode)
        {
            try
            {
                AssignRole assignRole = dCtrl.ListOfAssignRoleInDepartment(deptCode).Where(ar => ar.TemporaryRoleCode.ToUpper() == "REP").FirstOrDefault();
                return dCtrl.GetEmployeeName(assignRole.EmployeeCode);
            }
            catch (Exception ex)
            {
                return "";
            }
        }
        protected string GetItemDescription(string itemCode)
        {
            try
            {                
                return scCtrl.GetItemDescription(itemCode);
            }
            catch (Exception ex)
            {
                return "";
            }
        }

    }
}