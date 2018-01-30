<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QuotationPrint.aspx.cs"
    Inherits="InventoryWebApp.Store.QuotationPrint" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        th:nth-child(2) {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="QuotationView">Quotation List</a></li>
        <li class="active">Quotation Form</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <asp:Panel ID="panelNoForm" runat="server">
            <h3>No supplier found!</h3>
            <a href="/Store/QuotationView.aspx">Return to view all quotations</a>
        </asp:Panel>
        <asp:Panel ID="panelForm" runat="server">
            <div>
                <div style="text-align: right;">
                    <a href="#" onclick='printDiv("printA")'><i class="fa fa-print fa-2x" aria-hidden="true"></i></a>
                </div>
            </div>
            <div id="printA">
                <div class="row">
                    <div class="col-md-11">
                        <h3>Supplier Quotation Form</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:DropDownList runat="server" ID="ddlYear" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" CssClass="form-control" Width="100px"
                            AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
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
                        Quotation Date:
                    <asp:Label ID="lblTenderDate" runat="server" Text="Load tender created date here..."></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <asp:GridView ID="gvItemsSupplied" runat="server" AutoGenerateColumns="False" CssClass="table table-striped"
                            OnRowDataBound="gvItemsSupplied_RowDataBound" HeaderStyle-BackColor="#cfd8dc"
                            CellSpacing="-1" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="Stationery Description">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDescription"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quotation Price ($)" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPrice"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
