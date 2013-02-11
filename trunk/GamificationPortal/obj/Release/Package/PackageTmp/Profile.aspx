<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="GamificationPortal.Profile" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxTabControl" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxClasses" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<%@ Register Src="~/Controls/UserAchevements.ascx" TagName="UserAchevements" TagPrefix="uc3" %>
<%@ Register Src="~/Controls/CurrentMission.ascx" TagPrefix="uc1" TagName="CurrentMission" %>


<%@ Register Src="Controls/UserProfile.ascx" TagName="UserProfile" TagPrefix="uc4" %>


<%@ Register Src="Controls/UsersHistory.ascx" TagName="UsersHistory" TagPrefix="uc5" %>


<%@ Register Src="Controls/ManageMissions.ascx" TagName="ManageMissions" TagPrefix="uc2" %>
<%@ Register Src="~/Controls/FirstLoginSplashScreen.ascx" TagPrefix="uc1" TagName="FirstLoginSplashScreen" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxPageControl ID="PageControlProfile" runat="server" ActiveTabIndex="0" EnableTheming="True" Width="100%" EnableCallbackAnimation="True" EnableCallBacks="True" TabAlign="Center">
        <TabPages>
            <dx:TabPage Name="StatisticTab" Text="My State-room">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <table style="width: 100%">
                            <tr>
                                <td style="vertical-align: top; padding-right: 10px;">
                                    <uc1:CurrentMission runat="server" ID="CurrentMission" />
                                </td>
                                <td style="width: 300px; text-align: center; vertical-align: top;">

                                    <uc4:UserProfile ID="UserProfile1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="MissionsTab" Text="History">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

                        <uc5:UsersHistory ID="UsersHistory1" runat="server" />

                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="AchievementsTab" Text="Achievements">
                <TabImage Url="~/Images/SiteMap/soon.gif">
                </TabImage>
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <uc3:UserAchevements ID="UserAchevements1" runat="server" />
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="Manage Missions" Text="Manage Missions">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <uc2:ManageMissions ID="ManageMissions1" runat="server" />
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
    <uc1:FirstLoginSplashScreen runat="server" ID="FIrstLoginSplashScreen" />
</asp:Content>
