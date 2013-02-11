<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GamificationPortal._Default" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxNewsControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxImageSlider" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTimer" TagPrefix="dx" %>

<%@ Register Src="Controls/CaptainStatistics.ascx" TagName="CaptainStatistics" TagPrefix="uc1" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">


    <dx:ASPxImageSlider ID="BannerSlider" ClientIDMode="Static" runat="server" Height="250px" Width="100%" EncodeHtml="False" Style="top: -5px;">
        <Items>
            <dx:ImageSliderItem ImageUrl="Images/layout/theme/banner1.png" Name="BeTheFirst"  />
            <dx:ImageSliderItem ImageUrl="Images/layout/theme/banner2.png" Name="Missions"  />
            <dx:ImageSliderItem ImageUrl="Images/layout/theme/banner3.png" />
            <dx:ImageSliderItem ImageUrl="Images/layout/theme/banner4.png" />
        </Items>
        
        <SettingsImageArea ImageSizeMode="ActualSizeOrFit" NavigationButtonVisibility="None" />
        <SettingsNavigationBar Mode="Dots" />
    </dx:ASPxImageSlider>
    <dx:ASPxTimer ID="ASPxTimer1" runat="server" Interval="20000">
        <ClientSideEvents Tick="function(s, e) {
            var index=BannerSlider.GetActiveItemIndex()+1;
            if(index&gt;=(BannerSlider.GetItemCount()))
                index=0;
            BannerSlider.SetActiveItemIndex(index);
    
}" />
    </dx:ASPxTimer>

    <div style="height: 250px;">
        <p class="front_page_header">
            Allstars Spacecare
        </p>
        <p class="front_page_sub_header">
            One Team, One Vision
            <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Join Now" CssClass="front_page_promo_link" NavigateUrl="Profile.aspx">
            </dx:ASPxHyperLink>
        </p>
        <img id="promo_ship" src="Images/layout/theme/front_page_ship.png" />

    </div>
    <table style="width: 100%;">
        <tr>
            <td style="vertical-align: top;">
                <p style="font-size: 1.5em; font-weight: bold; line-height: .7em; text-shadow: 1px 1px 4px rgba(0,0,0,0.8); color: #FFFFFF; text-transform: uppercase;">Latest News</p>
                <dx:ASPxNewsControl ID="ASPxNewsControl1" runat="server" Width="100%" Theme="Default" BackToTopText="" DataSourceID="XmlDataSource1" DateField="Date" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" HeaderTextField="Header" NavigateUrlField="NavigateUrl" ShowBackToTop="False" TextField="Text" CssClass="frontpage_news">
                    <ItemSettings DateHorizontalPosition="Right" DateVerticalPosition="Header" ShowHeaderAsLink="True">
                    </ItemSettings>
                    <ItemHeaderStyle CssClass="frontpage_newsHeader">
                    </ItemHeaderStyle>
                    <ItemTailStyle>
                        <Border BorderStyle="None" />
                    </ItemTailStyle>
                    <Paddings Padding="0px" />
                    <PagerSettings ShowSeparators="True">
                    </PagerSettings>
                    <ContentStyle CssClass="frontpage_news_content">
                    </ContentStyle>
                    <ItemStyle>
                        <Border BorderStyle="None" />
                    </ItemStyle>
                    <PagerStyle ForeColor="White" />
                </dx:ASPxNewsControl>

                <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/WebSiteNewsRSS.xml" XPath="//news" />
            </td>
            <td style="vertical-align: top; width: 400px;">
                <div class="mainContainerPanel" style="width: 400px;">
                    <div class="mainContainerBody">

                        <uc1:CaptainStatistics ID="CaptainStatistics1" runat="server" />

                    </div>
                </div>

            </td>
        </tr>
    </table>


</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent" Visible="False">
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent" Visible="False">

</asp:Content>

