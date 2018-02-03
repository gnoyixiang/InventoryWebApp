<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewDisbursement.aspx.cs" Inherits="InventoryWebApp.Dept.ViewDisbursement" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">View Disbursements</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
    <div class="row">
        <div class="col-md-10">
            <h3>Disbursement List</h3>
        </div>
    </div>
        <p><small class="text-muted">View all past and present disbursement lists</small></p>
        <asp:ListView ID="lvDisbursement" runat="server">
         <LayoutTemplate>
                    <table class="table table-striped">
                        <tr style="background-color:#cfd8dc">
                            <th>Disbursement Code</th>
                            <th>Date Created</th>
                            <th>Status</th>
                            <th>Date Disbursed</th>
                            <th>Notes</th>
                            <th>Received By</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><a href="ViewDisbursementDetails?DISBURSEMENTCODE=<%#Eval("DisbursementCode") %>" style="color: #337ab7"><%# Eval("DisbursementCode") %></a></td>
                        <td><%# Eval("DateCreated","{0:MMM dd, yyyy}") %></td>
                        <td><%# Eval("Status") %></td>
                        <td><%# Eval("DateDisbursed","{0:MMM dd, yyyy}") %></td>
                        <td><%# Eval("Notes") %></td>   
                        <td><%# Eval("ReceivedBy") %></td>                  
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        <asp:DataPager ID="listDisbursement" runat="server" class="btn-group" PagedControlID="lvDisbursement" PageSize="10">
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
</asp:Content>
