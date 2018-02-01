<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="SupplierList.aspx.cs" Inherits="InventoryWebApp.Store.SupplierList" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Supplier List</li>

    </ul>
    <div class="container-fluid" id="mainContainer">
        <div class="row">
            <div class="col-md-12">
                <h3>Supplier List</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gvSupplierList" runat="server" CssClass="table table-striped" CellSpacing="-1" GridLines="None"
                    HeaderStyle-BackColor="#cfd8dc"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
