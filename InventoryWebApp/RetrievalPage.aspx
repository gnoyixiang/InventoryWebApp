<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RetrievalPage.aspx.cs" Inherits="InventoryWebApp.RetrievalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="lvRequestList" runat="server">
    <layouttemplate>
            <table class="table">
                <tr>
                    <td class="head">Stationery Description</td>
                    <td class="head">Location</td>
                    <td class="head">Stock</td>
                    <td class="head">Needed Quantity</td>
                    <td class="head">Retrieved Quantity</td>
                    <td class="head">Retrieved</td>

                </tr>
                <tr id="itemPlaceholder" runat="server"></tr>
        </layouttemplate>
    <itemtemplate>
            
            <tr>
                <td><%# Eval("RequestCode") %></td>
                <td><%# getDeptByCode(Eval("DepartmentCode").ToString()).DepartmentName %></td>
                <td style="text-align:right; padding-right:120px"><%# getTotalQuantOfRequest(Eval("RequestCode").ToString()) %></td>
                <td><%# Eval("DateApproved", "{0:dd MMM yyyy}") %></td>

                <%--<td><%# DateTime.Now.ToString("dd/MMM/yyy") %></td>--%>
                <td><%# Eval("Status") %></td>
            
            </tr>
        </itemtemplate>
    </asp:ListView>
</asp:Content>
