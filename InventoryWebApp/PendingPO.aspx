<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PendingPO.aspx.cs" Inherits="InventoryWebApp.PendingPO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Pending PurchaseOrder</li>
            </ul>
   <style>
        .pager-style{

        }
        .pager-style span, .pager-style a{
            padding: 0 5px;
            font-size: 16px;
        }
        .pager-style span{
            font-weight: 600;
            text-decoration:underline;
        }
        .pager-style a{

        }
    </style>
    <!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
   
    <asp:Label ID="Label1" runat="server" Text="Pending PO Lists" Font-Size="X-Large"></asp:Label><br /><br /><br />
     <asp:GridView ID="gvPendingPO" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" Width="1091px" CellPadding="4"
           DataKeyNames="PurchaseOrderCode" OnSelectedIndexChanged="GvPendingPO_SelectedIndexChanged" AllowPaging="True" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvPendingPO_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
              <asp:TemplateField HeaderText="No" >
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="DateCreated" HeaderText="Issue Date" SortExpression="DateCreated" />
               
                <asp:TemplateField HeaderText="Total Price">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Supplier Name">
                    <ItemTemplate>
                        <asp:Label ID="lblSupplierName" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="View Details"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle ForeColor="#3333CC" />
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style"/></body></html>
</asp:Content>
