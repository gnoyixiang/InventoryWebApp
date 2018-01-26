using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace InventoryWebApp.DAO
{

    public class DisbursementDAO : IDisbursementDAO
    {


        //Create
        public int AddDisbursement(Disbursement disbursement)
        {
            using (EntityModel em = new EntityModel())
            {
                try
                {
                    em.Disbursements.Add(disbursement);
                    em.SaveChanges();
                    return 1;
                }
                catch (Exception e)
                {
                    return 0;
                }
            }

        }

        //Read
        public List<Disbursement> GetAllDisbursement()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Disbursements.ToList();
            }
        }

        public Disbursement GetDisbursementByCode(String disbursementCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Disbursements.Where(d => d.DisbursementCode == (disbursementCode)).FirstOrDefault();
            }
        }
        public Disbursement GetDisbursingDisburmentByDeptCode(String deptCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Disbursements.Where(d => d.Status == "disbursing" && d.DepartmentCode == deptCode).FirstOrDefault();
            }
        }
        public List<Disbursement> SearchDisbursementByCode(String disbursementCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Disbursements.Where(d => d.DisbursementCode.Contains(disbursementCode)).ToList();
            }
        }
        public List<Disbursement> SearchDbmByDateDisbursed(DateTime date)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Disbursements.Where(d => d.DateDisbursed == date).ToList();
            }
        }
        public List<Disbursement> SearchDbmByPeriodDisbursed(DateTime date1, DateTime date2)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Disbursements.Where(d => d.DateDisbursed >= date1 && d.DateDisbursed <= date2).ToList();
            }
        }
        public List<Disbursement> SearchDbmByDateCreated(DateTime date)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Disbursements.Where(d => d.DateCreated == date).ToList();
            }
        }
        public List<Disbursement> SearchDbmByPeriodCreated(DateTime date1, DateTime date2)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Disbursements.Where(d => d.DateCreated >= date1 && d.DateCreated <= date2).ToList();
            }
        }
        public List<Disbursement> SearchDbmByDepartment(Department department)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Disbursements.Where(d => d.Department.DepartmentCode == department.DepartmentCode).ToList();
            }
        }

        public List<Disbursement> SearchDbmByDepartment(String departmentCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Disbursements.Where(d => d.Department.DepartmentCode == departmentCode).ToList();
            }
        }

        public List<Disbursement> SearchDbmByStatus(String status)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Disbursements.Where(d => d.Status == status).ToList();
            }
        }

        //Update
        public int UpdateDisbursement(Disbursement d)
        {
            using (EntityModel em = new EntityModel())
            {
                Disbursement disbursement = em.Disbursements.Where(db => db.DisbursementCode == d.DisbursementCode).FirstOrDefault();
                if (disbursement != null)
                {
                    disbursement.DateCreated = d.DateCreated;
                    disbursement.Status = d.Status;
                    disbursement.DepartmentCode = d.DepartmentCode;
                    disbursement.DateDisbursed = d.DateDisbursed;
                    disbursement.Notes = d.Notes;
                    disbursement.UserName = d.UserName;
                    disbursement.ReceivedBy = d.ReceivedBy;
                    disbursement.CollectionPointCode = d.CollectionPointCode;
                    disbursement.DatePlanToCollect = d.DatePlanToCollect;
                    disbursement.DisbursementDetails = d.DisbursementDetails;
                    em.SaveChanges();
                    return 1;
                }
                else
                    return 0;
            }

        }

        public int UpdateDbmStatus(Disbursement d)
        {
            using (EntityModel em = new EntityModel())
            {
                Disbursement disbursement = em.Disbursements.Where(db => db.DisbursementCode == d.DisbursementCode).FirstOrDefault();
                disbursement.Status = d.Status;
                disbursement.ReceivedBy = d.ReceivedBy;
                disbursement.DateDisbursed = d.DateDisbursed;
                disbursement.Notes = d.Notes;
                disbursement.DateCreated = d.DateCreated;
                disbursement.CollectionPointCode = d.CollectionPointCode;
                disbursement.DatePlanToCollect = d.DatePlanToCollect;
                return em.SaveChanges();
            }
        }

        public int UpdateDbmDisbursementDetail(Disbursement d)
        {
            using (EntityModel em = new EntityModel())
            {
                Disbursement disbursement = em.Disbursements.Where(db => db.DisbursementCode == d.DisbursementCode).FirstOrDefault();
                if (disbursement != null)
                {
                    disbursement.DisbursementDetails = d.DisbursementDetails;
                    em.SaveChanges();
                    return 1;
                }
                else
                    return 0;
            }
        }


    }
}