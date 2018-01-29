<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="HeadViewRequest.aspx.cs" Inherits="InventoryWebApp.WebForm3" %>
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
        .row{
            margin-bottom:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1>Requisition List</h1>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2" for="lblEmpName">Employee Name:</label>
            <div class="col-md-4">
                <asp:Label ID="lblEmpName" runat="server" Text="" CssClass="form-control disabled"></asp:Label>
            </div>
        </div>
    </div>
    
    <asp:Label ID="lblSearch" runat="server" ForeColor="Black" Text="Search By"></asp:Label>
<asp:DropDownList ID="ddlSelect" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSelect_SelectedIndexChanged">
            <asp:ListItem>Employee Name</asp:ListItem>
            <asp:ListItem>Date</asp:ListItem>
            <asp:ListItem>Satus</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="ddlEmpName" runat="server" Visible="False">
        </asp:DropDownList>

        <asp:Button ID="btnSearch" runat="server" class="btn-primary" Text="Search" OnClick="btnSearch_Click"  />
<asp:Button ID="btnAll" runat="server" class="btn-primary" OnClick="btnAll_Click" background-color=#008CBA color=white Text="All Requisition" />

        <asp:Calendar ID="calSearch" runat="server" Visible="False"></asp:Calendar>
    </p>
    <p><asp:Label ID="lblNull" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#006600" Text="label" Visible="False"></asp:Label>
</p>
    <p>
        <asp:GridView ID="gvRequest" runat="server" Width="69%" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" CellPadding="4" CssClass="table table-striped table-bordered table-hover" ForeColor="#333333" GridLines="None"  Font-Size="Larger"  OnRowCommand="gvRequest_RowCommand" DataKeyNames="RequestCode" style="margin-right: 0px" AllowPaging="True" OnPageIndexChanging="gvRequest_PageIndexChanging" PageSize="10">
            
            <AlternatingRowStyle BackColor="White" />
            
           <Columns>
               
               <asp:TemplateField HeaderText="Request Code" >
                    
                    <ItemTemplate>
                        <asp:LinkButton ID="btnReq" CommandName="Detail" CommandArgument='<%#Eval("RequestCode") %>'  runat="server" Font-Underline="True" ForeColor="#0066FF" />
                    </ItemTemplate>
                    
                    
                </asp:TemplateField> 
               
               <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" ReadOnly="True" DataFormatString="{0:d}" >
                   <ItemStyle Width="150px" />
               </asp:BoundField>
                <asp:TemplateField HeaderText="Employee for Requisition" SortExpression="EmployeeName">
                    
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" />
                    </ItemTemplate>
                    
                    
                </asp:TemplateField> 
               
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" ReadOnly="True"/>
               
                      

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
