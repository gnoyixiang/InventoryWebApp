using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp
{
    public class BusinessLogic
    {
        EntityModel em;

        //For stationery items
        public StationeryCatalogue getItem (String stationeryCode)
        {
            em = new EntityModel();
            return em.StationeryCatalogues.Where(s => s.ItemCode == stationeryCode).First();
        }

        //For request
        public List<Request> getRequestList()
        {
            em = new EntityModel();
            return em.Requests.ToList();

        }
        public Request getRequest(String requestCode)
        {
            em = new EntityModel();
            return em.Requests.Where(r => r.RequestCode == requestCode).FirstOrDefault<Request>();
        }
        public List<Request> getNotDisbursedRequestList()
        {
            em = new EntityModel();
            List<Request> rList = em.Requests.Where(r => r.Status != "pending" && r.Status != "disbursed").ToList();
            return rList;
        }
        public List<Request> getRequestListByStatus(String status)
        {
            em = new EntityModel();
            return em.Requests.Where(r => r.Status == status).ToList();
        }
        
        //For request details
        public List<RequestDetail> getNotDisbursedRequestDetails()
        {
            em = new EntityModel();
            List<RequestDetail> rdList = em.RequestDetails.Where(rd => rd.Status != "pending" && rd.Status != "disbursed").ToList();
            return rdList;
        }
        public int? getQuantOfRequestDetail(RequestDetail rd)
        {
            em = new EntityModel();
            return em.RequestDetails.Where(rdetail => rdetail.RequestCode == rd.RequestCode && rdetail.ItemCode == rd.ItemCode).Select(rdetail => rdetail.Quantity).FirstOrDefault<int?>();
        }


        //For department
        public Department getDeptByCode(String DepartmentCode)
        {
            em = new EntityModel();
            return em.Departments.Where(d =>  d.DepartmentCode== DepartmentCode).First();
        }

        
        

        

    }
}
