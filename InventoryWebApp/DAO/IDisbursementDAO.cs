using System;
using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IDisbursementDAO
    {
        int AddDisbursement(Disbursement disbursement);
        Disbursement GetDisbursementByCode(string disbursementCode);
        List<Disbursement> SearchDbmByDateCreated(DateTime date);
        List<Disbursement> SearchDbmByDateDisbursed(DateTime date);
        List<Disbursement> SearchDbmByDepartment(string departmentCode);
        List<Disbursement> SearchDbmByDepartment(Department department);
        List<Disbursement> SearchDbmByPeriodCreated(DateTime date1, DateTime date2);
        List<Disbursement> SearchDbmByPeriodDisbursed(DateTime date1, DateTime date2);
        List<Disbursement> SearchDbmByStatus(string status);
        List<Disbursement> SearchDisbursementByCode(string disbursementCode);
        int UpdateDbmDisbursementDetail(Disbursement d);
        int UpdateDbmStatus(Disbursement d);
        int UpdateDisbursement(Disbursement d);
    }
}