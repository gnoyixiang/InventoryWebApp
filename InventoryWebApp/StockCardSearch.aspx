<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockCardSearch.aspx.cs" Inherits="InventoryWebApp.StockCardSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <!DOCTYPE html>
<html><head><title></title></head>
<body>
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
    <asp:Label ID="Label1" runat="server" Text="Stock Card" Font-Size="X-Large"></asp:Label><br /><br />
    Search By:
    <asp:DropDownList ID="ddlStockCardSearch" runat="server"></asp:DropDownList>
    <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" OnTextChanged="txtChangedEvent" OnDataBinding="txtChangedEvent"></asp:TextBox>
    <br /><br />
     <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand"  >
            
       <HeaderTemplate>

       </HeaderTemplate>
        <ItemTemplate>
                
            <asp:Button ID="btnCategory" runat="server"  Text='<%# Eval("CategoryCode") %>' CommandName="Category" />
          
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
        </asp:Repeater>
    
    <br /><br />
    <asp:GridView ID="gvItem" runat="server" AutoGenerateColumns="False"  Width="1091px" CellPadding="4"
         DataKeyNames="ItemCode" OnSelectedIndexChanged="GvItem_SelectedIndexChanged" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="GVItem_PageIndexChanging">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
                <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" SortExpression="ItemCode" />
                <asp:BoundField DataField="Description" HeaderText="Item Description" SortExpression="Description" />
                <asp:BoundField DataField="MeasureUnit" HeaderText="UOM" SortExpression="MeasureUnit" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                
                <asp:CommandField SelectText="View Stock Card" ShowSelectButton="True">
                <ItemStyle ForeColor="#333399" />
                </asp:CommandField>
                
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
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style"/>
    </body></html>
</asp:Content>
