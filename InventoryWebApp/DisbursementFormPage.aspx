<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DisbursementFormPage.aspx.cs" Inherits="InventoryWebApp.DisbursementFormPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h3>Disbursement Form</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <table class="table-condensed">
                <tr style="padding-right: 30px">
                    <td>Collection Point</td>
                    <td>
                        <asp:DropDownList ID="ddlCollectionPoint" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCollectionPoint_SelectedIndexChanged"></asp:DropDownList></td>
                    <td>Planned Disbursement Date</td>
                    <td>
                        <asp:TextBox ID="tbxDisbursementDate" runat="server" Enabled="false" Text="<%#GetPlanToCollectDate() %>"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="true"></asp:DropDownList></td>
                    <td>Disbursement Time</td>
                    <td>
                        <asp:TextBox ID="tbxDisbursementTime" runat="server" Enabled="false"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Representative</td>
                    <td>
                        <asp:TextBox ID="tbxRep" runat="server" Enabled="false"></asp:TextBox></td>
                    <td>Disbursement Status</td>
                    <td>
                        <asp:TextBox ID="tbxStatus" runat="server" Enabled="false"></asp:TextBox></td>
                </tr>
            </table>
            <br />
            <br />
            <asp:ListView ID="lvDisbursementDetails" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <thead>
                            <th>Request Code</th>
                            <th>Stationery Description</th>
                            <th style="text-align: right; padding-right: 20px">Quantity Needed</th>
                            <th style="text-align: right; padding-right: 20px">Quantity Disbursed</th>
                            <th>Request Status</th>
                        </thead>
                        <tbody id="itemPlaceholder" runat="server">
                        </tbody>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tbody>
                        <tr>
                            <td><%# Eval("RequestCode") %></td>
                            <td><%#GetStationeryByCode(Eval("ItemCode").ToString()).Description%></td>
                            <td style="text-align: right; padding-right: 20px"><%# GetRequestDetail(Eval("RequestCode").ToString(), Eval("ItemCode").ToString()).RemainingQuant %></td>
                            <td style="text-align: right; padding-right: 20px"><%# Eval("Quantity") %></td>
                            <td><%# GetRequest(Eval("RequestCode").ToString()).Status %></td>
                        </tr>
                        
                    </tbody>
                </ItemTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
