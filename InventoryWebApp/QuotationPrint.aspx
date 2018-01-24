<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QuotationPrint.aspx.cs" Inherits="InventoryWebApp.QuotationPrint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script language="javascript">
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }</script>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>Stationery Supply Tender Quotation Form</h3>
                <div id="printA">
                    <asp:Label ID="lblSupplierName" runat="server" Text="Load supplier name here..."></asp:Label>
                    <br />
                    <asp:Label ID="lblSupplierAddress" runat="server" Text="Load supplier address here..."></asp:Label>
                    <br />
                    <asp:Label ID="lblTenderDate" runat="server" Text="Load tender created date here..." DataFormatString="{0:dd-MM-yyyy}"></asp:Label>
                    <br />
                    <%--<div style="width: 100%; height: 400px; overflow: scroll">--%>
                    <%--<div id="printA">--%>
                    <asp:GridView ID="gvItemsSupplied" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Description" HeaderText="Item Name" />
                        </Columns>
                    </asp:GridView>
                </div>
                <%--</div>--%>
            </div>
            <div class="col-sm-2">
                <div class="margin:20px 0 10px 0;">
                    <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a>
                    <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick='printDiv("printA")' />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
