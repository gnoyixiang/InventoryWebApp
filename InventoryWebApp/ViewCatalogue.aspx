<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewCatalogue.aspx.cs" Inherits="InventoryWebApp.ViewCatalogue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <ul class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">View Catalogue</li>
            </ul>
    <asp:DropDownList ID="ddlSearchBy" runat="server">
        <asp:ListItem>Description</asp:ListItem>
        <asp:ListItem>ItemCode</asp:ListItem>
        <asp:ListItem>Category</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txbkeyword" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridViewCatalogue" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True"
    OnPageIndexChanging="OnPageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
     <Columns>
         <asp:TemplateField HeaderText ="Item Number" ItemStyle-Width="150px">
             <ItemTemplate>
                 <asp:HyperLink ID="ItemCode" runat="server" ForeColor="Blue" DataNavigateUrlFields="ItemCode" 
                     NavigateUrl='<%#"~/ItemDetails.aspx?ItemCode="+ Eval("ItemCode")%>'
                     Text='<%# Eval("ItemCode") %>'>
                 </asp:HyperLink>
             </ItemTemplate>
         </asp:TemplateField>
                <asp:BoundField DataField="CategoryCode" HeaderText="Category Code" >
<ItemStyle Width="150px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="Description" >
<ItemStyle Width="150px"></ItemStyle>
                </asp:BoundField>
         </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="First" LastPageText="Last" PreviousPageText="" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>
