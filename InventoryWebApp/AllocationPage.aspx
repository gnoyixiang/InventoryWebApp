<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AllocationPage.aspx.cs" Inherits="InventoryWebApp.AllocationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:Button ID="btnBack" runat="server" Text="<Back" Style="float: left" OnClick="btnBack_Click" />
    <br />
    <br />
    <br />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <asp:Repeater ID="rpt1" runat="server" OnItemCommand="rpt1_ItemCommand">
                <HeaderTemplate>
                    <table class="table">
                        <tr>
                            <th class="col-lg-1">Expand for details </th>
                            <th class="col-lg-2">Stationery Description</th>
                            <th class="col-lg-2">Status</th>
                            <th class="col-lg-1" style="text-align: right; padding-right: 20px">Quantity Needed</th>
                            <th class="col-lg-1" style="text-align: right; padding-right: 20px">Quantity Retrieved</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="table">
                        <tr>
                            <td class="col-lg-1">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Details"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></asp:LinkButton></td>
                            <td class="col-lg-2"><%#GetStationeryByCode(Eval("ItemCode").ToString()).Description %></td>
                            <td class="col-lg-2"><%#GetStatus(Eval("ItemCode").ToString()) %></td>
                            <td class="col-lg-1" style="text-align: right; padding-right: 20px"><%# Eval("QuantityNeeded") %></td>
                            <td class="col-lg-1" style="text-align: right; padding-right: 20px"><%# Eval("QuantityRetrieved") %></td>
                        </tr>
                        <tr>
                            <asp:ListView ID="lvDetails" runat="server">
                                <ItemTemplate>Hello 1</ItemTemplate>
                                <ItemTemplate>Hello 2</ItemTemplate>
                            </asp:ListView>
                        </tr>
                    </table>
                </ItemTemplate>

            </asp:Repeater>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
