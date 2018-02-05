<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CreateNewOrder.aspx.cs"
    Inherits="InventoryWebApp.Store.CreateNewOrder" MaintainScrollPositionOnPostback="true" %>

<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .row {
            margin: 10px 0;
        }

        .control {
            padding: 1px 5px;
        }

        .right {
            text-align: right;
        }

        .error {
            border: 1px solid red;
        }

        .table {
            min-width: 900px;
        }

        .table-inside {
            width: 100%;
        }

        .sn {
            width: 5%;
        }

        .stationery {
            width: 30%;
        }

        .reorderlevel {
            width: 10%;
        }

        .supplier {
            width: 20%;
        }

        .price {
            width: 10%;
        }

        .orderqty {
            width: 10%;
        }

        .amount {
            width: 10%;
        }

        .icon {
            width: 5%;
        }

        textarea {
            resize: none;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="Home">Home</a></li>
        <li class="active">Create New Order</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div class="row">
            <div class="col-sm-12">
                <h3>New Purchase Order</h3>
            </div>
        </div>
        <div class="row">
            <%--<asp:HiddenField ID="hfGrandTotal" runat="server" Value="0" />--%>
            <asp:UpdatePanel ID="UpdatePanelListView"
                runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <asp:ListView ID="listItems" runat="server"
                        OnItemDeleting="listItems_ItemDeleting"
                        OnItemDataBound="listItems_ItemDataBound" OnPreRender="listItems_PreRender">
                        <LayoutTemplate>
                            <table class="table">
                                <thead>
                                    <th class="sn">S/N</th>
                                    <th class="stationery">Stationery</th>
                                    <th class="reorderlevel" style="width: 5%">Reorder Level</th>
                                    <th class="stock" style="width: 5%">Stock</th>
                                    <th class="supplier" style="width: 20%">Suppliers</th>
                                    <th class="price" style="width: 5%">Price</th>
                                    <th class="orderqty" style="width: 5%">Order Quantity</th>
                                    <th class="amount" style="width: 10%">Amount</th>
                                    <th class="icon" style="width: 1%"></th>
                                </thead>
                                <tfoot>
                                    <td colspan="7" align="right">Grand Total: </td>
                                    <td><b>$</b><asp:Label ID="lblGrandTotal" runat="server" Text="" Font-Bold="true" Style="float: right"></asp:Label>
                                    </td>
                                    <td></td>
                                </tfoot>
                                <tbody id="itemPlaceholder" runat="server"></tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tbody>
                                <%-- Item Row --%>
                                <tr>
                                    <td class="sn">
                                        <asp:HiddenField ID="hfItemCode" runat="server" Value='<%# Eval("Stationery.ItemCode") %>' />
                                        <asp:HiddenField ID="hfReorderQty" runat="server" Value='<%# Eval("Stationery.ReorderQuantity") %>' />
                                        <asp:Label ID="lblSN" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td class="stationery"><span class="text"><%# Eval("Stationery.Description") %></span>
                                    </td>
                                    <td class="reorderlevel"><span class="text"><%# Eval("Stationery.ReorderLevel") %></span></td>
                                    <td class="stock"><span class="text"><%# Eval("Stationery.Stock") %> <%# Eval("Stationery.MeasureUnit") %></span></td>
                                    <td class="supplier">
                                        <asp:DropDownList ID="ddlSuppliers" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSuppliers_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="price">$<asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td class="orderqty">
                                        <asp:TextBox ID="txtOrderQuantity" runat="server" AutoPostBack="true"
                                            OnTextChanged="txtOrderQuantity_TextChanged" CssClass="control"
                                            Text='<%# Eval("OrderQuantity") %>' TextMode="Number" Width="80px" />
                                        <br />
                                        <span class="text"><%# Eval("Stationery.MeasureUnit") %></span>
                                    </td>
                                    <td class="amount"><b>$</b><asp:Label ID="lblAmount" runat="server" Text="" Font-Bold="true" Style="float: right"></asp:Label>
                                    </td>
                                    <td class="icon">
                                        <asp:LinkButton ID="linkDelete" CommandName="Delete" runat="server" Style="color: firebrick;">
                                    <i class="fa fa-minus-circle fa-2x" aria-hidden="true"></i>
                                        </asp:LinkButton></td>
                                </tr>
                                <%-- Notes and Validator Row --%>
                                <tr>
                                    <td colspan="5" style="border-top: none;">Notes (Max 200 characters) 
                                        <asp:RegularExpressionValidator ControlToValidate="txtNotes" ForeColor="Red"
                                            ID="validNotes" ValidationExpression="^[\s\S]{0,200}$" runat="server" ValidationGroup="validGroupSubmit"
                                            ErrorMessage="Maximum 200 characters allowed."></asp:RegularExpressionValidator>
                                    </td>
                                    <td colspan="4" style="border-top: none;" align="right">
                                        <asp:CustomValidator ID="validOrderQuantity" runat="server"
                                            OnServerValidate="validOrderQuantity_ServerValidate" ValidationGroup="validGroupSubmit"
                                            ControlToValidate="txtOrderQuantity" ForeColor="Red" ErrorMessage="">
                                        </asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" style="border-top: none;">
                                        <asp:TextBox ID="txtNotes" runat="server" Rows="2" AutoPostBack="true"
                                            OnTextChanged="txtNotes_TextChanged" resize="none" CausesValidation="true"
                                            TextMode="MultiLine" Width="100%" Text='<%# Eval("Notes") %>'></asp:TextBox></td>
                                    <td colspan="4" style="border-top: none;">Recommended Reorder Qty:
                                        <asp:Label runat="server" ID="lblRecommendQty" Style="padding-left: 10px"></asp:Label>
                                        <span><%# Eval("Stationery.MeasureUnit") %></span><br />
                                        <%--<button type="button" class="btn btn-link" data-toggle="modal" data-target="#modalBreakdown" style="padding-left: 0;">
                                            View Breakdown
                                        </button>--%>
                                        <asp:LinkButton ID="linkBreakdown" runat="server" OnCommand="linkBreakdown_Command"
                                            CommandArgument='<%# Eval("Stationery.ItemCode") %>'>
                                                                View Breakdown</asp:LinkButton>
                                        <!-- Modal -->
                                        <div class="modal fade" id='<%# "modalBreakdown" + Eval("Stationery.ItemCode") %>' tabindex="-1" role="dialog"
                                            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog" role="document" style="width: 90%">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <div style="float: left;">
                                                            <h3 class="modal-title">Breakdown of Recommended Quantity</h3>
                                                        </div>
                                                        <div style="float: right;">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-4">Item:&nbsp;&nbsp;<b><%# Eval("Stationery.Description") %></b></div>
                                                                <div class="col-md-4">Date:&nbsp;&nbsp;<b><%# DateTime.Now.ToString("d MMM yyyy") %></b></div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-4">
                                                                    Recommended Reorder Level:&nbsp;&nbsp;
                                                                    <b><%# (int)(Convert.ToInt32(Eval("Stationery.ReorderLevel")) * 1.2) %>&nbsp;<%# Eval("Stationery.MeasureUnit") %></b>
                                                                    <br />
                                                                    (1.2x Reorder Level)
                                                                </div>
                                                                <div class="col-md-4">
                                                                    Minimum Reorder Qty:&nbsp;&nbsp;
                                                                    <b><%# Eval("Stationery.ReorderQuantity") %>&nbsp;<%# Eval("Stationery.MeasureUnit") %></b>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    Current Stock:&nbsp;&nbsp;
                                                                    <b><%# Eval("Stationery.Stock") %>&nbsp;<%# Eval("Stationery.MeasureUnit") %></b>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <asp:Panel runat="server" ID="panelNoRequests">
                                                                        <h5>No outstanding requests for this item.</h5>
                                                                    </asp:Panel>
                                                                    <asp:ListView runat="server" ID="listRequests" OnItemDataBound="listRequests_ItemDataBound">
                                                                        <LayoutTemplate>
                                                                            <table class="table">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th>Request#</th>
                                                                                        <th class="right">Remaining Qty</th>
                                                                                        <th class="right">Disbursing / Allocating</th>
                                                                                        <th class="right">Required Qty</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tfoot>
                                                                                    <tr>
                                                                                        <th>Grand Total</th>
                                                                                        <th class="right">
                                                                                            <asp:Label runat="server" ID="lblTotalRemainingQty" Text="0"></asp:Label></th>
                                                                                        <th class="right">
                                                                                            <asp:Label runat="server" ID="lblTotalDisbursingOrAllocating" Text="0"></asp:Label></th>
                                                                                        <th class="right">
                                                                                            <asp:Label runat="server" ID="lblTotalRequiredQty" Text="0"></asp:Label></th>
                                                                                    </tr>
                                                                                </tfoot>
                                                                                <tbody id="itemPlaceholder" runat="server"></tbody>
                                                                            </table>
                                                                        </LayoutTemplate>
                                                                        <ItemTemplate>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><a href='RequisitionDetails?REQUESTCODE=<%# Eval("RequestCode") %>' target="_blank"><%# Eval("RequestCode") %></a></td>
                                                                                    <td class="right">
                                                                                        <asp:Label runat="server" ID="lblRemainingQty"></asp:Label></td>
                                                                                    <td class="right">
                                                                                        <asp:Label runat="server" ID="lblDisbursingOrAllocating"></asp:Label></td>
                                                                                    <td class="right">
                                                                                        <asp:Label runat="server" ID="lblRequiredQty"></asp:Label></td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </ItemTemplate>
                                                                    </asp:ListView>
                                                                    <br />
                                                                    <asp:Panel runat="server" ID="panelNoOrders">
                                                                        <h5>No pending or approved orders for this item.</h5>
                                                                    </asp:Panel>
                                                                    <asp:ListView runat="server" ID="listOrders" OnItemDataBound="listOrders_ItemDataBound">
                                                                        <LayoutTemplate>
                                                                            <table class="table">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th>PO#</th>
                                                                                        <th class="right">Order Status</th>
                                                                                        <th class="right">Order / Approved Date</th>
                                                                                        <th class="right">Order Quantity</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tfoot>
                                                                                    <tr>
                                                                                        <th colspan="3" class="right">Grand Total</th>
                                                                                        <th class="right">
                                                                                            <asp:Label runat="server" ID="lblTotalOrderQty" Text="0"></asp:Label></th>
                                                                                    </tr>
                                                                                </tfoot>
                                                                                <tbody id="itemPlaceholder" runat="server"></tbody>
                                                                            </table>
                                                                        </LayoutTemplate>
                                                                        <ItemTemplate>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td><a href='PurchaseOrderDetail?PO=<%# Eval("PurchaseOrderCode") %>' target="_blank"><%# Eval("PurchaseOrderCode") %></td>
                                                                                    <td class="right">
                                                                                        <asp:Label runat="server" ID="lblOrderStatus"></asp:Label></td>
                                                                                    <td class="right">
                                                                                        <asp:Label runat="server" ID="lblDate"></asp:Label></td>
                                                                                    <td class="right"><%# Eval("Quantity") %></td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </ItemTemplate>
                                                                    </asp:ListView>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-md-4">
                                                                    Recommended Reorder Quantity:<b><u><asp:Label runat="server" ID="lblModalRecommendQty" Style="padding-left: 10px"></asp:Label>
                                                                        &nbsp;<%# Eval("Stationery.MeasureUnit") %></u></b>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        </div>
                                    </td>
                                </tr>

                            </tbody>
                        </ItemTemplate>
                    </asp:ListView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>


        <div class="row">
            <asp:UpdatePanel ID="UpdatePanelAddItem"
                runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <div class="col-sm-8" style="border: 1px solid rgb(147, 143, 143)">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label runat="server" ID="lblNoItems" Text="No Stationery available to add in this category" Visible="false" ForeColor="Red"></asp:Label>
                                <asp:CustomValidator ID="validAddOrderQuantity" runat="server"
                                    OnServerValidate="validAddOrderQuantity_ServerValidate" ValidationGroup="ValidGroupAdd"
                                    ControlToValidate="txtAddOrderQuantity" ForeColor="Red" ErrorMessage="" Display="Dynamic">
                                </asp:CustomValidator>
                            </div>
                        </div>
                        <div class="row">
                            <asp:HiddenField ID="hfAddItemCode" runat="server" />
                            <asp:HiddenField ID="hfAddReorderQty" runat="server" />
                            <div class="col-md-6">
                                <b>Item Category</b><br />
                                <asp:DropDownList ID="ddlAddCategory" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlAddCategory_SelectedIndexChanged" Width="100%" Style="margin-bottom: 10px">
                                </asp:DropDownList>

                            </div>
                            <div class="col-md-3">
                                <b>Reorder Level</b><br />
                                <asp:Label ID="lblAddReorderLevel" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lblAddMeasureUnitReorderLevel" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <b>Stock</b><br />
                                <asp:Label ID="lblAddStock" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lblAddMeasureUnitStock" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <b>Item Description</b><br />
                                <asp:DropDownList ID="ddlAddDescription" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlAddDescription_SelectedIndexChanged" Width="100%">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                <b>Price</b><br />
                                <asp:Label ID="lblAddPrice" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <b>Order Quantity</b><br />
                                <asp:TextBox ID="txtAddOrderQuantity" runat="server"
                                    OnTextChanged="txtAddOrderQuantity_TextChanged" CssClass="control" AutoPostBack="true"
                                    Text="" TextMode="Number" Width="80px" CausesValidation="true" />
                                <asp:Label ID="lblAddMeasureUnitQty" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <b>Supplier</b><br />
                                <asp:DropDownList ID="ddlAddSuppliers" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlAddSuppliers_SelectedIndexChanged" Width="100%">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                <b>Total Price</b><br />
                                <asp:Label ID="lblAddAmount" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:Button runat="server" ID="btnAddItem" Text="Add Item" CssClass="btn btn-primary" Width="100%"
                                    Style="margin-top: 10px" OnClick="btnAddItem_Click" ValidationGroup="ValidGroupAdd" CausesValidation="true" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="col-sm-2">
                <asp:Button runat="server" ID="btnModal" Text="Submit" CssClass="btn btn-success" CausesValidation="true" Width="100%"
                    ValidationGroup="validGroupSubmit" OnClick="btnModal_Click" />
            </div>
            <div class="col-sm-2">
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CssClass="btn btn-danger" Width="100%"
                    OnClick="btnCancel_Click" OnClientClick="return confirm('All changes made to this purchase order will be lost.');" />
            </div>
        </div>
    </div>

    <!-- Email Modal -->
    <div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
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
                        OnClick="btnSubmit_Click" Style="margin-bottom: 10px; margin-left: 0"  OnClientClick="if(this.value === 'Submitting..') { return false; } else { this.value = 'Submitting..'; }" />
                </div>
            </div>
        </div>
    </div>


</asp:Content>
