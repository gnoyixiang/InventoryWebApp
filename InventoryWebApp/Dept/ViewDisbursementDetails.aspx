<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewDisbursementDetails.aspx.cs" Inherits="InventoryWebApp.Dept.ViewDisbursementDetails" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="Home">Home</a></li>
        <li><a href="ViewDisbursement">View Disbursement</a></li>
        <li class="active">Disbursement Details</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div>
            <div style="text-align: right; ">
                    <a href="#" onclick='printDiv("printableArea")'><i class="fa fa-print fa-2x" aria-hidden="true"></i></a>
                </div>
        </div>
        <div id="printableArea">
            <div class="row">
                <div class="col-md-11">
                    <h3>Disbursement Details</h3>
                </div>
                    
            </div>
            <asp:Panel ID="Panel2" runat="server" Visible="false">No Disbursement Details found!</asp:Panel>
            <asp:Panel ID="Panel1" runat="server">
                <div class="row">
                    <div class="col-md-4">
                        <label>Disbursement Code: </label>
                        <asp:Label ID="lblDisbursementCode" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">
                        <label>Disbursment Status: </label>
                        <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <br />
                <asp:ListView ID="lvDisbursementDetails" runat="server">
                    <LayoutTemplate>
                        <table class="table table-striped">
                            <tr style="background-color:#cfd8dc">
                                <th>Request Code</th>
                                <th>Item Code</th>
                                <th>Quantity</th>
                                <th>Notes</th>

                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("RequestCode") %></td>
                            <td><%# Eval("ItemCode") %></td>
                            <td><%# Eval("Quantity") %></td>
                            <td><%# Eval("Notes") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </asp:Panel>
           
        </div>

    </div>

    <script type="text/javascript">
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }

    </script>
</asp:Content>
