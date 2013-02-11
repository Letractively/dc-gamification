<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiteMap.aspx.cs" Inherits="GamificationPortal.SiteMap" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxSiteMapControl" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainContainerPanel">
    <div class="mainContainerBody">
    <dx:ASPxSiteMapDataSource ID="ASPxSiteMapDataSource1" runat="server" SiteMapFileName="~/web.sitemap" />
    <dx:ASPxSiteMapControl ID="ASPxSiteMapControl1" runat="server" DataSourceID="ASPxSiteMapDataSource1" EnableTheming="True" RepeatDirection="Horizontal" Theme="" Width="100%" Height="400px">

        <Columns>
            <dx:SiteMapColumn />
            <dx:SiteMapColumn />
        </Columns>
        <ColumnSeparatorStyle Width="20px">
            <Paddings Padding="0px" />
        </ColumnSeparatorStyle>
        <Paddings Padding="0px" />
        <DefaultLevelProperties Font-Underline="False" VerticalAlign="Top" ForeColor="#0066CC"
            Font-Names="Tahoma" Font-Size="1em">
        </DefaultLevelProperties>
        <LinkStyle HoverColor="#51A0EF">
            <Font Underline="False" />
            <HoverFont Underline="False" />
        </LinkStyle>
        <LevelProperties>
            <dx:LevelProperties Font-Bold="False" Font-Names="Tahoma" Font-Size="16px" Font-Underline="False"
                ForeColor="#666666" VerticalAlign="Top">
                <ChildNodesPaddings Padding="0px" PaddingBottom="8px" PaddingLeft="0px" PaddingRight="0px"
                    PaddingTop="5px" />
                <NodePaddings Padding="0px" />
                <BorderBottom BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
            </dx:LevelProperties>
            <dx:LevelProperties BulletStyle="None" Font-Names="Tahoma" Font-Size="1em" ForeColor="#1473D2"
                NodeSpacing="3px" VerticalAlign="Top" Wrap="True">
                <NodeTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="">
                        <tr>
                            <td style="white-space: nowrap; padding: 1px;">
                                <dx:ASPxHyperLink ID="Label1" runat="server" Text='<%# Eval("Title") %>' NavigateUrl='<%# Eval("Url") %>'
                                    ForeColor="#1473D2" />
                            </td>
                            <td style="width: 100%; padding: 1px;" id="Td1" runat="server" valign="top" visible='<%# String.IsNullOrEmpty(Container.SiteMapNode["type"]) ? false : true%>'>
                                <dx:ASPxImage ID="Image1" runat="server" Visible='<%# String.IsNullOrEmpty(Container.SiteMapNode["type"]) ? false : true%>'
                                    ImageUrl='<%# "~/Images/SiteMap/" + Container.SiteMapNode["type"] + ".gif" %>' />
                            </td>
                        </tr>
                    </table>
                </NodeTemplate>
                <ChildNodesPaddings PaddingLeft="11px" PaddingTop="3px" />
                <NodePaddings Padding="0px" PaddingBottom="0px" PaddingTop="0px" />
            </dx:LevelProperties>
        </LevelProperties>
        <Border BorderWidth="0px" />
    </dx:ASPxSiteMapControl>
        </div>
        </div>
</asp:Content>
