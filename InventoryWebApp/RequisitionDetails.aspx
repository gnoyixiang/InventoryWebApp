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
        <div class="container-fluid">
            <h1>Requisition Details</h1>
            <div class="row">
                <div class="col-md-4">
                    <label>Request Code: </label>
                    <asp:Label ID="lblRequestCode" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-5">
                    <label>Employee Name: </label>
                    <asp:Label ID="lblEmployeeName" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <p></p>
            <div class="row">
                <div class="col-md-4">
                    <label>Department Name: </label>
                    <asp:Label ID="lblDepartmentName" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="col-md-5">
                    <label>Requisition Status: </label>
                    <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <p></p>
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
                            <th>Edit</th>
                            <th>Delete</th>
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
                        <% if (IsEditable())
                            { %>
                        <td align="center" style="width: 3%">
                            <asp:LinkButton ID="lbEdit" runat="server">
                                    <i class="fa fa-pencil-square" style="font-size:1.5em;color:darkorange" aria-hidden="true"></i>
                            </asp:LinkButton>
                        </td>
                        <% } %>

                        <td>
                            <asp:LinkButton ID="lbDelete" Visible="false" runat="server">LinkButton</asp:LinkButton></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <p></p>
            <asp:ListView ID="ListView2" runat="server">
                 <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <th>Disbursement Code</th>
                            <th>Status</th>
                            <th>Date Disbursed</th>
                            <th>Received By</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("DisbursementCode") %></a></td>
                        <td><%# Eval("Status") %></td>
                        <td><%# Eval("DateDisbursed") %></td>
                        <td><%# Eval("ReceivedBy") %></td>       
                    </tr>
                </ItemTemplate>
            </asp:ListView>

        </div>
    </div>


</asp:Content>
