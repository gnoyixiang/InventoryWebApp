<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PendingPODetails.aspx.cs" Inherits="InventoryWebApp.PendingPODetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <html>
<head>
  <title></title>
</head>
<body>
    
    <asp:Label ID="Label1" runat="server" Text="PO Details" Font-Size="X-Large"></asp:Label><br /><br /><br />
    <table border="0" style="width: 400px;height:100px"><tr><td>
    <asp:Label ID="lblNo" runat="server" Text="No             :"></asp:Label></td>
   <td><asp:Label ID="lblNoValue" runat="server" Text="Label"></asp:Label></td> </tr>
   <tr><td><asp:Label ID="lblIssueDate" runat="server" Text="Issue Date    :"></asp:Label></td>
    <td><asp:Label ID="lblIssueDateValue" runat="server" Text="Label"></asp:Label></td></tr> 
    <tr><td><asp:Label ID="lblSName" runat="server" Text="Supplier Name   :"></asp:Label></td>
   <td><asp:Label ID="lblSupplierNameValue" runat="server" Text="Label"></asp:Label></td> </tr>
      </table>
      <asp:GridView ID="gvPendingPODetails" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" 
          Width="1091px" CellPadding="4" ShowFooter="True"  ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                 <asp:TemplateField HeaderText="No" >
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" SortExpression="ItemCode" />
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <asp:Label ID="lblDescription" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:TemplateField HeaderText="Price" SortExpression="Quantity">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("Price", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
               
               
                <asp:TemplateField HeaderText="Amount" >
                    <ItemTemplate>
                         <asp:Label ID="lblAmount" runat="server" ></asp:Label>
                    </ItemTemplate>
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
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp; </body></html>
    <asp:Button ID="btnApprove" runat="server" Text="Approve" BackColor="Lime" ForeColor="Black" OnClick="btnApprove_Click" OnClientClick="return confirm('Do you want to approve?')" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnReject" runat="server" Text="Reject" BackColor="#FF6666" OnClick="btnReject_Click" OnClientClick="return confirm('Do you want to reject?')" />
       </asp:Content>
