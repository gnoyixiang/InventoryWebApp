<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="HeadViewRequest.aspx.cs" 
    Inherits="InventoryWebApp.Dept.HeadViewRequest" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
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
        .form-control{
            width:100%;
            margin-bottom:10px;
        }
        .btn{
            width:100%;
            margin-bottom:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1>Requisition List</h1>
        </div>
    </div>
    <div class="row form-horizontal form-group">
            <label class="control-label col-md-1" for="lblEmpName">Search</label>
            <div class="col-lg-3">
                <asp:DropDownList ID="ddlSelect" CssClass="form-control" runat="server" AutoPostBack="True" 
                    OnSelectedIndexChanged="ddlSelect_SelectedIndexChanged">
            <asp:ListItem>Employee Name</asp:ListItem>
            <asp:ListItem>Date</asp:ListItem>
            <asp:ListItem>Satus</asp:ListItem>
        </asp:DropDownList></div>
                <div class="col-lg-4">
                    <asp:DropDownList ID="ddlEmpName" CssClass="form-control" runat="server" Visible="False">
        </asp:DropDownList>
                    <asp:Calendar ID="calSearch" runat="server" Visible="False"></asp:Calendar>
                </div>
                <div class="col-lg-2">
                    <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Search" OnClick="btnSearch_Click"  />
                    </div>
                <div class="col-lg-2">
                    <asp:Button ID="btnAll" runat="server" class="btn btn-success" OnClick="btnAll_Click" Text="All Requisition" />
                </div>
    </div>
        


        

    <asp:Label ID="lblNull" runat="server" Font-Bold="True" ForeColor="#006600" Text="label" Visible="False"></asp:Label>

        <asp:GridView ID="gvRequest" runat="server" Width="100%" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" 
            CellPadding="4" CssClass="table" CellSpacing="-1" GridLines="None"  OnRowCommand="gvRequest_RowCommand" DataKeyNames="RequestCode" 
            AllowPaging="True" 
            OnPageIndexChanging="gvRequest_PageIndexChanging" PageSize="10">
            
            
           <Columns>
               
               <asp:TemplateField HeaderText="Request Code" >
                    
                    <ItemTemplate>
                        <asp:LinkButton ID="btnReq" CommandName="Detail" CommandArgument='<%#Eval("RequestCode") %>'  runat="server" 
                            Font-Underline="True" />
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
            <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style"/>
            
            
        </asp:GridView>

</asp:Content>
