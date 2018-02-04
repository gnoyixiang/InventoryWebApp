<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewStockCard.aspx.cs" Inherits="InventoryWebApp.Store.ViewStockCard" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .header {
            text-decoration-color: white;
            background-color: #00ffff;
        }
    </style>
    <style type="text/css">
        #table1 tr td{
            padding:10px 20px 10px 0;
        }
    </style>
    <script type="text/javascript">
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="StockCardSearch.aspx">Search Stock Card</a></li>
        <li class="active">View StockCard</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div>
            <div style="text-align: right;">
                <a href="#" onclick='printDiv("printA")'><i class="fa fa-print fa-2x" aria-hidden="true"></i></a>
            </div>
        </div>
        <asp:Panel ID="panelNoItem" runat="server">
            <h4>No stock card selected!</h4>
            <a href="/Store/StockCardSearch.aspx">Return to select search stock card</a>
        </asp:Panel>
        <asp:Panel ID="panelItem" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <h3>Stock Card</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table">
                        <tr>
                            <td style="border: none">
                                <div class="input-group">
                                    <div class="input-group-addon">From</div>
                                    <asp:TextBox ID="tbxStart" runat="server" TextMode="Month" CssClass="form-control" ValidationGroup="searchValidation"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator"
                                        runat="server"
                                        ControlToValidate="tbxStart"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ErrorMessage=" Date is required!"
                                        ValidationGroup="searchValidation" />
                                </div>
                            </td>
                            <td style="border: none">
                                <div class="input-group">
                                    <div class="input-group-addon">To</div>
                                    <asp:TextBox ID="tbxEnd" runat="server" TextMode="Month" CssClass="form-control" Width="90%" ValidationGroup="searchValidation"></asp:TextBox>
                                </div>
                                <div>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                        runat="server"
                                        ControlToValidate="tbxEnd"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ErrorMessage=" Date is required!" 
                                        ValidationGroup="searchValidation"/>
                                    <asp:CustomValidator runat="server"
                                        Display="Dynamic"
                                        ID="valDateRange"
                                        ControlToValidate="tbxStart"
                                        OnServerValidate="valDateRange_ServerValidate"
                                        ErrorMessage="Please enter valid date" ForeColor="Red"
                                        ValidationGroup="searchValidation" /><br />
                                   
                                </div>
                            </td>
                            <td style="border: none">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary"
                                    ValidationGroup="searchValidation" /></td>
                        </tr>

                    </table>
                </div>
            </div>
            <div id="printA">
                <div class="row">
                    <div class="col-md-12">
                        <table id="table1">
                            <tr>
                                <td>
                                    <asp:Label ID="lblItemCode" runat="server" Text="Item Code:" Font-Bold="true"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lblItemCodeValue" runat="server" Text="Label"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lblfirstSupplier" runat="server" Text="1st Supplier:" Font-Bold="true"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lblfirstSupplierValue" runat="server" Text="Label"></asp:Label></td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblDes" runat="server" Text="Item Description:" Font-Bold="true"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lblDesValue" runat="server" Text="Label"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lblsecondSupplier" runat="server" Text="2nd Supplier:" Font-Bold="true"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lblsecondSupplierValue" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblUOM" runat="server" Text="Unit of Measure:" Font-Bold="true"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lblUOMValue" runat="server" Text="Label"></asp:Label></td>
                                 <td>
                                    <asp:Label ID="lblthirdSupplier" runat="server" Text="3rd Supplier:" Font-Bold="true"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lblthirdSupplierValue" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                            
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lblShowStatus" runat="server" Text="Label" ForeColor="#3333CC" Font-Size="Medium" Visible="False"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Panel ID="panelStockCard" runat="server">
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
