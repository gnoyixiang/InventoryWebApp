using System;
using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IAssignRoleDAO
    {
        int AddAssignRole(string assignrolecode, string temporaryrolecode, string employeecode, DateTime startdate, DateTime enddate, string assignedby);
        void DeleteAssignRole(string assignrolecode);
        AssignRole GetAssignRoleInfo(string assignrolecode);
        List<AssignRole> ListAssignRole();
        int UpdateAssignRole(string assignrolecode, string temporaryrolecode, DateTime startdate, DateTime enddate);
        int UpdateEndDate(string assignrolecode, DateTime enddate);
        int UpdateStartDate(string assignrolecode, DateTime startdate);
        int UpdateTemporaryRoleCode(string assignrolecode, string temporaryrolecode);
    }
}