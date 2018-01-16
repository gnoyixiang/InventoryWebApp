<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionList.aspx.cs" Inherits="InventoryWebApp.RequisitionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Outstanding Requests</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Stationery Requests</h3>
    <p>
        Total item quantity need to be process: 
    <asp:Label ID="lblTotalQuant" runat="server" Text="TotalQuant"></asp:Label>
    </p>
    <asp:Button ID="btnNext" runat="server" Text="Proceed to Retrieve>" OnClick="btnNext_Click" Style="float: right" />
    <%-- <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>--%>
    <asp:ListView ID="lvRequestList" runat="server">
        <LayoutTemplate>
            <table class="table">
                <tr>
                    <td class="head">Request ID</td>
                    <td class="head">Department</td>
                    <td class="head">Total Remaining Quantity</td>
                    <td class="head">Approved Date</td>
                    <td class="number head">Status</td>
                </tr>
                <tr id="itemPlaceholder" runat="server"></tr>
        </LayoutTemplate>
        <ItemTemplate>

            <tr>
                <td><%# Eval("RequestCode") %></td>
                <td><%# getDeptByCode(Eval("DepartmentCode").ToString()).DepartmentName %></td>
                <td style="text-align: right; padding-right: 120px"><%# getTotalQuantOfRequest(Eval("RequestCode").ToString()) %></td>
                <td><%# Eval("DateApproved", "{0:dd MMM yyyy}") %></td>

                <%--<td><%# DateTime.Now.ToString("dd/MMM/yyy") %></td>--%>
                <td><%# Eval("Status") %></td>

            </tr>
        </ItemTemplate>
    </asp:ListView>
    <%--<asp:DataPager runat="server" ID="ProductsDataPager"  OnPreRender="ProductsDataPager_PreRender1"
            PagedControlID="lvwRequestList" PageSize="8">
            <Fields>
              <asp:NextPreviousPagerField ButtonType="Link"
                ShowFirstPageButton="false"
                ShowNextPageButton="false" 
                ShowPreviousPageButton="true" />
              <asp:NumericPagerField ButtonCount="10" />
              <asp:NextPreviousPagerField ButtonType="Link"
                ShowLastPageButton="false"
                ShowNextPageButton="true" 
                ShowPreviousPageButton="false" />
            </Fields>
        </asp:DataPager>--%>
</asp:Content>
<%--  --%>
