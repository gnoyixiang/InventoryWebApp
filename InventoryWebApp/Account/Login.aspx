﻿<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="InventoryWebApp.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>
<asp:Content runat="server" ID="Header" ContentPlaceHolderID="head">
    <style>
        .login-form {
            padding: 0 30% 0 10%;
            min-height: 80vh;
            margin-top: 15vh;
        }

        #loginform {
            color: black;
            background-color: rgba(244, 242, 236, 0.98);
            padding: 20px 20px 0 30px ;
            border-radius: 10px;
        }

        hr {
            border-color: black;
        }
       
    </style>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="container-fluid login-form">
        <div id="loginform">
            <h2><%: Title %>.</h2>
            <div class="row" style="width: 100%">
                <div class="col-sm-12">
                    <h4>Use a local account to log in.</h4>
                    <hr />
                    <section>
                        <div class="container-fluid">
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="row">
                                <asp:Label runat="server" AssociatedControlID="Username" CssClass=" control-label">Username</asp:Label>
                                <div class="">
                                    <asp:TextBox runat="server" ID="Username" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                                        CssClass="text-danger" ErrorMessage="The username field is required." />
                                </div>
                            </div>
                            <div class="row">
                                <asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label">Password</asp:Label>
                                <div class="">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" Width="100%" />
                                </div>
                            </div>
                        </div>
                         <p>
                             <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" Visible="false">Register as a new user</asp:HyperLink>
                         </p>
                        <p>
                            <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                            --%>
                        </p>
                    </section>
                </div>
            </div>
        </div>
        <div class="col-md-4" hidden="hidden">
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>
    </div>

    

</asp:Content>
