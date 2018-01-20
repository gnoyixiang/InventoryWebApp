<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewStockCard.aspx.cs" Inherits="InventoryWebApp.ViewStockCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
<html><head><title></title></head>
<body>
    <asp:Label ID="Label1" runat="server" Text="Stock Card" Font-Size="X-Large"></asp:Label>
     <table border="0" style="width: 600px;height:100px"  >
     <tr><td> <asp:Label ID="lblItemCode" runat="server" Text="Item Code"></asp:Label></td>
         <td><asp:Label ID="lblItemCodeValue" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr><td> <asp:Label ID="lblDes" runat="server" Text="Item Description"></asp:Label></td>
         <td><asp:Label ID="lblDesValue" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr><td> <asp:Label ID="lblUOM" runat="server" Text="UOM"></asp:Label></td>
         <td><asp:Label ID="lblUOMValue" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr><td> <asp:Label ID="lblfirstSupplier" runat="server" Text="1st Supplier"></asp:Label></td>
         <td><asp:Label ID="lblfirstSupplierValue" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr><td> <asp:Label ID="lblsecondSupplier" runat="server" Text="2nd Supplier"></asp:Label></td>
         <td><asp:Label ID="lblsecondSupplierValue" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr><td> <asp:Label ID="lblthirdSupplier" runat="server" Text="3rd Supplier"></asp:Label></td>
         <td><asp:Label ID="lblthirdSupplierValue" runat="server" Text="Label"></asp:Label></td>
    </tr>
   <tr><td>
   Select Month</td>
    <td><asp:TextBox ID="tbxMonth" runat="server" TextMode="Month" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator"
                            runat="server"
                            ControlToValidate="tbxMonth"
                            Display="Static"
                            ForeColor="Red"
                            ErrorMessage=" Date is required!" /> </td></tr><tr><td></td><td>
      <asp:Button ID="btnSearch" runat="server"  Text="Search" OnClick="btnSearch_Click" /></td></tr></table><br />
    <asp:Label ID="lblShowStatus" runat="server" Text="Label" ForeColor="#3333CC" Font-Size="X-Large" Visible="False"></asp:Label>
     <br />
     <asp:GridView ID="gvStockCard" runat="server" AutoGenerateColumns="False" Width="1091px" CellPadding="4" OnRowDataBound="OnRowDataBound" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="GvStockCard_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Date">
                    <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date", "{0:dd/MM/yyyy}") %>'
></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
           
                <asp:TemplateField HeaderText="Dept/Supplier">
                    <ItemTemplate>
                        <asp:Label ID="lblDepSup" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Qty">
                    <ItemTemplate>
                        <asp:Label ID="lblQuantity" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                  <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
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
