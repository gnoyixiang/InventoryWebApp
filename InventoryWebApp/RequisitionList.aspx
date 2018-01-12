<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionList.aspx.cs" Inherits="InventoryWebApp.RequisitionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Geebairen2"></asp:Label>
    <div style="width: 400px; margin-left: auto; margin-right: auto;">
        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
        <asp:TextBox ID="txtBxSearchRequisition" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Search" />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True"></asp:GridView>
        <asp:Button ID="btnRefresh" runat="server" Text="Refresh List" />
    </div>
</asp:Content>
