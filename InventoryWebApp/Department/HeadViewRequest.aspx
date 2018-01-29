<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="HeadViewRequest.aspx.cs" Inherits="InventoryWebApp.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pager-style {
        }

            .pager-style span, .pager-style a {
                padding: 0 5px;
                font-size: 16px;
            }

            .pager-style span {
                font-weight: 600;
                text-decoration: underline;
            }

            .pager-style a {
            }

        .row {
            margin-bottom: 10px;
        }
        .btn, .form-control{
            white-space: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1>Requisition List</h1>
        </div>
    </div>
    <div class="row form-horizontal form-group">
        <%--<div class="form-group">--%>
            <label class="control-label col-md-2">Search By:</label>
            <div class="col-md-2">
                <asp:DropDownList ID="ddlSelect" runat="server" AutoPostBack="True" Width="100%" 
                    CssClass="form-control" OnSelectedIndexChanged="ddlSelect_SelectedIndexChanged">
                    <asp:ListItem>Employee Name</asp:ListItem>
                    <asp:ListItem>Date</asp:ListItem>
                    <asp:ListItem>Satus</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlEmpName" Width="100%" 
                    CssClass="form-control" runat="server" Visible="False"></asp:DropDownList>
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnSearch" Width="100%"  runat="server" CssClass="btn btn-success"
                    word Text="Search" OnClick="btnSearch_Click" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnAll" Width="100%"  runat="server" CssClass="btn btn-primary" OnClick="btnAll_Click" Text="All Requisition" />
            </div>
        </div>
    <%--</div>--%>
    <div class="row form-horizontal">
        <div class="col-md-3"></div>
        <div class="col-md-3">
            <asp:Calendar ID="calSearch" runat="server" Visible="False"></asp:Calendar>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblNull" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#006600" Text="label" Visible="False"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvRequest" runat="server" Width="100%" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" 
                CellPadding="4" CssClass="table" GridLines="None" 
                OnRowCommand="gvRequest_RowCommand" DataKeyNames="RequestCode" Style="margin-right: 0px" AllowPaging="True"
                CellSpacing="-1" OnPageIndexChanging="gvRequest_PageIndexChanging" PageSize="10">
                <Columns>
                    <asp:TemplateField HeaderText="Request Code">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnReq" CommandName="Detail" CommandArgument='<%#Eval("RequestCode") %>' runat="server" Font-Underline="True" ForeColor="#0066FF" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" ReadOnly="True" DataFormatString="{0:d}">
                        <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Employee for Requisition" SortExpression="EmployeeName">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" ReadOnly="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style" />   
            </asp:GridView>
        </div>
    </div>
</asp:Content>
