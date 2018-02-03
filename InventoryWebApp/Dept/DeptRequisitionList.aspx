<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DeptRequisitionList.aspx.cs" 
    Inherits="InventoryWebApp.Dept.DeptRequisitionList" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Requisition List</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
    <div class="row">
        <div class="col-md-12">
            <h3>Requisition List</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList>
        </div>
        <div class="col-md-7">
            <asp:TextBox ID="txtBxSearchRequisition" class="form-control" runat="server" placeholder="Please key in keyword"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field is empty!" ForeColor="DarkRed" ControlToValidate="txtBxSearchRequisition"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-5">
            <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
            <asp:Button ID="btnRefresh" runat="server" class="btn btn-basic" Text="View All Requests" OnClick="btnRefresh_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:ListView ID="ListView1" runat="server">
                <LayoutTemplate>
                    <table class="table table-striped">
                        <tr style="background-color:#cfd8dc">
                            <th>Request Code</th>
                            <th>Employee Name</th>
                            <th>Date Created</th>
                            <th>Date Approved</th>
                            <th>Status</th>
                            <th>Notes</th>
                        </tr>
                            </thead>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <a href="RequisitionDetails?REQUESTCODE=<%#Eval("RequestCode") %>" style="color: #337ab7"><%# Eval("RequestCode") %></a>

                        </td>
                        <td><%# GetEmployeeName((string)Eval("UserName")) %></td>
                        <td><%# Eval("DateCreated","{0:MMM dd, yyyy}") %></td>
                        <td><%# Eval("DateApproved","{0:MMM dd, yyyy}") %></td>
                        <td><%# Eval("Status") %></td>
                        <td><%# Eval("Notes") %></td>
                    </tr>
                </ItemTemplate>

            </asp:ListView>
             <asp:DataPager ID="listRPager" runat="server" class="btn-group" PagedControlID="ListView1" PageSize="10">
                        <Fields>
                            <asp:NextPreviousPagerField PreviousPageText="<" FirstPageText="|<" ShowPreviousPageButton="true"
                                ShowFirstPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false"
                                ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                            <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-primary disabled inpager" RenderNonBreakingSpacesBetweenControls="false"
                                NumericButtonCssClass="btn btn-default" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-default" />
                            <asp:NextPreviousPagerField NextPageText=">" LastPageText=">|" ShowNextPageButton="true"
                                ShowLastPageButton="true" ShowPreviousPageButton="false" ShowFirstPageButton="false"
                                ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                        </Fields>
                    </asp:DataPager>
        </div>
    </div></div>
</asp:Content>
