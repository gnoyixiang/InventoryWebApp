using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "DepartmentService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select DepartmentService.svc or DepartmentService.svc.cs at the Solution Explorer and start debugging.
    public class DepartmentService : IDepartmentService
    {
        DepartmentHeadController dCon = new DepartmentHeadController();
        ILoginService loginService = new LoginService();

        public List<WCFRequest> ListAllPendingRequest(string deptCode, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                List<WCFRequest> wcfReqList = new List<WCFRequest>();
                List<Request> rlist = dCon.ListPendingRequest(deptCode);
                foreach (Request r in rlist)
                {
                    string empName = dCon.GetEmployeeName(r.UserName);
                    wcfReqList.Add(new WCFRequest(r.RequestCode, r.DepartmentCode, string.Format("{0:dd/MM/yyyy}", r.DateCreated)
                        , r.Status, r.Notes, r.UserName, empName));
                }
                return wcfReqList;
            }
            else
            {
                return null;
            }
        }

        public List<WCFRequestDetail> ListRequestDetail(string code, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                List<WCFRequestDetail> wcfReqDetailList = new List<WCFRequestDetail>();
                List<RequestDetail> rqlist = dCon.ListRequestDetail(code);
                foreach (RequestDetail rq in rqlist)
                {

                    StationeryCatalogue s = dCon.GetStationeryCatalogue(rq.ItemCode);
                    string category = s.CategoryCode;
                    string description = s.Description;
                    //string description = dCon.GetDescription(rq.ItemCode);
                    wcfReqDetailList.Add(new WCFRequestDetail(rq.ItemCode, rq.Quantity.ToString(), category, description));

                }
                return wcfReqDetailList;
            }
            else
            {
                return null;
            }
        }

        public String Update(WCFRequest r, string email, string password)
        {
            if (loginService.ValidateUser(email, password))
            {
                //try {
                Request req = new Request
                {
                    RequestCode = r.RequestCode,
                    Status = r.Status,
                    ApprovedBy = r.ApprovedBy,
                    HeadRemarks = r.HeadRemark,
                    DateApproved = DateTime.Now

                };
                dCon.UpdateRequest(req, req.Status);
                return "success";
                //}catch(Exception ex)
                //{
                // return ex.Message;
                //}
            }
            else
            {
                return null;
            }
        }
    }
}