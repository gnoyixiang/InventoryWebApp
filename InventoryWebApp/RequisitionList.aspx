<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionList.aspx.cs" Inherits="InventoryWebApp.RequisitionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Requisition List</h1>
    <div style="width: 400px; margin-left: auto; margin-right: auto;">
        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
        <asp:TextBox ID="txtBxSearchRequisition" runat="server" placeholder="Please key in keyword"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Search" />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True"></asp:GridView>
        <asp:Button ID="btnRefresh" runat="server" Text="Refresh List" />
    </div>
</asp:Content>
