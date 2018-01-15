<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ItemDetails.aspx.cs" Inherits="InventoryWebApp.ItemDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <ul class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">View Catalogue</a></li>
                <li class="active">Item Details</li>
            </ul>
    <h3>Item Details</h3>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblItemCode" runat="server" Text="Item Number"></asp:Label>&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td>
                <asp:TextBox ID="tbxItemCode" runat="server" ReadOnly="true"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
                <br />
                <br />
            </td>
            <td>
                <asp:TextBox ID="tbxCategory" runat="server" ReadOnly="true"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                <br />
                <br />
            </td>
            <td>
                <asp:TextBox ID="tbxDescription" runat="server" ReadOnly="true"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblQuantity" runat="server" Text="Quantity"></asp:Label></td>
            <td>
                <asp:RadioButtonList ID="rdlQuantity" runat="server" OnSelectedIndexChanged="rdlQuantity_SelectedIndexChanged" AutoPostBack="true" Font-Size="Medium" RepeatDirection="Horizontal">
                    <asp:ListItem>10</asp:ListItem>
                   
                    <asp:ListItem>30</asp:ListItem>

                    <asp:ListItem>50</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rdlRequiredValidator" runat="server" ControlToValidate="rdlQuantity" ErrorMessage="Quantity is empty" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <asp:TextBox ID="tbxQuantity" runat="server" OnTextChanged="tbxQuantity_TextChanged" AutoPostBack="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="tbxRequiredValidator" runat="server" ControlToValidate="tbxQuantity" ErrorMessage="Quantity is Empty" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblQuantityResult" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <br />


    <asp:Button ID="btnAddItem" runat="server" Text="Add to Request" OnClick="btnAddItem_Click" />
    <!-- Button trigger modal -->
    <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  Add To Request
</button>--%>
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
                    <a href="/CreateRequest.aspx" class="btn btn-default">OK</a>
                    <a href="/ViewCatalogue.aspx" class="btn btn-primary">Back To Catalogue</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
