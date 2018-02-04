using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IDepartmentService" in both code and config file together.
    [ServiceContract]
    public interface IDepartmentService
    {

        [OperationContract]
        [WebGet(UriTemplate = "/List/{code}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCFRequest> ListAllPendingRequest(string code, string email, string password);

        [OperationContract]
        [WebGet(UriTemplate = "/Detail/{code}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCFRequestDetail> ListRequestDetail(string code, string email, string password);

        [OperationContract]
        [WebInvoke(UriTemplate = "/Update/{email}/{password}", Method = "POST", RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
        String Update(WCFRequest r, string email, string password);



        [OperationContract]
        [WebGet(UriTemplate = "/AssignRole/AssignRoleCode/{assignrolecode}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        WCFAssignRole GetAssignRole(string assignrolecode, string email, string password);


        /*[OperationContract]
        [WebGet(UriTemplate = "/AssignRoles", ResponseFormat = WebMessageFormat.Json)]
        List<WCFAssignRole> GetListAssignrole();*/

        [OperationContract]
        [WebGet(UriTemplate = "/AssignRoles/Department/DepartmentCode/{deptCode}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCFAssignRole> GetAssignRoleInDepartment(string deptCode, string email, string password);

        [OperationContract]
        [WebGet(UriTemplate = "/Employee/EmployeeCode/{employeecode}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        WCFEmployee GetEmployee(string employeecode, string email, string password);

        /* [OperationContract]
         [WebGet(UriTemplate = "/Employees", ResponseFormat = WebMessageFormat.Json)]
         List<WCFEmployee> GetListEmployee();*/

        [OperationContract]
        [WebGet(UriTemplate = "/Employees/Department/DepartmentCode/{deptCode}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCFEmployee> GetEmployeeInDepartment(string deptCode, string email, string password);

        [OperationContract]
        [WebGet(UriTemplate = "/Role/Id/{id}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        WCFRole GetRole(string id, string email, string password);

        [OperationContract]
        [WebGet(UriTemplate = "/Roles/Department/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCFRole> GetRoleNameInDepartment(string email, string password);

        [OperationContract]
        [WebInvoke(UriTemplate = "/Add/{email}/{password}", Method = "POST",
         RequestFormat = WebMessageFormat.Json,
         ResponseFormat = WebMessageFormat.Json)]

        String AddAssignRole(WCFAssignRole wcfassignrole, string email, string password);




    }

    [DataContract]
    public class WCFRequest
    {

        private String requestCode;
        private String departmentCode;
        private String dateCreated;
        private String status;
        private String notes;
        private String userName;
        private String empName;
        private String approvedBy;
        private String headRemark;


        public WCFRequest(String requestCode, String departmentCode, String dateCreated,
            String status, String notes, String userName, String empName)

        {

            this.requestCode = requestCode;
            this.departmentCode = departmentCode;
            this.dateCreated = dateCreated;
            this.status = status;
            this.notes = notes;
            this.userName = userName;
            this.empName = empName;

        }
        public WCFRequest()
        {

        }

        [DataMember]
        public string RequestCode
        {
            get { return requestCode; }
            set { requestCode = value; }
        }
        [DataMember]
        public string DepartmentCode
        {
            get { return departmentCode; }
            set { departmentCode = value; }
        }

        [DataMember]
        public string DateCreated
        {
            get { return dateCreated; }
            set { dateCreated = value; }
        }

        [DataMember]
        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        [DataMember]
        public string Notes
        {
            get { return notes; }
            set { notes = value; }
        }
        [DataMember]
        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        [DataMember]
        public string EmpName
        {
            get { return empName; }
            set { empName = value; }
        }

        [DataMember]
        public string ApprovedBy
        {
            get { return approvedBy; }
            set { approvedBy = value; }
        }

        [DataMember]
        public string HeadRemark
        {
            get { return headRemark; }
            set { headRemark = value; }
        }
    }

    [DataContract]
    public class WCFRequestDetail
    {

        private String itemCode;
        private String quantity;
        private String categoryCode;
        private String description;






        public WCFRequestDetail(String itemCode, String quantity, String categoryCode, String description)

        {

            this.itemCode = itemCode;
            this.quantity = quantity;
            this.categoryCode = categoryCode;
            this.description = description;

        }

        [DataMember]
        public string ItemCode
        {
            get { return itemCode; }
            set { itemCode = value; }
        }
        [DataMember]
        public string Quantity
        {
            get { return quantity; }
            set { quantity = value; }
        }

        [DataMember]
        public string CategoryCode
        {
            get { return categoryCode; }
            set { categoryCode = value; }
        }

        [DataMember]
        public string Description
        {
            get { return description; }
            set { description = value; }
        }



    }

    [DataContract]
    public class WCFAssignRole
    {
        /*
         * [AssignRoleCode]
      ,[TemporaryRoleCode]
      ,[EmployeeCode]
      ,[StartDate]
      ,[EndDate]
      ,[AssignedBy]
          */
        private String assignRoleCode;
        private String temporaryRoleCode;
        private String employeeCode;
        private String employeeName;
        private String startDate;
        private String endDate;
        private String assignedBy;
        public WCFAssignRole(String assignRoleCode, String temporaryRoleCode, String employeeCode,
            String startDate, String endDate, String assignedBy, String employeeName)
        {

            this.assignRoleCode = assignRoleCode;
            this.temporaryRoleCode = temporaryRoleCode;
            this.employeeCode = employeeCode;
            this.startDate = startDate;
            this.endDate = endDate;
            this.assignedBy = assignedBy;
            this.employeeName = employeeName;
        }
        [DataMember]
        public string AssignRoleCode
        {
            get { return assignRoleCode; }
            set { this.assignRoleCode = value; }
        }

        [DataMember]
        public string TemporaryRoleCode
        {
            get { return temporaryRoleCode; }
            set { this.temporaryRoleCode = value; }
        }

        [DataMember]
        public string EmployeeCode
        {
            get { return employeeCode; }
            set { this.employeeCode = value; }
        }
        [DataMember]
        public string EmployeeName
        {
            get { return employeeName; }
            set { this.employeeName = value; }
        }

        [DataMember]
        public string StartDate
        {
            get { return startDate; }
            set { this.startDate = value; }
        }
        [DataMember]
        public string EndDate
        {
            get { return endDate; }
            set { this.endDate = value; }
        }

        [DataMember]
        public string AssignedBy
        {
            get { return assignedBy; }
            set { this.assignedBy = value; }
        }

    }

}
[DataContract]
public class WCFRole
{

    private String id;
    private String name;

    public WCFRole(String id, String name)
    {

        this.id = id;
        this.name = name;

    }
    [DataMember]
    public string Id
    {
        get { return id; }
        set { this.id = value; }
    }

    [DataMember]
    public string Name
    {
        get { return name; }
        set { this.name = value; }
    }



}

[DataContract]
public class WCFEmployee
{
    private String employeeCode;
    private String reportTo;
    private String departmentCode;
    private String currentRoleCode;
    private String employeeName;
    private String employeeTitle;
    private String userName;
    public WCFEmployee(String employeeCode, String reportTo, String departmentCode,
        String currentRoleCode, String employeeName, String employeeTitle, String userName)
    {

        this.employeeCode = employeeCode;
        this.reportTo = reportTo;
        this.departmentCode = departmentCode;
        this.currentRoleCode = currentRoleCode;
        this.employeeName = employeeName;
        this.employeeTitle = employeeTitle;
        this.userName = userName;
    }
    [DataMember]
    public string EmployeeCode
    {
        get { return employeeCode; }
        set { this.employeeCode = value; }
    }
    [DataMember]
    public string ReportTo
    {
        get { return reportTo; }
        set { this.reportTo = value; }
    }
    [DataMember]
    public string DepartmentCode
    {
        get { return departmentCode; }
        set { this.departmentCode = value; }
    }
    [DataMember]
    public string CurrentRoleCode
    {
        get { return currentRoleCode; }
        set { this.currentRoleCode = value; }
    }
    [DataMember]
    public string EmployeeName
    {
        get { return employeeName; }
        set { this.employeeName = value; }
    }
    [DataMember]
    public string EmployeeTitle
    {
        get { return employeeTitle; }
        set { this.employeeTitle = value; }
    }
    [DataMember]
    public string UserName
    {
        get { return userName; }
        set { this.userName = value; }
    }




}