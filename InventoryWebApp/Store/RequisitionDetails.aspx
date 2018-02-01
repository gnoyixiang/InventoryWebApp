<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionDetails.aspx.cs" Inherits="InventoryWebApp.Store.RequisitionDetails" %>

<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="RequisitionList">View Requisition</a></li>
        <li class="breadcrumb-item active">Requisition Details</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div>
            <div style="text-align: right;">
                <a href="#" onclick='printDiv("printableArea")'><i class="fa fa-print fa-2x" aria-hidden="true"></i></a>
            </div>
        </div>
        <div id="printableArea">
            <div class="row">
                <div class="col-md-10">
                    <h3>Requisition Details</h3>
                </div>
            </div>

            <asp:Panel ID="Panel2" runat="server" Visible="false">No Request Details found!</asp:Panel>
            <asp:Panel ID="Panel1" runat="server">
                <div class="row">
                    <div class="col-md-4">
                        <label>Request Code: </label>
                        <asp:Label ID="lblRequestCode" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-md-5">
                        <label>Employee Name: </label>
                        <asp:Label ID="lblEmployeeName" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">
                        <label>Department Name: </label>
                        <asp:Label ID="lblDepartmentName" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-md-5">
                        <label>Requisition Status: </label>
                        <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <br />
                <asp:ListView ID="ListView1" runat="server" OnItemEditing="listDetails_ItemEditing"
                    OnItemCanceling="ListView1_ItemCanceling" OnItemUpdating="ListView1_ItemUpdating" OnItemDeleting="ListView1_ItemDeleting">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Request Code</th>
                                <th>Item Code</th>
                                <th>Status</th>
                                <th>Remaining Quantity</th>
                                <th>Quantity</th>
                                <th>Notes</th>

                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("RequestCode") %></a></td>
                            <td><%# Eval("ItemCode") %></td>
                            <td><%# Eval("Status") %></td>
                            <td><%# Eval("RemainingQuant") %></td>
                            <td><%# Eval("Quantity") %></td>
                            <td><%# Eval("Notes") %></td>                           
                        </tr>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <tr>
                            <%--<asp:HiddenField ID="hfMinReorderQty" runat="server" />--%>
                            <td>
                                <asp:Label ID="lblEditRequisitionCode" runat="server"><%# Eval("RequestCode") %></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEditItemCode" runat="server"><%# Eval("ItemCode") %></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEditStatus" runat="server"><%# Eval("Status") %></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEditRemainingQuantity" runat="server"><%# Eval("RemainingQuant") %></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="txtOrderQuantity" runat="server" CssClass="control"
                                    TextMode="Number" Width="80px" Text='<%# Bind("Quantity") %>' /></td>
                            <td>
                                <asp:Label ID="lblEditNotes" runat="server"><%# Eval("Notes") %></asp:Label></td>

                            <td align="center">
                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update">
                                            <i class="fa fa-check-square" style="font-size:1.5em;color:forestgreen" aria-hidden="true"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel">
                                            <i class="fa fa-minus-square " style="font-size:1.5em;color:red" aria-hidden="true"></i>
                                </asp:LinkButton>
                            </td>
                            <td>
                                <asp:CompareValidator ID="quantityCompareValidator2" runat="server" Type="Integer" Operator="GreaterThan" Display="Dynamic"
                                    ErrorMessage="Enter a value greater than Zero" ValueToCompare="0" ControlToValidate="txtOrderQuantity"
                                    ForeColor="Red"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="quantityRequiredValidator" runat="server"
                                    ErrorMessage="Empty Quantity" ForeColor="Red" ControlToValidate="txtOrderQuantity"></asp:RequiredFieldValidator></td>
                        </tr>
                    </EditItemTemplate>
                </asp:ListView>
                <div class="row">

                </div>
                <h4>Disbursements</h4>
                <asp:ListView ID="ListView2" runat="server">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Disbursement Code</th>
                                <th>Status</th>
                                <th>Date Disbursed</th>
                                <th>Received By</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><a href="ViewDisbursementDetails?DISBURSEMENTCODE=<%#Eval("DisbursementCode") %>" style="color: #337ab7"><%# Eval("DisbursementCode") %></a></td>
                            <td><%# Eval("Status") %></td>
                            <td><%# Eval("DateDisbursed","{0:MMM dd, yyyy}") %></td>
                            <td><%# Eval("ReceivedBy") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
