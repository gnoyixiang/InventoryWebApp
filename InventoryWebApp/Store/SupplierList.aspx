<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="SupplierList.aspx.cs" Inherits="InventoryWebApp.SupplierList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active"><a href="#">Supplier List</a></li>
               
            </ul>
    <asp:GridView ID="gvSupplierList" runat="server" CssClass="table" CellSpacing="-1" GridLines="None"></asp:GridView>

</asp:Content>
