﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionList.aspx.cs" Inherits="InventoryWebApp.RequisitionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="container-fluid">
        <h1>Requisition List</h1>
        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
        <asp:TextBox ID="txtBxSearchRequisition" runat="server" placeholder="Please key in keyword"></asp:TextBox><asp:Button ID="btnSearch" runat="server"  class="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
        <asp:ListView ID="ListView1" runat="server">
            <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <th>Request Code</th>
                            <th>Department Code</th>
                            <th>Date Created</th>
                            <th>Date Approved</th>
                            <th>Status</th>
                            <th>Notes</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><a href="/RequisitionDetails?REQUESTCODE=<%#Eval("RequestCode") %>" style="color: #337ab7"><%# Eval("RequestCode") %></a></td>
                        <td><%# Eval("DepartmentCode") %></td>
                        <td><%# Eval("DateCreated") %></td>
                        <td><%# Eval("DateApproved") %></td>
                        <td><%# Eval("Status") %></td>
                        <td><%# Eval("Notes") %></td>
                    </tr>
                </ItemTemplate>
        </asp:ListView>
        <asp:Button ID="btnRefresh" runat="server"  class="btn btn-primary" Text="Refresh List" OnClick="btnRefresh_Click" />
    </div>
</asp:Content>
