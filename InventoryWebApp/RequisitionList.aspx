<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionList.aspx.cs" Inherits="InventoryWebApp.RequisitionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Outstanding Requests</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Stationery Requests</h3>
    <p>
        Total item quantity need to be processed: 
    <asp:Label ID="lblTotalQuant" runat="server" Text="TotalQuant"></asp:Label>
    </p>
    <asp:Button ID="btnNext" runat="server" Text="Proceed to Retrieval>" OnClick="btnNext_Click" Style="float: right" />
    <%-- <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>--%>


    <asp:ListView ID="lvRequestList" runat="server">
        <LayoutTemplate>
            <table class="table">
                <tr>
                    <td class="head">Request ID</td>
                    <td class="head">Department</td>
                    <td class="head" style="text-align: right; padding-right: 50px">Total Remaining Quantity</td>
                    <td class="head" style="text-align: left; padding-left: 20px">Approved Date</td>
                    <td class="number head">Status</td>
                </tr>
                <tr id="itemPlaceholder" runat="server"></tr>
        </LayoutTemplate>
        <ItemTemplate>

            <tr>
                <td><%# Eval("RequestCode") %></td>
                <td><%# GetDeptByCode(Eval("DepartmentCode").ToString()).DepartmentName %></td>
                <td style="text-align: right; padding-right: 50px"><%# GetTotalQuantOfRequest(Eval("RequestCode").ToString()) %></td>
                <td style="text-align: left; padding-left: 20px"><%# Eval("DateApproved", "{0:dd MMM yyyy}") %></td>

                <%--<td><%# DateTime.Now.ToString("dd/MMM/yyy") %></td>--%>
                <td><%# Eval("Status") %></td>

            </tr>
        </ItemTemplate>
    </asp:ListView>
    
</asp:Content>
<%--  --%>
