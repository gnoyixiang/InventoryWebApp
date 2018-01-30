<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AddAuthorise.aspx.cs" Inherits="InventoryWebApp.Dept.AddAuthorise" %>

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

        .disabled {
            background-color: #eee;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Add Authorise</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
    <div class="row">
        <div class="col-md-12">
            <h3>Authorise Staff</h3>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2" for="tbxSearch">Search Employee:</label>
            <div class="col-md-4">
                <asp:TextBox ID="tbxSearch" CssClass="form-control" runat="server" Width="100%" AutoPostBack="True" OnTextChanged="selectedTextChange">
                </asp:TextBox>
            </div>
            <div class="col-md-1">
                <asp:Button id="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-4">
            <asp:GridView ID="gvEmployee" runat="server" AutoGenerateColumns="False"
                OnSelectedIndexChanged="gv_SelectedIndexChanged" CssClass="table"
                DataKeyNames="EmployeeCode" CellPadding="4" CellSpacing="-1" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" SortExpression="EmployeeName" />

                    <asp:CommandField HeaderText="Select" ShowSelectButton="True" />

                </Columns>
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style" />
            </asp:GridView>
        </div>
    </div>
    <asp:Panel ID="panelForm" runat="server" Enabled="false">
    <div class="row form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2" for="lblEmployeeName">Selected Employee:</label>
            <div class="col-md-4">
                <asp:HiddenField ID="hfEmployeeCode" runat="server"></asp:HiddenField>
                <asp:Label ID="lblEmployeeName" runat="server" CssClass="form-control disabled"></asp:Label>
            </div>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2" for="ddlRolecodelist">Role Name:</label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlRolecodelist" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2" for="tbxStartDate">Start Date:</label>
            <div class="col-md-4">
                <asp:TextBox ID="tbxStartDate" runat="server" TextMode="Date" CssClass="form-control" required="true"></asp:TextBox>

                <asp:CompareValidator ID="CompareStartTodayValidator" Operator="GreaterThanEqual"
                    Type="Date" ControlToValidate="tbxStartDate" ErrorMessage="Invalid Start Date" runat="server" Display="Dynamic"
                    ForeColor="Red" ValueToCompare="<%# DateTime.Today.ToShortDateString() %>" />
            </div>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2" for="tbxEndDate">End Date:</label>
            <div class="col-md-4">
                <asp:TextBox ID="tbxEndDate" runat="server" TextMode="Date" CssClass="form-control" required="true"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="tbxEndDate"
                    ErrorMessage="Invalid End Date " ControlToCompare="tbxStartDate" Display="Dynamic"
                    Operator="GreaterThanEqual" SetFocusOnError="True" Type="Date" ForeColor="Red"></asp:CompareValidator>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-4">
            <asp:Label ID="lblmessage" runat="server"></asp:Label></div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-4" style="padding-left:0" >
            <asp:Button ID="btnAssign"  runat="server" CssClass="btn btn-success" OnClick="btnAssign_Click" 
                OnClientClick="return confirm('Are you sure to Add the authorise?')" 
                Text="Add" Width="100%" />
        </div>
    </div>
    </asp:Panel>
        </div>
</asp:Content>
