<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewDisbursement.aspx.cs" Inherits="InventoryWebApp.ViewDisbursement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container-fluid">
        <h1>Disbursement List</h1>
        <h3><small class="text-muted">View all past and present disbursement lists</small></h3>
        <asp:ListView ID="lvDisbursement" runat="server">
         <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <th>DisbursementCode</th>
                            <th>DateCreated</th>
                            <th>Status</th>
                            <th>DateDisbursed</th>
                            <th>Notes</th>
                            <th>ReceivedBy</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><a href="ViewDisbursementDetails?DISBURSEMENTCODE=<%#Eval("DisbursementCode") %>" style="color: #337ab7"><%# Eval("DisbursementCode") %></a></td>
                        <td><%# Eval("DateCreated","{0:MMM dd, yyyy}") %></td>
                        <td><%# Eval("Status") %></td>
                        <td><%# Eval("DateDisbursed","{0:MMM dd, yyyy}") %></td>
                        <td><%# Eval("Notes") %></td>   
                        <td><%# Eval("ReceivedBy") %></td>                  
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
</asp:Content>
