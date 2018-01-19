using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IDepartmentDAO
    {
        int AddDepartment(Department dept);
        Department GetDepartmentInfo(string deptCode);
        List<Department> ListDepartment();
        List<Department> SearchByPoint(string point);
        int UpdateCollectionPoint(Department dpt);
        int UpdateDepartment(string deptCode, string phone, string fax, string head);
        int UpdateRep(string deptCode, string rep);
        string GetDepartCode(string userName);
    }
}