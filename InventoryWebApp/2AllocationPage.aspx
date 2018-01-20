<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="2AllocationPage.aspx.cs" Inherits="InventoryWebApp._2AllocationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="btnBack" runat="server" Text="<Back" Style="float: left" OnClick="btnBack_Click" />
    <asp:Button ID="btnNext" runat="server" Text="Proceed to Allocation>" Style="float: right"/>
    <asp:Button ID="btnReset" runat="server" Text="Reset" Style="float: right" />
    
    <br />
    <br />
    <br />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <asp:ListView ID="lvAllocation" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <td class="header">Expand</td>
                            <td class="head">Stationery Description</td>
                            <td class="head">Status</td>
                            <td class="head">Department</td>
                            <td class="head" style="text-align: right; padding-right: 20px">Needed Quantity</td>
                            <td class="head" style="text-align: right; padding-right: 20px">Disbursing Quantity</td>
                            <%--<td class="head" style="text-align: left; padding-left: 20px">Notes</td>--%>
                        </tr>
                        <tbody id="itemPlaceholder" runat="server"></tbody>
                    </table>
                </LayoutTemplate>

                <ItemTemplate>
                    <tbody>
                        <tr>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Details"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></asp:LinkButton></td>
                            <td><%#GetStationeryByCode(Eval("ItemCode").ToString()).Description %></td>
                            <td><%#GetStatus(Eval("ItemCode").ToString()) %></td>
                            <td></td>
                            <td style="text-align: right; padding-right: 20px"><%# Eval("QuantityNeeded") %></td>
                            <td style="text-align: right; padding-right: 20px"><%# Eval("QuantityRetrieved") %></td>

                            <%--<td style="text-align: left; padding-left: 20px"></td>--%>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:ListView ID="lvDetails" runat="server" DataSource='<%#GetDisbursementDetailsPerItem(Eval("ItemCode").ToString())%>'>
                                    <LayoutTemplate>
                                        <table class="table">

                                            <tbody id="itemPlaceholder" runat="server"></tbody>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td><%# Eval("RequestCode") %></td>
                                                <td style="text-align: right; padding-right: 20px"><%# Eval("Quantity") %></td>
                                                <td style="text-align: right; padding-right: 20px"><%# Eval("Quantity") %></td>

                                                <td style="text-align: left; padding-left: 20px"></td>
                                                <%--<asp:TextBox ID="tbxNotes" runat="server"></asp:TextBox></td>--%>
                                    
                                            </tr>
                                        </tbody>

                                    </ItemTemplate>

                                </asp:ListView>
                            </td>
                        </tr>
                    </tbody>
                </ItemTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
