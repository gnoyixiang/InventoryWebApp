<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QuotationView.aspx.cs"
    Inherits="InventoryWebApp.Store.QuotationView" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Quotation List</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div>
            <div style="text-align: right; ">
                    <a href="#" onclick='printDiv("printA")'><i class="fa fa-print fa-2x" aria-hidden="true"></i></a>
                </div>
        </div>
        <div id="printA">
        <div class="row">
            <div class="col-md-11">
                <h3>Supplier Quotation List</h3>
            </div>
        </div>

        <div class="row" style="margin-top: 10px;">

            <div class="col-lg-12">
                <asp:GridView ID="gvQuotation" runat="server" AutoGenerateColumns="False" CssClass="table table-striped"
                    HeaderStyle-BackColor="#cfd8dc" CellSpacing="-1" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="SupplierCode" HeaderText="Supplier Code" Visible="False" />
                        <asp:HyperLinkField DataTextField="SupplierName" DataNavigateUrlFields="SupplierCode" 
                            DataNavigateUrlFormatString="/Store/QuotationPrint.aspx?SupplierCode={0}"
                            HeaderText="Supplier Name" />
                        <asp:BoundField DataField="Address" HeaderText="Supplier Address" />
                        <asp:BoundField DataField="ContactName" HeaderText="Contact Person" />
                        <asp:BoundField DataField="PhoneNo" HeaderText="Contact Number" />
                    </Columns>
                </asp:GridView>

            </div>
            <div class="col-sm-2">
            </div>
        </div>
            </div>
    </div>
</asp:Content>
