<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionDetails.aspx.cs" Inherits="InventoryWebApp.RequisitionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">View Requisition</a></li>
            <li class="breadcrumb-item active" aria-current="page">Requisition Details</li>
        </ol>
    </nav>
    <h1>Requisition Details</h1>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 col-sm-3">
                <label>Requisition Number</label>
            </div>
        </div>
    </div>


</asp:Content>
