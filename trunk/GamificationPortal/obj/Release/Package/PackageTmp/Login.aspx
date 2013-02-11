<%@ Page Title="Log in" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GamificationPortal.Account.Login" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title><%: Page.Title %>- DC Gamification Log in</title>
    <script src="Scripts/SiteScripts.js"></script>

    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <meta name="viewport" content="width=device-width" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Content/Login.css" rel="stylesheet" />
</head>
<body style="background-image: url('Images/layout/theme/bg1.jpg');">
    <form runat="server" id="wrapper" clientidmode="Static">
        <div id="header">
            <table align="center" class="header_table">
                <tr>
                    <td>
                        <h3 class="withShadow" style="color: #ffffff">Use your local softserve account to log in.</h3>
                    </td>
                </tr>
            </table>
        </div>
        <div id="content">
            <div id="box">
                <div id="logoSectionParent">
                    <div id="logoSectionChild">
                        <table align="center">
                            <tr>
                                <td style="text-align: center;">
                                    <img src="Images/layout/theme/LogoBig.png" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Login ID="Login1" runat="server" ViewStateMode="Disabled" RenderOuterTable="false" OnAuthenticate="Unnamed1_Authenticate" OnLoggingIn="Unnamed1_LoggingIn" align="center">
                                        <LayoutTemplate>
                                            <p class="validation-summary-errors">
                                                <asp:Literal runat="server" ID="FailureText" />
                                            </p>
                                            <table align="center">
                                                <tr>
                                                    <td style="width: 150px; text-align: right;">
                                                        <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">User name</asp:Label></td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="UserName" runat="server" Width="170px"></dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label2" runat="server" AssociatedControlID="Password">Password</asp:Label>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="Password" runat="server" Width="170px" Password="True"></dx:ASPxTextBox>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td />
                                                    <td>
                                                        <dx:ASPxCheckBox ID="RememberMe" runat="server" Theme=""></dx:ASPxCheckBox>
                                                        <asp:Label ID="Label3" runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Remember me?</asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td />
                                                    <td>
                                                        <div class="mainContainerPanel" style="width: 120px;">
                                                            <div class="mainContainerBody" style="padding: 0px; margin: 0px;">
                                                                <dx:ASPxButton ID="ASPxButton1" runat="server" HorizontalAlign="Center" align="center" CommandName="Login" Text="Log in" Width="120px" Theme=""></dx:ASPxButton>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </LayoutTemplate>
                                    </asp:Login>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer">
            <table align="center" style="width: 960px;">
                <tr>
                    <td style="text-align: left;">
                        <ul>
                            <li class="first"><a href="About.aspx">About</a></li>
                            <li><a href="Contact.aspx">Contacts Us</a></li>
                            <li><a href="SiteMap.aspx">Site Map</a></li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="float-left" style="color: #606060; font-size: 0.9em;">
                            Copyright  © SoftServe Delphi DC Gamification 2013 
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
