﻿using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace InventoryWebApp.DAO
{

    public class DisbursementDAO : IDisbursementDAO
    {
        EntityModel em;

        //Create
        public int AddDisbursement(Disbursement disbursement)
        {
            em = new EntityModel();
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

        //Read
        public List<Disbursement> GetAllDisbursement()
        {
            em = new EntityModel();
            return em.Disbursements.ToList();
        }

        public Disbursement GetDisbursementByCode(String disbursementCode)
        {
            em = new EntityModel();
            return em.Disbursements.Where(d => d.DisbursementCode == (disbursementCode)).FirstOrDefault();
        }
        public Disbursement GetDisbursingDisburmentByDeptCode(String deptCode)
        {
            em = new EntityModel();
            return em.Disbursements.Where(d => d.Status == "disbursing" && d.DepartmentCode == deptCode).First();
        }
        public List<Disbursement> SearchDisbursementByCode(String disbursementCode)
        {
            em = new EntityModel();
            return em.Disbursements.Where(d => d.DisbursementCode.Contains(disbursementCode)).ToList();
        }
        public List<Disbursement> SearchDbmByDateDisbursed(DateTime date)
        {
            em = new EntityModel();
            return em.Disbursements.Where(d => d.DateDisbursed == date).ToList();
        }
        public List<Disbursement> SearchDbmByPeriodDisbursed(DateTime date1, DateTime date2)
        {
            em = new EntityModel();
            return em.Disbursements.Where(d => d.DateDisbursed >= date1 && d.DateDisbursed <= date2).ToList();
        }
        public List<Disbursement> SearchDbmByDateCreated(DateTime date)
        {
            em = new EntityModel();
            return em.Disbursements.Where(d => d.DateCreated == date).ToList();
        }
        public List<Disbursement> SearchDbmByPeriodCreated(DateTime date1, DateTime date2)
        {
            em = new EntityModel();
            return em.Disbursements.Where(d => d.DateCreated >= date1 && d.DateCreated <= date2).ToList();
        }
        public List<Disbursement> SearchDbmByDepartment(Department department)
        {
            em = new EntityModel();
            return em.Disbursements.Where(d => d.Department.DepartmentCode == department.DepartmentCode).ToList();
        }

        public List<Disbursement> SearchDbmByDepartment(String departmentCode)
        {
            em = new EntityModel();
            return em.Disbursements.Where(d => d.Department.DepartmentCode == departmentCode).ToList();
        }

        public List<Disbursement> SearchDbmByStatus(String status)
        {
            em = new EntityModel();

            return em.Disbursements.Where(d => d.Status == status).ToList();
        }

        //Update
        public int UpdateDisbursement(Disbursement d)
        {
            em = new EntityModel();
            em.Entry(d).State = EntityState.Modified;
            return em.SaveChanges();

        }

        public int UpdateDbmStatus(Disbursement d)
        {
            em = new EntityModel();
            Disbursement disbursement = em.Disbursements.Where(db => db.DisbursementCode == d.DisbursementCode).FirstOrDefault();
            if (disbursement != null)
            {
                disbursement.Status = d.Status;
                disbursement.ReceivedBy = d.ReceivedBy;
                disbursement.DateDisbursed = d.DateDisbursed;
                disbursement.DisbursementDetails = d.DisbursementDetails;
                disbursement.Notes = d.Notes;
                disbursement.DateCreated = d.DateCreated;
                disbursement.CollectionPointCode = d.DisbursementCode;
                em.SaveChanges();
                return 1;
            }
            else
                return 0;
        }

        public int UpdateDbmDisbursementDetail(Disbursement d)
        {
            em = new EntityModel();
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