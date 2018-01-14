<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CreateRequest.aspx.cs" Inherits="InventoryWebApp.CreateRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>New Requisition Details</h3>
    <table>
        <tr>
            <td><asp:Label ID="lblDeptName" runat="server" Text="Department Name"></asp:Label>
                <br />
                <br />
            </td>
            <td><asp:TextBox ID="tbxDeptName" runat="server" ReadOnly="true"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblEmpName" runat="server" Text="Employee Name"></asp:Label>
                <br />
                <br />
            </td>
            <td><asp:TextBox ID="tbxEmpName" runat="server" ReadOnly="true"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
    </table>  
    <asp:GridView ID="GridViewNewRequest" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="ItemCode" HeaderText="Item Number" />
            <asp:BoundField DataField="Category" HeaderText="Category" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="btnAddItem" runat="server" Text="Add Item" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
    <asp:Button ID="btnClear" runat="server" Text="Clear" />
</asp:Content>
