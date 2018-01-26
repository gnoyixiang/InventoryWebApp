<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QuotationPrint.aspx.cs" Inherits="InventoryWebApp.QuotationPrint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
    <asp:Panel ID="panelNoForm" runat="server">
        <h3>No supplier found!</h3>
        <a href="/Store/QuotationView.aspx">Return to view all quotations</a>
    </asp:Panel>
    <asp:Panel ID="panelForm" runat="server">
    <div class="row">
        <div class="col-md-11">
            <h3>Stationery Supply Tender Quotation Form</h3>
        </div>
        <div class="col-md-1" style="text-align: right"><a href="#" onclick='printDiv("printA")'><i style="margin: 20px 0 10px 0" class="fa fa-print fa-2x" aria-hidden="true"></i></a></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblSupplierName" runat="server" Text="Load supplier name here..."></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblSupplierAddress" runat="server" Text="Load supplier address here..."></asp:Label>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-12">
            Year: <asp:DropDownList runat="server" ID="ddlYear" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"
                AutoPostBack="true"></asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            Quotation Date: <asp:Label ID="lblTenderDate" runat="server" Text="Load tender created date here..."></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8" id="printA">

            <%--<div style="width: 100%; height: 400px; overflow: scroll">--%>
            <%--<div id="printA">--%>
            <asp:GridView ID="gvItemsSupplied" runat="server" AutoGenerateColumns="False" CssClass="table" 
                OnRowDataBound="gvItemsSupplied_RowDataBound"
                CellSpacing="-1" GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText ="Stationery Description" >
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblDescription"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Quotation Price" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" >
                        <ItemTemplate>
                            $&nbsp;&nbsp;<asp:Label runat="server" ID="lblPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <%--</div>--%>
    </div>
        </asp:Panel>
</asp:Content>
