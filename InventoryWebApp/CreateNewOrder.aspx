<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CreateNewOrder.aspx.cs"
    Inherits="InventoryWebApp.CreateNewOrder" MaintainScrollPositionOnPostback="true" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h3>New Purchase Order</h3>
                <label id="lblnotes" runat="server"></label>
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
                            <tr>
                                <th>S/N</th>
                                <th style="width: 30%">Stationery</th>
                                <th>Reorder Level</th>
                                <th>Stock</th>
                                <th>Suppliers</th>
                                <th>Price</th>
                                <th>Order Quantity</th>
                                <th>Amount</th>
                                <th></th>
                            </tr>
                            <div id="itemPlaceholder" runat="server"></div>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>Grand Total: </td>
                                <td><b>$</b><asp:Label ID="lblGrandTotal" runat="server" Text="" Font-Bold="true" style="float:right"></asp:Label>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <asp:HiddenField ID="hfItemCode" runat="server" Value='<%# Eval("Stationery.ItemCode") %>' />
                        <asp:HiddenField ID="hfReorderQty" runat="server" Value='<%# Eval("Stationery.ReorderQuantity") %>' />
                        <tr>
                            <td>
                                <asp:Label ID="lblSN" runat="server" Text=""></asp:Label>
                            </td>
                            <td><span class="text"><%# Eval("Stationery.Description") %></span>
                                <%--<br /><br />    
                                <asp:CustomValidator ID="validOrderQuantity" CssClass="text" runat="server"
                                    OnServerValidate="validOrderQuantity_ServerValidate"
                                    ControlToValidate="txtOrderQuantity" ForeColor="Red" ErrorMessage="" Display="Dynamic">
                                </asp:CustomValidator>--%>
                            </td>
                            <td><span class="text"><%# Eval("Stationery.ReorderLevel") %></span></td>
                            <td><span class="text"><%# Eval("Stationery.Stock") %> <%# Eval("Stationery.MeasureUnit") %></span></td>
                            <td>
                                <asp:DropDownList ID="ddlSuppliers" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlSuppliers_SelectedIndexChanged" >
                                </asp:DropDownList>
                            </td>
                            <td>$<asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOrderQuantity" runat="server" AutoPostBack="true"
                                    OnTextChanged="txtOrderQuantity_TextChanged" CssClass="control"
                                    Text=<%# Eval("OrderQuantity") %> TextMode="Number" Width="80px" CausesValidation="true" />
                                <br />
                                <span class="text"><%# Eval("Stationery.MeasureUnit") %></span>
                            </td>
                            <td><b>$</b><asp:Label ID="lblAmount" runat="server" Text="" Font-Bold="true"  style="float:right"></asp:Label>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="12" style="border-top: none;">
                                <asp:CustomValidator ID="validOrderQuantity" runat="server"
                                    OnServerValidate="validOrderQuantity_ServerValidate"
                                    ControlToValidate="txtOrderQuantity" ForeColor="Red" ErrorMessage="" Display="Dynamic">
                                </asp:CustomValidator>
                            </td>
                        </tr>

                    </ItemTemplate>
                    <InsertItemTemplate>
                        <asp:HiddenField ID="hfItemCode" runat="server" Value='' />
                        <asp:HiddenField ID="hfReorderQty" runat="server" Value='' />
                        <tr>
                            <td> >                                
                            </td>
                            <td>
                                Category<br />
                                <asp:DropDownList ID="ddlAddCategory" runat="server" AutoPostBack="true" 
                                    OnSelectedIndexChanged="ddlAddCategory_SelectedIndexChanged" Width="100%" style="margin-bottom:10px"></asp:DropDownList>
                                Description<br /> 
                                <asp:DropDownList ID="ddlAddDescription" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlAddDescription_SelectedIndexChanged" Width="100%"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="lblReorderLevel" runat="server" Text=""></asp:Label></td>
                            <td><asp:Label ID="lblStock" runat="server" Text=""></asp:Label>
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
                                <asp:LinkButton ID="linkAdd" CommandName="Insert" runat="server" style="color:dodgerblue;"
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
