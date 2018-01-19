<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CreateNewOrder.aspx.cs"
    Inherits="InventoryWebApp.CreateNewOrder" MaintainScrollPositionOnPostback="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .row {
            margin: 10px 0;
        }

        .control {
            padding: 1px 5px;
        }

        .text {
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h3>New Purchase Order</h3>                
            </div>
        </div>
        <div class="row">
            <asp:HiddenField ID="hfGrandTotal" runat="server" Value="0" />
            <asp:ListView ID="listItems" runat="server"
                OnDataBound="listItems_DataBound"
                OnItemInserting="listItems_ItemInserting" InsertItemPosition="LastItem"
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
                                    Text='<%# Eval("OrderQuantity") %>' TextMode="Number" Width="80px" CausesValidation="true" />
                                <br />
                                <span class="text"><%# Eval("Stationery.MeasureUnit") %></span>
                            </td>
                            <td class="amount"><b>$</b><asp:Label ID="lblAmount" runat="server" Text="" Font-Bold="true" Style="float: right"></asp:Label>
                            </td>
                            <td class="icon">
                                <asp:LinkButton ID="linkDelete" CommandName="Remove" runat="server" Style="color: firebrick;"
                                    CausesValidation="true">
                                    <i class="fa fa-minus-circle fa-2x" aria-hidden="true"></i>
                                </asp:LinkButton></td>
                        </tr>
                        <%-- Validator Row --%>
                        <tr>
                            <td colspan="4" style="border-top: none;">
                                <asp:LinkButton runat="server" ID="linkViewRequest" Text="View Related Request" OnCommand="linkViewRequest_Command">
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="linkHideRequest" Text="Hide Related Request" OnCommand="linkHideRequest_Command" Visible="false">
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="linkViewPO" Text="View Related PO" OnCommand="linkViewPO_Command">
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="linkHidePO" Text="Hide Related PO" OnCommand="linkHidePO_Command" Visible="false">
                                </asp:LinkButton>
                            </td>
                            <td colspan="8" style="border-top: none;">
                                <asp:CustomValidator ID="validOrderQuantity" runat="server"
                                    OnServerValidate="validOrderQuantity_ServerValidate"
                                    ControlToValidate="txtOrderQuantity" ForeColor="Red" ErrorMessage="" Display="Dynamic">
                                </asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="12"  style="border-top: none;">
                            <%-- View Orders Row --%>
                            <asp:ListView runat="server" ID="listOrders">
                                <LayoutTemplate>
                                    <table class="table">
                                        <%--<tr>
                                            <asp:RadioButtonList ID="rdlOrderStatus" runat="server">
                                                <asp:ListItem Value="0" Selected="True">Approved and Pending</asp:ListItem>
                                                <asp:ListItem Value="1" Selected="True">Approved</asp:ListItem>
                                                <asp:ListItem Value="2" Selected="True">Pending</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </tr>--%>
                                        <thead>
                                            <th>PO#</th>
                                            <th style="width: 30%">Stationery</th>
                                            <th>Quantity</th>
                                            <th>Order Date</th>
                                            <th>Status</th>
                                        </thead>
                                        <tbody id="itemPlaceholder" runat="server"></tbody>
                                        <tfoot></tfoot>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <thead>

                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="linkPageDetail" runat="server" CommandArgument='<%#Eval("PurchaseOrderCode") %>'
                                                    OnCommand="linkPageDetail_Command"><%#Eval("PurchaseOrderCode") %></asp:LinkButton></td>
                                            <td><%#Eval("ItemCode") %></td>
                                            <td><%#Eval("Quantity") %></td>
                                            <td><%#Eval("OrderDate") %></td>
                                            <td><%#Eval("Status") %></td>
                                        </tr>
                                    </tbody>
                                    <tfoot></tfoot>
                                </ItemTemplate>
                            </asp:ListView>
                            <%-- View Requests Row --%>
                            <asp:ListView runat="server" ID="listRequests">
                                <LayoutTemplate>
                                    <table class="table">
                                        <thead>
                                            <th>Request#</th>
                                            <th style="width: 30%">Stationery</th>
                                            <th>Status</th>
                                            <th>Request Quantity</th>
                                            <th>Remaining Quantity</th>
                                            <th></th>
                                        </thead>
                                        <tbody id="itemPlaceholder" runat="server"></tbody>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tbody>
                                        <tr>
                                            <td><%#Eval("RequestCode") %></td>
                                            <td><%#Eval("ItemCode") %></td>
                                            <td><%#Eval("Status") %></td>
                                            <td><%#Eval("Quantity") %></td>
                                            <td><%#Eval("RemainingQuant") %></td>
                                            <td>
                                                <asp:LinkButton ID="linkAdd" CommandName="Insert" runat="server" Style="color: dodgerblue;"
                                                    CausesValidation="true">
                                                <i class="fa fa-plus-circle fa-2x" aria-hidden="true"></i>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </tbody>
                                </ItemTemplate>
                            </asp:ListView>
                            </td>
                        </tr>
                    </tbody>
                </ItemTemplate>
                <%-- Insert Item Template --%>
                <InsertItemTemplate>
                    <%-- Insert Item Row --%>
                    <tr>
                        <asp:HiddenField ID="hfItemCode" runat="server"  />
                        <asp:HiddenField ID="hfReorderQty" runat="server" />
                        <table class="table">
                            <tr>
                                <td>>                                
                                </td>
                                <td>Category<br />
                                    <asp:DropDownList ID="ddlAddCategory" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlAddCategory_SelectedIndexChanged" Width="100%" Style="margin-bottom: 10px">
                                    </asp:DropDownList>
                                    Description<br />
                                    <asp:DropDownList ID="ddlAddDescription" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlAddDescription_SelectedIndexChanged" Width="100%">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="lblReorderLevel" runat="server" Text=""></asp:Label></td>
                                <td>
                                    <asp:Label ID="lblStock" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="lblMeasureUnitStock" runat="server" Text=""></asp:Label>
                                </td>

                                <td>
                                    <asp:DropDownList ID="ddlAddSuppliers" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlAddSuppliers_SelectedIndexChanged" Width="100%">
                                    </asp:DropDownList>
                                </td>
                                <td>$<asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAddOrderQuantity" runat="server"
                                        OnTextChanged="txtAddOrderQuantity_TextChanged" CssClass="control"
                                        Text='<%# Eval("ReorderQuantity") %>' TextMode="Number" Width="80px" CausesValidation="true" />
                                    <br />
                                    <asp:Label ID="lblMeasureUnitQty" runat="server" Text=""></asp:Label>
                                </td>
                                <td>$<asp:Label ID="lblAmount" runat="server" Text=""></asp:Label>
                                </td>
                                <td>
                                    <asp:LinkButton ID="linkAdd" CommandName="Insert" runat="server" Style="color: dodgerblue;"
                                        CausesValidation="true">
                                    <i class="fa fa-plus-circle fa-2x" aria-hidden="true"></i>
                                    </asp:LinkButton></td>
                            </tr>
                            <tr>
                                <td colspan="12" style="border-top: none;">
                                    <asp:CustomValidator ID="validAddOrderQuantity" runat="server"
                                        OnServerValidate="validAddOrderQuantity_ServerValidate"
                                        ControlToValidate="txtAddOrderQuantity" ForeColor="Red" ErrorMessage="" Display="Dynamic">
                                    </asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                    </tr>
                </InsertItemTemplate>
            </asp:ListView>

        </div>

        <div class="row">
            <div class="col-md-12">
                Notes:
                <textarea rows="2" cols="50" maxlength="200" style="resize: none; width: 100%;"
                    class="form-control" runat="server" id="txtNotes"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8">
            </div>
            <div class="col-sm-2">
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-success" Width="100%"
                    Style="margin-bottom: 10px" OnClick="btnSubmit_Click" CausesValidation="true" />
            </div>
            <div class="col-sm-2">
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CssClass="btn btn-danger" Width="100%" OnClick="btnCancel_Click" />
            </div>
        </div>

    </div>
</asp:Content>
