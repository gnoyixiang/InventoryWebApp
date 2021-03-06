﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdjustmentByStoreSupervisor.aspx.cs" Inherits="InventoryWebApp.AdjustmentByStoreSupervisor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="gvPendingAdjutment" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="false" DataKeyNames="AdjustmentCode"
        OnRowDataBound="gvPendingAdjutment_RowDataBound" OnRowCommand="gvPendingAdjutment_RowCommand">
        <AlternatingRowStyle BackColor="White" />
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

        <Columns>
                <asp:TemplateField HeaderText="ItemCode" SortExpression="ItemCode" >
                    <ItemTemplate>
                        <asp:Label ID="lblItemCode" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price" SortExpression="Price" >
                    <ItemTemplate>
                        <asp:Label ID="lblSymbol" runat="server" Text="Label">S$</asp:Label>
                        <asp:Label ID="lblPrice" runat="server" ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="AdjustmentQuantity" SortExpression="AdjustmentQuant" >
                    <ItemTemplate>
                        <asp:Label ID="lblAdjustmentQuant"  ItemStyle-HorizontalAlign="center" runat="server" Text='<%# Bind("AdjustmentQuant") %>'  ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Stock" SortExpression="Stock" >
                    
                    <ItemTemplate>
                        <asp:Label ID="lblStock" runat="server" ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Reason" SortExpression="Reason" >
                    
                    <ItemTemplate>
                        <asp:Label ID="lblReason" runat="server" Text='<%# Bind("Reason") %>' ></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="HeadRemarks" SortExpression="HeadRemarks" >
                    
                    <ItemTemplate>
                        <%--<asp:Label ID="lblHeadRemarks" runat="server" Text='<%# Bind("HeadRemarks") %>'></asp:Label>--%>
                        <asp:TextBox ID="tbxHeadRemarks" runat="server" Text='<%# Bind("HeadRemarks") %>'  ViewStateMode="Disabled" ></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                
            <asp:TemplateField ItemStyle-Width="120px"  HeaderText="Approve">
                <ItemTemplate>
                    <asp:Button Text="Approve" CommandName="Approve" ToolTip="Approve" Width="70px" Height="30px" runat="server" ForeColor="Green" />

                </ItemTemplate>

            </asp:TemplateField>

             <asp:TemplateField ItemStyle-Width="120px" HeaderText="Reject">
                <ItemTemplate>
                    <asp:Button Text="Reject" CommandName="Reject" ToolTip="Reject" Width="60px" Height="30px" runat="server" ForeColor="Red" />

                </ItemTemplate>

            </asp:TemplateField>
                
            </Columns>
        


    </asp:GridView>

    <br />
    <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green" ViewStateMode="Disabled"></asp:Label>
    <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red" ViewStateMode="Disabled"></asp:Label>

</asp:Content>
