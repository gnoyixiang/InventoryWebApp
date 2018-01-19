<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionList.aspx.cs" Inherits="InventoryWebApp.RequisitionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        row {
            margin: 30px -15px;
        }
    </style>


    <div class="container-fluid">
        <h1>Requisition List</h1>
        <div class="row">
            <div class="col-md-4">
                <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="col-md-7">
                <asp:TextBox ID="txtBxSearchRequisition" class="form-control" runat="server" placeholder="Please key in keyword"></asp:TextBox>
            </div>
        </div>
        <p>
        </p>
        <div class="row">
            <div class="col-md-5">
                <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
                <asp:Button ID="btnRefresh" runat="server" class="btn btn-primary" Text="Refresh List" OnClick="btnRefresh_Click" />
            </div>
        </div>
    </div>
    <p>
    </p>
    <div>
        <asp:ListView ID="ListView1" runat="server">
            <LayoutTemplate>
                <table class="table">
                    <tr>
                        <th>Request Code</th>
                        <th>Department Code</th>
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
                    <td><a href="/RequisitionDetails?REQUESTCODE=<%#Eval("RequestCode") %>" style="color: #337ab7"><%# Eval("RequestCode") %></a></td>
                    <td><%# Eval("DepartmentCode") %></td>
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
</asp:Content>
