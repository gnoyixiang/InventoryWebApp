using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface IDepartmentDAO
    {
        void AddDepartment(string deptCode, string deptName, string point, string contact, string phone, string fax, string head, string rep);
        void DeleteDepartment(string deptName);
        Department GetDepartmentInfo(string deptCode);
        List<Department> ListDepartment();
        List<Department> SearchByPoint(string point);
        void UpdateCollectionPoint(string deptCode, string point);
        void UpdateDepartment(string deptCode, string phone, string fax, string head);
        void UpdateRep(string deptCode, string rep);
    }
}