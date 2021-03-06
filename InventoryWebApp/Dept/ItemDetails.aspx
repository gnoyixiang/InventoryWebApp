﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ItemDetails.aspx.cs" Inherits="InventoryWebApp.Dept.ItemDetails" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="Home">Home</a></li>
        <li><a href="ViewCatalogue">View Catalogue</a></li>
        <li class="active">Item Details</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
    <div class="row">
        <div class="col-md-10">
            <h3>Item Details</h3>
        </div>
    </div>
    <asp:Panel runat="server" ID="panelNoItem">
        <div class="row">
        <div class="col-md-10">
            <p>No Item Selected. Return to <a href="ViewCatalogue">View Catalogue</a></p>
        </div>
    </div>
    </asp:Panel>
    <asp:UpdatePanel ID="UpdatePanelListView"
        runat="server" UpdateMode="Always">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lbl1" runat="server" Text="Item Number: " Visible="false"></asp:Label>&nbsp;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td>
                        <asp:Label ID="lblItemCode" runat="server" Visible="false"></asp:Label>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl3" runat="server" Text="Description: "></asp:Label>
                        <br />
                        <br />
                    </td>
                    <td>
                        <asp:Label ID="lblDescription" runat="server"></asp:Label>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl2" runat="server" Text="Category: "></asp:Label>
                        <br />
                        <br />
                    </td>
                    <td>
                        <asp:Label ID="lblCategory" runat="server"></asp:Label>
                        <br />
                        <br />
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity: "></asp:Label></td>
                    <td>
                        <asp:RadioButtonList ID="rdlQuantity" runat="server" OnSelectedIndexChanged="rdlQuantity_SelectedIndexChanged" AutoPostBack="true" Font-Size="Medium" RepeatDirection="Horizontal">
                            <asp:ListItem>10</asp:ListItem>

                            <asp:ListItem>30</asp:ListItem>

                            <asp:ListItem>50</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rdlRequiredValidator" runat="server" ControlToValidate="rdlQuantity" ErrorMessage="Quantity is required!" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblAnotherQuantity" runat="server" Text="Enter another quantity here!"></asp:Label>
                        <br />
                        <asp:TextBox ID="tbxQuantity" runat="server" OnTextChanged="tbxQuantity_TextChanged" AutoPostBack="true" type="number"></asp:TextBox>
                        <asp:CompareValidator ID="quantityCompareValidator1" runat="server" ErrorMessage="Enter an integer value" Type="Integer" ControlToValidate="tbxQuantity" Operator="DataTypeCheck" ForeColor="Red"></asp:CompareValidator>
                        <br />
                        <asp:CompareValidator ID="quantityCompareValidator2" runat="server" ErrorMessage="Enter a value greater than Zero" Type="Integer" Operator="GreaterThan" ValueToCompare="0" ControlToValidate="tbxQuantity" ForeColor="Red"></asp:CompareValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="tbxRequiredValidator" runat="server" ControlToValidate="tbxQuantity" ErrorMessage="Quantity is required!" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblQuantityResult" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnAddToRequest" runat="server" Text="Add to Request" OnClick="btnAddToRequest_Click" Class="btn btn-success" />

            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Add Success!</h4>
                        </div>
                        <div class="modal-body">
                            Proceed to Requisition List?
                        </div>
                        <div class="modal-footer">
                            <a href="CreateRequest.aspx" class="btn btn-default">OK</a>
                            <a href="ViewCatalogue.aspx" class="btn btn-primary">Back To Catalogue</a>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel></div>
</asp:Content>
