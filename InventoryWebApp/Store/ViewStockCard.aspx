<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewStockCard.aspx.cs" Inherits="InventoryWebApp.Store.ViewStockCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .header {
            text-decoration-color: white;
            background-color: #00ffff;
        }
    </style>
    <style type="text/css">
        .rowstyle {
            background-color: #EFF3FB;
        }

        .row {
            margin: 10px 0;
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
        <li><a href="StockCardSearch.aspx">Search Item</a></li>
        <li class="active">View StockCard</li>
    </ul>

    <asp:Panel ID="panelNoItem" runat="server">
        <h4>No stock card selected!</h4>
        <a href="/Store/StockCardSearch.aspx">Return to select stock card</a>
    </asp:Panel>
    <asp:Panel ID="panelItem" runat="server">
        <div class="row">
            <div class="col-md-10" style="padding-left:0;">
                <h3>
                    <asp:Label ID="Label1" runat="server" Text="Stock Card"></asp:Label></h3>
            </div>
            <div class="col-md-2" style="text-align: right">
                <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick='printDiv("printA")' />
            </div>
        </div>
        <table >
            <tr>
                <td>
                    <div class="input-group" style="margin: 10px 10px;" >
                        <div class="input-group-addon">From</div>
                        <asp:TextBox ID="tbxStart" runat="server" TextMode="Month" CssClass="form-control"></asp:TextBox>
                    </div>

                </td>
                <td>
                    <div class="input-group" style="margin: 10px 10px;">
                        <div class="input-group-addon">To</div>
                        <asp:TextBox ID="tbxEnd" runat="server" TextMode="Month" CssClass="form-control" Width="90%"></asp:TextBox>
                    </div>
                    <td>

                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary" /></td>
            </tr>
            <tr>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator"
                        runat="server"
                        ControlToValidate="tbxStart"
                        Display="Dynamic"
                        ForeColor="Red"
                        ErrorMessage=" Date is required!" /></td>
                <td>
                    <asp:CustomValidator runat="server"
                        ID="valDateRange"
                        ControlToValidate="tbxStart"
                        OnServerValidate="valDateRange_ServerValidate"
                        ErrorMessage="Please enter valid date" ForeColor="Red" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="tbxEnd"
                        Display="Dynamic"
                        ForeColor="Red"
                        ErrorMessage=" Date is required!" /></td>
            </tr>
        </table>
        <br />
        <br />
        <div id="printA">
            <table border="0" style="width: 400px; height: 100px">
                <tr>
                    <td>
                        <asp:Label ID="lblItemCode" runat="server" Text="Item Code"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblItemCodeValue" runat="server" Text="Label"></asp:Label></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDes" runat="server" Text="Item Description"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblDesValue" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUOM" runat="server" Text="UOM"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblUOMValue" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblfirstSupplier" runat="server" Text="1st Supplier"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblfirstSupplierValue" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblsecondSupplier" runat="server" Text="2nd Supplier"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblsecondSupplierValue" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblthirdSupplier" runat="server" Text="3rd Supplier"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblthirdSupplierValue" runat="server" Text="Label"></asp:Label></td>
                </tr>
            </table>
            <asp:Label ID="lblShowStatus" runat="server" Text="Label" ForeColor="#3333CC" Font-Size="Medium" Visible="False"></asp:Label>
            <br />

            <asp:Panel ID="panelStockCard" runat="server">
            </asp:Panel>
        </div>
    </asp:Panel>
</asp:Content>
