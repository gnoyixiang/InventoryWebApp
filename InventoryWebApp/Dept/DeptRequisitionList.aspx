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
            <asp:Button ID="btnRefresh" runat="server" class="btn btn-basic" Text="Refresh List" OnClick="btnRefresh_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:ListView ID="ListView1" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <th>Request Code</th>
                            <th>Employee Name</th>
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
            <%--        <asp:DataPager class="pagination justify-content-center" ID="dpList" PageSize="20" PagedControlID="ListView1" onPrerender="dpList_PreRender" runat="server">
              <Fields>
                <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="page-link" NumericButtonCssClass="page-link" />
            </Fields>
        </asp:DataPager>--%>
        </div>
    </div></div>
</asp:Content>
