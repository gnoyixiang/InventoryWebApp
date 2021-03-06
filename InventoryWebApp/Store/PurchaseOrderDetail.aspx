﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PurchaseOrderDetail.aspx.cs"
    MaintainScrollPositionOnPostback="true" Inherits="InventoryWebApp.Store.PurchaseOrderDetail" %>

<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .control {
            padding: 1px 5px;
        }

        .error {
            border: 1px solid red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="Home">Home</a></li>
        <li><a href="ViewPurchaseOrders">Purchase Orders</a></li>
        <li class="active">Purchase Order Details</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <asp:Panel ID="panelError" runat="server" Visible="false">
            <div class="row">
                <div class="col-sm-12">
                    <h4>No records found!</h4>
                    <% if (Context.User.IsInRole("Store Clerk"))
                        { %>
                    <a href="/Store/ViewPurchaseOrders">Return to view purchase orders</a>
                    <% } %>
                    <% if (Context.User.IsInRole("Store Manager") || Context.User.IsInRole("Store Supervisor"))
                        { %>
                    <a href="/Store/ViewPurchaseOrders?search=5&q=pending">Return to view pending purchase orders</a>
                    <% } %>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="panelDetails" runat="server">
            <div class="row">
                <div class="col-sm-10">
                    <h3>Purchase Order #<asp:Label runat="server" ID="lblOrderID"></asp:Label></h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <asp:Label runat="server" ID="lblStatus" Text="Status: " Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <asp:Label runat="server" Text="Supplier:"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label runat="server" ID="lblSupplierName" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label runat="server" Text="Deliver to:"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label runat="server" ID="lblDeliverAddress" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <asp:Label runat="server" Text="Estimated Deilvery Date:"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label runat="server" ID="lblEstDeliverDate" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label runat="server" Text="Attn to:"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label runat="server" ID="lblAttnTo" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <asp:Panel ID="panelNoDetails" runat="server" Visible="false">
                        <h4>No records found!</h4>
                    </asp:Panel>
                    <asp:ListView ID="listDetails" runat="server" OnItemEditing="listDetails_ItemEditing"
                        OnItemUpdating="listDetails_ItemUpdating"
                        OnItemCanceling="listDetails_ItemCanceling" DataKeyNames="ItemCode, PurchaseOrderCode">
                        <LayoutTemplate>
                            <table class="table">
                                <tr style="background-color: #cfd8dc">
                                    <th>Description</th>
                                    <td align="right" style="width: 20%"><b>Quantity</b></td>
                                    <td align="right" style="width: 20%"><b>Price</b></td>
                                    <td align="right" style="width: 20%"><b>Amount</b></td>
                                    <td></td>
                                </tr>
                                <tbody id="itemPlaceholder" runat="server"></tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td align="right">Grand Total</td>
                                    <td align="right"><span>$&nbsp;&nbsp;</span><asp:Label ID="lblGrandTotal" runat="server" Style="float: right"></asp:Label></td>
                                    <td></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td><%# GetItemDescription(Eval("ItemCode")) %></td>
                                    <td align="right"><%# Eval("Quantity") %></td>
                                    <td align="right"><span>$&nbsp;&nbsp;</span><%# Eval("Price", "{0:0.00}") %></td>
                                    <td align="right"><span>$&nbsp;&nbsp;</span><%# GetAmount(Eval("Quantity"), Eval("Price")) %></td>
                                    <% if (IsEditable() && Context.User.IsInRole("Store Clerk"))
                                        { %>
                                    <td align="center" style="width: 3%;">
                                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" title="Edit">
                                    <i class="fa fa-pencil-square" style="font-size:1.5em;color:darkorange" aria-hidden="true"></i>
                                        </asp:LinkButton>
                                    </td>
                                    <% } %>
                                </tr>
                                <tr>
                                    <td colspan="4" style="border-top: none;">Notes 
                                <asp:TextBox ID="txtNotes" runat="server" Rows="2" AutoPostBack="true"
                                    resize="none" CausesValidation="true" ReadOnly="true"
                                    TextMode="MultiLine" Width="100%" Text='<%# Eval("Notes") %>' Style="resize: none"></asp:TextBox>
                                    </td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <tbody>
                                <tr>
                                    <%--<asp:HiddenField ID="hfMinReorderQty" runat="server" />--%>
                                    <td>
                                        <asp:Label ID="lblItemCode" runat="server"><%# GetItemDescription(Eval("ItemCode")) %></asp:Label>
                                        <br />
                                        <asp:CustomValidator ID="validOrderQuantity" runat="server"
                                            OnServerValidate="validOrderQuantity_ServerValidate" ValidationGroup="ValidGroupEdit"
                                            ControlToValidate="txtOrderQuantity" ForeColor="Red" ErrorMessage="" Display="Dynamic">
                                        </asp:CustomValidator>
                                    </td>
                                    <td align="right">
                                        <asp:TextBox ID="txtOrderQuantity" runat="server" CssClass="control"
                                            TextMode="Number" Width="80px" Text='<%# Bind("Quantity") %>' /></td>
                                    <td align="right"><span>$&nbsp;&nbsp;</span>
                                        <asp:Label ID="lblPrice" runat="server"><%# Eval("Price", "{0:0.00}") %></asp:Label></td>
                                    <td align="right"><span>$&nbsp;&nbsp;</span>
                                        <asp:Label ID="lblAmount" runat="server"><%# GetAmount(Eval("Quantity"), Eval("Price")) %></asp:Label></td>
                                    <td align="center">
                                        <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CausesValidation="true"
                                            title="Update" ValidationGroup="ValidGroupEdit">
                                            <i class="fa fa-check-square" style="font-size:1.5em;color:forestgreen" aria-hidden="true"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CausesValidation="false"
                                            title="Cancel">
                                            <i class="fa fa-minus-square " style="font-size:1.5em;color:red" aria-hidden="true"></i>
                                        </asp:LinkButton>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="4" style="border-top: none;">Notes
                                    <asp:CustomValidator ID="ValidNotes" runat="server"
                                        OnServerValidate="ValidNotes_ServerValidate" ValidationGroup="ValidGroupEdit"
                                        ControlToValidate="txtNotes" ForeColor="Red" ErrorMessage="Maximum 200 characters allowed."
                                        Display="Dynamic">
                                    </asp:CustomValidator>
                                        <asp:TextBox ID="txtNotes" runat="server" Rows="2" CssClass="control"
                                            resize="none" TextMode="MultiLine" Width="100%" Text='<%# Bind("Notes") %>' Style="resize: none"></asp:TextBox>
                                    </td>
                                </tr>
                            </tbody>
                        </EditItemTemplate>
                    </asp:ListView>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <asp:Label runat="server" Text="Ordered by:"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label runat="server" ID="lblOrderBy" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:Label runat="server" Text="Order Date:"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label runat="server" ID="lblOrderDate" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <asp:Label runat="server" Text="Approved by:"></asp:Label>
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" ID="lblApprovedBy" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:Label runat="server" Text="Approved Date:"></asp:Label>
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" ID="lblApprovedDate" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <asp:Label runat="server" Text="Received by:"></asp:Label>
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" ID="lblReceivedBy" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:Label runat="server" Text="Received Date:"></asp:Label>
                </div>
                <div class="col-md-4">
                    <asp:Label runat="server" ID="lblReceivedDate" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-1" style="padding: 5px 15px">Notes:</div>
                <div class="col-md-11">
                    <asp:TextBox ID="txtFinalNotes" runat="server" Rows="3" CssClass="control" ReadOnly="true" OnTextChanged="txtFinalNotes_TextChanged" AutoPostBack="true"
                                            resize="none" TextMode="MultiLine" Width="100%" Text='<%# Bind("Notes") %>' Style="resize: none"></asp:TextBox>
                    <asp:CustomValidator ID="ValidFinalNotes" runat="server" 
                                        OnServerValidate="ValidFinalNotes_ServerValidate" ValidationGroup="ValidGroupFinalNotes"
                                        ControlToValidate="txtFinalNotes" ForeColor="Red" ErrorMessage="Maximum 200 characters allowed."
                                        Display="Dynamic"></asp:CustomValidator>
                    
                   <%-- <textarea rows="3" style="resize: none; width: 100%;"
                        class="form-control" runat="server" id="lblNotes" readonly="readonly"></textarea>--%>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <% if (Context.User.IsInRole("Store Clerk"))
                        { %>
                    <asp:Button runat="server" ID="btnCancelOrder" CssClass="btn btn-danger" OnClick="btnCancelOrder_Click"
                        Text="Cancel Order" Width="100%" Style="margin-bottom: 10px"
                        OnClientClick="return confirm('Cancel this order?');" /><%} %>
                </div>                
                <div class="col-lg-3">
                    <asp:Button runat="server" ID="btnSaveFinalNotes" Text="Save Notes" CssClass="btn btn-warning" CausesValidation="true" Width="100%"
                        OnClick="btnSaveFinalNotes_Click" Style="margin-bottom: 10px" Visible="false" />
                </div>
                <div class="col-lg-3">
                    <% if (Context.User.IsInRole("Store Supervisor") || Context.User.IsInRole("Store Manager"))
                        { %>
                    <asp:Button runat="server" ID="btnModalReject" Text="Reject PO" CssClass="btn btn-danger" Width="100%"
                        OnClick="btnModal_Click" Style="margin-bottom: 10px" OnClientClick="return confirm('Confirm to reject this PO?');" />
                    <% } %>
                </div>
                <div class="col-lg-3">
                    <% if (Context.User.IsInRole("Store Clerk"))
                        { %>
                    <asp:Button runat="server" ID="btnAckReceipt" CssClass="btn btn-success" OnClick="btnAckReceipt_Click"
                        Text="Acknowledge Receipt" Width="100%" Style="margin-bottom: 10px"
                        OnClientClick="return confirm('Confirm to receive this order?');" />
                    <% } %>
                    <% if (Context.User.IsInRole("Store Supervisor") || Context.User.IsInRole("Store Manager"))
                        { %>
                    <asp:Button runat="server" ID="btnModalApprove" Text="Approve PO" CssClass="btn btn-success" Width="100%"
                        OnClick="btnModal_Click" Style="margin-bottom: 10px" OnClientClick="return confirm('Confirm to approve this PO?');" />
                    <% } %>
                </div>
            </div>


            <!-- Email Modal -->
            <div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:HiddenField ID="hfRequestType" runat="server" />
                            <h3 class="modal-title" id="exampleModalLongTitle">Please verify your password</h3>
                        </div>
                        <div class="modal-body">
                            <div class="input-group " style="margin-bottom: 10px">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-log-in"></i></span>
                                <input type="text" class="form-control disabled" id="txtUsername" aria-describedby="lblUsername" value="<%= Context.User.Identity.Name %>" readonly>
                            </div>
                            <div class="input-group " style="margin-bottom: 10px">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <asp:TextBox type="password" CssClass="form-control" ID="txtPassword" aria-describedby="lblPassword" runat="server"></asp:TextBox>
                            </div>
                            <div style="margin-bottom: 10px">
                                <asp:Label ID="lblVerifyError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin-bottom: 10px">Close</button>
                            <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-success" CausesValidation="true" type="button"
                                OnClick="btnSubmit_Click" Style="margin-bottom: 10px; margin-left: 0" OnClientClick="if(this.value === 'Submitting..') { return false; } else { this.value = 'Submitting..'; }"/>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>



</asp:Content>
