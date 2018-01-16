<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionDetails.aspx.cs" Inherits="InventoryWebApp.RequisitionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/RequisitionList">View Requisition</a></li>
                <li class="breadcrumb-item active" aria-current="page">Requisition Details</li>
            </ol>
        </nav>
        <h1>Requisition Details</h1>
        <div class="container-fluid">
            <div class="row">
                <div>
                    <label>Request Code: </label>
                    <asp:Label ID="lblRequestCode" runat="server" Text="Label"></asp:Label>
                </div>
                <label>Employee Name: </label>
                <asp:Label ID="lblEmployeeName" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="row">
                <div>
                    <label>Department Name: </label>
                    <asp:Label ID="lblDepartmentName" runat="server" Text="Label"></asp:Label>
                </div>
                <label>Requisition Status: </label>
                <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
            </div>

        </div>
         <asp:ListView ID="ListView1" runat="server">
            <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <th>Request Code</th>
                            <th>Item Code</th>
                            <th>Status</th>
                            <th>Remaining Quantity</th>
                            <th>Quantity</th>
                            <th>Notes</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("RequestCode") %></a></td>
                        <td><%# Eval("ItemCode") %></td>
                        <td><%# Eval("Status") %></td>
                        <td><%# Eval("RemainingQuant") %></td>
                        <td><%# Eval("Quantity") %></td>
                        <td><%# Eval("Notes") %></td>
                    </tr>
                </ItemTemplate>
        </asp:ListView>
    </div>

</asp:Content>
