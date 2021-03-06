﻿using System;
using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IAssignRoleDAO
    {
        int AddAssignRole(string assignrolecode, string temporaryrolecode, string employeecode, DateTime startdate, DateTime enddate, string assignedby);
        int AddTemporaryRole(string assignrolecode, string temporaryrolecode,string employeecode);
        void DeleteAssignRole(string assignrolecode);
        AssignRole GetAssignRoleInfo(string assignrolecode);
        List<AssignRole> ListAssignRole();
        List<AssignRole> SearchByEmployeeCode(string employeecode);
        int UpdateAssignRole(string assignrolecode, string temporaryrolecode, DateTime startdate, DateTime enddate);
        int UpdateAssignRole(string assignrolecode, string temporaryrolecode, string empCode, DateTime startdate, DateTime enddate,string assignedBy);
        int UpdateEndDate(string assignrolecode, DateTime enddate);
        int UpdateStartDate(string assignrolecode, DateTime startdate);
        int UpdateTemporaryRoleCode(string assignrolecode, string temporaryrolecode);

        string GetTemporaryRoleCode(string empcode);
        
        int UpdateAssignRole(AssignRole role);
        List<AssignRole> ListAssignRoleByEmpCode(string empCode);
    }
}