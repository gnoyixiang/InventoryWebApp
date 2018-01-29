﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ApproveRequest.aspx.cs" Inherits="InventoryWebApp.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   
    <p>
        <br />
    </p>
    <p>
    </p>
<h1>Pending Requisition</h1>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
    <p>&nbsp;</p>
    <p> <asp:Label ID="lblSearch" runat="server" ForeColor="Black" Text="Search By"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlSelect" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSelect_SelectedIndexChanged">
            <asp:ListItem>Employee Name</asp:ListItem>
            <asp:ListItem>Date</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlEmpName" runat="server" Visible="False">
        </asp:DropDownList>
&nbsp;
        <asp:Button ID="btnSearch" runat="server" class="btn-primary" Text="Search" OnClick="btnSearch_Click"  />
        &nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="btnAll" runat="server" class="btn-primary" OnClick="btnAll_Click" background-color=#008CBA color=white Text="All Pending Requisition" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Calendar ID="calSearch" runat="server" Visible="False"></asp:Calendar>
    </p>
    <p> &nbsp;<asp:Label ID="lblNull" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#006600" Text="label" Visible="False"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;</p>
    <p>
        <asp:GridView ID="gvRequest" runat="server" Width="69%" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" CellPadding="4" CssClass="table table-striped table-bordered table-hover" ForeColor="#333333" GridLines="None"  Font-Size="Larger"  OnRowCommand="gvRequest_RowCommand" DataKeyNames="RequestCode" style="margin-right: 0px" AllowPaging="True" OnPageIndexChanging="gvRequest_PageIndexChanging" PageSize="4">
            
            <AlternatingRowStyle BackColor="White" />
            
           <Columns>
               <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" ReadOnly="True" DataFormatString="{0:d}" >
                   <ItemStyle Width="150px" />
               </asp:BoundField>
                <asp:TemplateField HeaderText="Employee for Requisition" SortExpression="EmployeeName">
                    
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" />
                    </ItemTemplate>
                    
                    
                </asp:TemplateField> 
               
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" ReadOnly="True"/>
               <asp:TemplateField HeaderText="View" >
                    
                    <ItemTemplate>
                        <asp:LinkButton ID="btnView" CommandName="Detail" CommandArgument='<%#Eval("RequestCode") %>' Text="Detail" runat="server" Font-Underline="True" ForeColor="#0066FF" />
                    </ItemTemplate>
                    
                    
                </asp:TemplateField> 
                      

           </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style"/>
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
            
            
        </asp:GridView>
    </p>   
</asp:Content>