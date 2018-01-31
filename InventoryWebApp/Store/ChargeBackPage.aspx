<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ChargeBackPage.aspx.cs"
    Inherits="InventoryWebApp.Store.ChargeBackPage" %>

<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Charge Back</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div class="row">
            <div class="col-md-12">
                <h3>Charge Back</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:Button ID="btnBack" runat="server" Text="<Back To Disbursement Form" CssClass="btn btn-success" OnClick="btnBack_Click" />
            </div>
        </div>
        <%--<asp:Button ID="btnNext" runat="server" Style="float: right" Text="Proceed to Charge Back>" CssClass="btn btn-success" OnClick="btnNext_Click"  ></asp:Button>--%>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <div class="row">
                    <div class="col-lg-12">
                        Select a Disbursement Status
            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged"></asp:DropDownList>
                        &nbsp &nbsp &nbsp
            <asp:Label ID="lblNotification" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:ListView ID="lvDisbursementList" runat="server">
                            <LayoutTemplate>
                                <table class="table table-striped">
                                    <thead style="background-color:#cfd8dc">
                                        <th>Disbursement Code</th>
                                        <th>Department</th>
                                        <th>Date Disbursed</th>
                                        <th style="text-align: right; padding-right: 50px">Total Price</th>
                                        <th>Status</th>
                                        <th>Charge Back</th>
                                    </thead>
                                    <tbody id="itemPlaceholder" runat="server"></tbody>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tbody>
                                    <tr style="<%# Eval("Status").ToString()=="disbursed"?"background-color: #ffd8dd": ""%>">
                                        <td>
                                            <asp:Label ID="lblDisbursementCode" runat="server" Text='<%# Eval("DisbursementCode") %>'></asp:Label></td>
                                        <td><%# GetDepartment(Eval("DepartmentCode").ToString()).DepartmentName %></td>
                                        <td><%# Eval("DateDisbursed", "{0:dd MMM yyyy}") %></td>
                                        <td style="text-align: right; padding-right: 50px"><%# String.Format("{0:c}",GetPriceOfDisbursement(Eval("DisbursementCode").ToString())) %></td>
                                        <td><%# Eval("Status") %></td>
                                        <td>
                                            <asp:LinkButton ID="linkHide" runat="server" Visible='<%# Eval("Status").ToString()=="disbursed"?true:false %>' CommandName="ChargeBack" OnCommand="btnChargeBack_OnClick"><span class="glyphicon glyphicon-usd" style="color:#d80000" aria-hidden="true">Charge Back</span></asp:LinkButton></td>
                                    </tr>
                                </tbody>
                            </ItemTemplate>

                        </asp:ListView>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
