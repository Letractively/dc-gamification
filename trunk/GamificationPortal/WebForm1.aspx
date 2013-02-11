<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="GamificationPortal.WebForm1" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxPopupControl" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxMenu" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Import Namespace="System.Globalization" %>


<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title><%: Page.Title %>- DC Gamification</title>

    <link href="Content/Site.css" rel="stylesheet" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <meta name="viewport" content="width=device-width" />

    <script src="Scripts/SiteScripts.js"></script>
</head>
<body>
    <form id="wrapper" runat="server" ClientIDMode="Static">

       
        <div id="header">
            <table align="center" class="header_table">
                <tr>
                    <td>
                        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" ImageUrl="~/Images/layout/dc_logo.png" NavigateUrl="~/Default.aspx" Text="ASPxHyperLink" />
                    </td>
                    <td>
                        <dx:ASPxMenu ID="NavigationMenu" runat="server" EnableTheming="True" SpriteImageUrl="~/Images/layout/theme/navIcons.png">
                            <Items>
                                <dx:MenuItem Text="Home" NavigateUrl="~/Default.aspx">
                                    <Image>
                                        <SpriteProperties
                                            Top="2px" Left="1px"
                                            HottrackedTop="32px" HottrackedLeft="1px"
                                            SelectedTop="32px" SelectedLeft="1px" />
                                    </Image>
                                </dx:MenuItem>
                                <dx:MenuItem Text="Journey" NavigateUrl="~/Journey.aspx">
                                    <Image>
                                        <SpriteProperties Left="186px" Top="1px"
                                            HottrackedLeft="186px" HottrackedTop="31px"
                                            SelectedLeft="186px" SelectedTop="31px" />
                                    </Image>
                                </dx:MenuItem>
                                <dx:MenuItem Text="Missions" NavigateUrl="~/Missions.aspx">
                                    <Image>
                                        <SpriteProperties
                                            Top="2px" Left="29px"
                                            HottrackedTop="32px" HottrackedLeft="29px"
                                            SelectedTop="32px" SelectedLeft="29px" />
                                    </Image>
                                </dx:MenuItem>
                                <dx:MenuItem Text="Profile" Name="Profile" NavigateUrl="~/Profile.aspx">
                                    <Image>
                                        <SpriteProperties Top="2px" Left="60px"
                                            HottrackedTop="32px" HottrackedLeft="60px"
                                            SelectedTop="32px" SelectedLeft="60px" />
                                    </Image>
                                </dx:MenuItem>
                                <dx:MenuItem Text="Leader board" NavigateUrl="~/LeaderBoard.aspx">
                                    <Image>
                                        <SpriteProperties
                                            Top="2px" Left="152px"
                                            HottrackedTop="32px" HottrackedLeft="152px"
                                            SelectedTop="32px" SelectedLeft="152px" />
                                    </Image>
                                </dx:MenuItem>
                                <dx:MenuItem Text="Administration" Name="Administration" NavigateUrl="~/Administration.aspx">
                                    <Image>
                                        <SpriteProperties Left="121px" Top="2px"
                                            HottrackedLeft="121px" HottrackedTop="32px"
                                            SelectedLeft="121px" SelectedTop="32px" />
                                    </Image>
                                </dx:MenuItem>


                            </Items>
                            <ItemImage Height="30px" Width="29px">
                            </ItemImage>
                            <ItemStyle Width="100px" ForeColor="#9BBFCC">
                                <SelectedStyle Font-Bold="True" ForeColor="#FFF8C6">
                                </SelectedStyle>
                                <HoverStyle Font-Bold="True" ForeColor="#FFF8C6">
                                </HoverStyle>
                            </ItemStyle>
                            <LinkStyle HoverColor="#FFF8C6">
                            </LinkStyle>
                        </dx:ASPxMenu>
                    </td>
                    <td style="text-align: right; width: 100px;">
                        <div id="login-widget">
                            <section id="login">
                                <asp:LoginView runat="server" ViewStateMode="Disabled" ID="LoginViewControl">
                                    <AnonymousTemplate>
                                        <p>
                                            <dx:ASPxHyperLink ID="loginLink" runat="server" Text="Sign In" NavigateUrl="Login.aspx" Theme="" />
                                        </p>
                                    </AnonymousTemplate>
                                    <LoggedInTemplate>
                                        <p>
                                            Hello,
                                            <asp:LoginName runat="server" CssClass="username" FormatString="{0}" ID="LoginNameControl" />
                                            !
                                            <asp:LoginStatus runat="server" ID="LoginStatusControl" LogoutAction="Redirect" LogoutText="Log out" LogoutPageUrl="~/" />
                                        </p>
                                    </LoggedInTemplate>
                                </asp:LoginView>
                            </section>

                        </div>
                    </td>
                </tr>

            </table>
        </div>
        <div id="content">
            <div id="box">
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />


            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />
            asdfasdfasdf
            <br />

            </div>

        </div>

        <div id="footer">
            <table align="center" style="width: 960px;">
                <tr>
                    <td>
                        <div class="float-left">
                            Copyright © SoftServe/Delphi DC Gamification <%# DateTime.Now.Year.ToString(CultureInfo.InvariantCulture) %>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;">
                        <ul>
                            <li class="first"><a href="About.aspx">About</a></li>
                            <li><a href="Contact.aspx">Contacts Us</a></li>
                            <li><a href="SiteMap.aspx">Site Map</a></li>
                        </ul>
                    </td>
                </tr>

            </table>


        </div>
    </form>
</body>

</html>
