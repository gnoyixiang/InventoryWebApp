﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DisbursementFormPage.aspx.cs" Inherits="InventoryWebApp.DisbursementFormPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h3>Disbursement Form</h3>
    <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <table class="table-condensed">
                <tr style="padding-right: 0px">
                    <td>Select A Collection Point</td>
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

            <asp:ListView ID="lvDisbursementDetails" runat="server" OnItemEditing="lvDisbursementDetails_ItemEditing" OnItemCanceling="lvDisbursementDetails_ItemCanceling" OnItemUpdating="lvDisbursementDetails_ItemUpdating">
                <LayoutTemplate>
                    <table class="table">
                        <thead>
                            <th>Request Code</th>
                            <th>Stationery Description</th>
                            <th style="text-align: right; padding-right: 20px">Quantity Needed</th>
                            <th style="text-align: right; padding-right: 20px">Quantity Disbursing</th>
                            <th style="text-align: right; padding-right: 20px">Quantity Received</th>
                            <th>Request Status</th>
                            <th>Edit</th>
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
                            <td style="text-align: right; padding-right: 20px"><%# Eval("Quantity") %></td>
                            <td><%# GetRequest(Eval("RequestCode").ToString()).Status %></td>
                            <td style="align-content: center; width: 3%">
                                <asp:LinkButton ID="lbEdit" runat="server" CommandName="Edit" Title="Edit">
                                    <i class="fa fa-pencil-square" style="font-size:1.5em;color:darkorange" aria-hidden="true"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </tbody>
                </ItemTemplate>
                <EditItemTemplate>
                    <tbody>
                        <tr style="background-color:#ffedef">
                            <td><%# Eval("RequestCode") %></td>
                            <td><%#GetStationeryByCode(Eval("ItemCode").ToString()).Description%></td>
                            <td style="text-align: right; padding-right: 20px"><%# GetRequestDetail(Eval("RequestCode").ToString(), Eval("ItemCode").ToString()).RemainingQuant %></td>
                            <td style="text-align: right; padding-right: 20px"><%# Eval("Quantity") %></td>
                            <td style="text-align: right; padding-right: 20px">
                                <asp:TextBox ID="tbxActualQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                            </td>
                            <td><%# GetRequest(Eval("RequestCode").ToString()).Status %></td>
                            <td>
                                <asp:LinkButton ID="lbtUpdate" runat="server" CommandName="Update"><span class="glyphicon glyphicon-ok" aria-hidden="true" style="font-size:1.5em;color:forestgreen"></span></asp:LinkButton>
                                <asp:LinkButton ID="lbtCancel" runat="server" CommandName="Cancel"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="font-size:1.5em;color:red"></span></asp:LinkButton>
                            </td>
                        </tr>
                        <tr style="background-color:#ffedef">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td style="text-align: right; padding-right: 20px">
                                <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                            </td >
                            <td style="text-align: right; padding-right: 20px">
                                <asp:TextBox ID="tbxNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </EditItemTemplate>
            </asp:ListView>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>