<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionDetails.aspx.cs" Inherits="InventoryWebApp.RequisitionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/RequisitionList">View Requisition</a></li>
                <li class="breadcrumb-item active" aria-current="page">Requisition Details</li>
            </ol>
        </nav>
        <div class="container-fluid">
            <h1>Requisition Details</h1>
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
                                <th>Edit</th>
                                <th>Delete</th>
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
                            <% if (IsEditable())
                                { %>
                            <td align="center" style="width: 3%">
                                <asp:LinkButton ID="lbEdit" runat="server" CommandName="Edit">
                                    <i class="fa fa-pencil-square" style="font-size:1.5em;color:darkorange" aria-hidden="true"></i>
                                </asp:LinkButton>
                            </td>
                            <td align="center" style="width: 3%">
                                <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete">
                        <i class="fa fa-trash-o" style="font-size:1.5em;color:hotpink" aria-hidden="true"></i></asp:LinkButton>
                            </td>
                            <% } %>
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
                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CausesValidation="true">
                                            <i class="fa fa-check-square" style="font-size:1.5em;color:forestgreen" aria-hidden="true"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CausesValidation="false">
                                            <i class="fa fa-minus-square " style="font-size:1.5em;color:red" aria-hidden="true"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                        <%--                        <tr>
                            <td colspan="12" style="border-top: none;">
                                <asp:CustomValidator ID="validOrderQuantity" runat="server"
                                    OnServerValidate="validOrderQuantity_ServerValidate"
                                    ControlToValidate="txtOrderQuantity" ForeColor="Red" ErrorMessage="" Display="Dynamic">
                                </asp:CustomValidator>
                            </td>
                        </tr>--%>
                    </EditItemTemplate>
                </asp:ListView>
                <br />
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
                            <td><%# Eval("DisbursementCode") %></a></td>
                            <td><%# Eval("Status") %></td>
                            <td><%# Eval("DateDisbursed") %></td>
                            <td><%# Eval("ReceivedBy") %></td>
                        </tr>
                    </ItemTemplate>

                </asp:ListView>
            </asp:Panel>
        </div>
    </div>


</asp:Content>
