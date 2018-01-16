<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthoriseStaff.aspx.cs" Inherits="InventoryWebApp.AuthoriseStaff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID ="gv" runat ="server" AutoGenerateColumns="false" 
        DataKeyNames=""
            OnRowCancelingEdit="OnRowCancelingEdit"
            OnRowDeleting="OnRowDeleting" 
            OnRowEditing="OnRowEditing" 
            OnRowUpdating="OnRowUpdating" OnRowDataBound="OnRowDataBound">
        <Columns>
            <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" ReadOnly="True"/>
            <asp:BoundField DataField="EmployeeCode" HeaderText="EmployeeCode" ReadOnly="True"/>
            <asp:BoundField DataField="CurrentRoleCode" HeaderText="Title" ReadOnly="False"/>
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" ReadOnly="False"/>
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" ReadOnly="False"/>

        </Columns>
    </asp:GridView>
    </div>
    </form>
</body>
</html>
