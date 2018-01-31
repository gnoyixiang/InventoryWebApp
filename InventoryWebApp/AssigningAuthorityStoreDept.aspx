<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AssigningAuthorityStoreDept.aspx.cs" Inherits="InventoryWebApp.AssigningAuthorityStoreDept" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active"><a href="#">Assigning Authority</a></li>
               
            </ul>
    <div class="row">
        <div class="col-xs-12 col-md-2">
    <asp:TextBox ID="tbxSearch" runat="server" Height="30px" Width="150px"> </asp:TextBox>
            <asp:Label ID="lblNoresultFound" runat="server" ForeColor="Red" ViewStateMode="Disabled" Width="400px"></asp:Label><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="SeachBox cann't be Empty" ControlToValidate="tbxSearch" ForeColor="Red" Width="400px">
    </asp:RequiredFieldValidator>
            </div>
        <div class="col-xs-12 col-md-2">
    <asp:Button ID="btnSearch" runat="server" Text="Search" Height="30px" Width="70px" OnClick="SearchButton_Click" CssClass="btn btn-primary" />
    </div>
    

        </div>
    <asp:GridView ID="gvSearchResult" runat="server" CellPadding="3" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="false" DataKeyNames="EmployeeCode"
        OnRowEditing="gvSearchResult_RowEditing" OnRowDataBound="gvSearchResult_OnRowDataBound" OnRowUpdating="gvSearchResult_RowUpdating" OnRowCancelingEdit="gvSearchResult_RowCancelingEdit"
        AllowPaging="True" OnPageIndexChanging="gvSearchResult_PageIndexChanging" OnSelectedIndexChanged="gvSearchResult_SelectedIndexChanged" OnRowCommand="gvSearchResult_RowCommand" OnRowDeleting="gvSearchResult_RowDeleting" PageSize="4" ShowFooter="True" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle />
        <FooterStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <%-- #507CD1--%>
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

        <Columns>

            <asp:TemplateField HeaderText="EmployeeCode" SortExpression="EmployeeCode">
                <ItemTemplate >
                    <asp:Label ID="lblEmployeeCode"  runat="server" Text='<%# Bind("EmployeeCode") %>'></asp:Label>
                </ItemTemplate>

                <FooterTemplate  >
                    <asp:Label ID="lblEmployeeCodeFooter" runat="server" ></asp:Label>
                </FooterTemplate>

            </asp:TemplateField>


            <asp:TemplateField HeaderText="EmployeeName" SortExpression="EmployeeName">
                <ItemTemplate>
                    <asp:Label ID="lblEmployeeName" runat="server" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="center"></asp:Label>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:Label ID="lblEmployeeNameFooter" runat="server" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="center"></asp:Label>
                </FooterTemplate>

            </asp:TemplateField>


            <asp:TemplateField HeaderText="CurrentRole" SortExpression="CurrentRole">
                <ItemTemplate>
                    <asp:Label ID="lblCurrentRole" runat="server" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="center"></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lblCurrentRoleFooter" runat="server" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="center"></asp:Label>
                </FooterTemplate>

            </asp:TemplateField>


            <asp:TemplateField HeaderText="TempRoleCode" SortExpression="TempRoleCode" >
                <ItemTemplate>
                    <asp:Label ID="lblTemporaryRoleCode" runat="server"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTemporaryRoleCode" runat="server" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Left">
                        <asp:ListItem Text="Acting Store Supervisor" Value="ActSSup" />
 
                    </asp:DropDownList>

                </EditItemTemplate>

                <FooterTemplate>
                    <asp:DropDownList ID="ddlTemporaryRoleCodeFooter" runat="server" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Left">
                        <asp:ListItem Text="Acting Store Supervisor" Value="ActSSup" />
                     
                    </asp:DropDownList>
                </FooterTemplate>

            </asp:TemplateField>


            <asp:TemplateField HeaderText="StartDate" SortExpression="StartDate" >
                <ItemTemplate>
                    <asp:Label ID="lblStartDate" runat="server" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="center"></asp:Label>
                    
                </ItemTemplate>

                <EditItemTemplate>
                    
                    <asp:TextBox ID="tbxStartDate" runat="server" TextMode="Date" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Left"></asp:TextBox><br />

                    <asp:CompareValidator ID="compStartTodayValidator" Operator="GreaterThanEqual" Type="Date" ControlToValidate="tbxStartDate" ErrorMessage="Invalid StartDate" runat="server"
                        ForeColor="Red" ValueToCompare="<%# DateTime.Today.ToShortDateString() %>" /><br />

                   <asp:RequiredFieldValidator ID="rqValidatorStartdate" runat="server" ControlToValidate="tbxStartDate" ForeColor="Red" ErrorMessage="Required" ValidationGroup="updateValidation">
                    </asp:RequiredFieldValidator>

                  
                </EditItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="tbxStartDateFooter" runat="server" TextMode="Date"  ></asp:TextBox><br />

                    <asp:CompareValidator ID="compStartTodayValidatorFooter" Operator="GreaterThanEqual" Type="Date" ControlToValidate="tbxStartDateFooter" ErrorMessage="Invalid StartDate" runat="server"
                        ForeColor="Red" ValueToCompare="<%# DateTime.Today.ToShortDateString() %>"  /><br />

                    <asp:RequiredFieldValidator ID="rqValidatorStartdateFooter" runat="server" ErrorMessage="Required" ControlToValidate="tbxStartDateFooter" ForeColor="Red" ValidationGroup="addValidation">
                     </asp:RequiredFieldValidator>
                </FooterTemplate>

            </asp:TemplateField>

            <asp:TemplateField HeaderText="EndDate" SortExpression="EndDate" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Left" >
                <ItemTemplate >

                    <asp:Label ID="lblEndDate" runat="server" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Left"></asp:Label>
                </ItemTemplate>

                <EditItemTemplate>

                    <asp:TextBox ID="tbxEndDate" runat="server" TextMode="Date" ></asp:TextBox></br>

                    <asp:CompareValidator ID="compEndDateValidator" runat="server" ControlToValidate="tbxEndDate"
                        ErrorMessage="Invalid EndDate " ControlToCompare="tbxStartDate" Operator="GreaterThanEqual" SetFocusOnError="True" Type="Date" ForeColor="Red">
                     </asp:CompareValidator><br />

                    <asp:RequiredFieldValidator ID="rqValidatorEnddate" runat="server" ErrorMessage="Required" ControlToValidate="tbxEndDate" ForeColor="Red" ValidationGroup="updateValidation">
                  </asp:RequiredFieldValidator>

                </EditItemTemplate>

                <FooterTemplate>
                    <asp:TextBox ID="tbxEndDateFooter" runat="server" TextMode="Date" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="center"></asp:TextBox>

                    <asp:CompareValidator ID="compEndDateValidator" runat="server" ControlToValidate="tbxEndDateFooter"
                        ErrorMessage="Invalid EndDate " ControlToCompare="tbxStartDateFooter" Operator="GreaterThanEqual" SetFocusOnError="True" Type="Date" ForeColor="Red">

                    </asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="rqValidatorEnddateFooter" runat="server" ErrorMessage="Required" ControlToValidate="tbxEndDateFooter" ForeColor="Red" ValidationGroup="addValidation">
                  </asp:RequiredFieldValidator>

                </FooterTemplate>

            </asp:TemplateField >
           

            <asp:TemplateField  HeaderText="Select">
                <ItemTemplate>
                    <asp:ImageButton ImageUrl="~/Images/selecte.jpg" CommandName="Select" ToolTip="Select" Width="20px" Height="20px" runat="server" />

                </ItemTemplate>


            </asp:TemplateField>


            <asp:TemplateField  HeaderText="Edit">
                <ItemTemplate>
                   
                    <asp:ImageButton ID="btnEdit" ImageUrl="~/Images/edit.png" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" runat="server" />
                    
                </ItemTemplate>


                <EditItemTemplate>
                    <asp:ImageButton ImageUrl="~/Images/save.png" CommandName="Update" ToolTip="Update" Width="23px" Height="23px" runat="server"  ValidationGroup="updateValidation"/>
                    <asp:ImageButton ImageUrl="~/Images/cancel.png" CommandName="Cancel" ToolTip="Cancel" Width="23px" Height="23px" runat="server" />
                </EditItemTemplate>

                <FooterTemplate>
                    <asp:ImageButton ID="btnAdd" ImageUrl="~/Images/addnew.png" CommandName="AddNew" ToolTip="AddNew" Width="20px" 
                        Height="20px" runat="server" ValidationGroup="addValidation" />
                </FooterTemplate>

            </asp:TemplateField>

            <asp:TemplateField  HeaderText="Delete">

                <ItemTemplate>

                    <asp:ImageButton ImageUrl="~/Images/delete.png" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" runat="server" />

                </ItemTemplate>
            </asp:TemplateField>


        </Columns>

    </asp:GridView>
    <%-- <asp:CompareValidator ID="compStartTodayValidator" Operator="GreaterThanEqual" Type="Date" ControlToValidate="gvSearchResult.tbxStartDate" ErrorMessage="The Invalid StartDate" runat="server"
                        ForeColor="Red" ValueToCompare="<%# DateTime.Today.ToShortDateString() %>" />
    <asp:RequiredFieldValidator ID="rqValidatorStartdate" runat="server" ErrorMessage="Invalid Date" ControlToValidate="tbxStartDate" ForeColor="Red">
    </asp:RequiredFieldValidator>--%>
    <br />
    <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green" ViewStateMode="Disabled"></asp:Label>
    <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red" ViewStateMode="Disabled"></asp:Label>



</asp:Content>
