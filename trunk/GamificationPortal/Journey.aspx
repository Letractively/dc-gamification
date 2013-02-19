<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Journey.aspx.cs" Inherits="GamificationPortal.Journey" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Src="~/Controls/PreludeControl.ascx" TagPrefix="uc1" TagName="PreludeControl" %>
<%@ Register Src="~/Controls/Stage1Control.ascx" TagPrefix="uc1" TagName="Stage1Control" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="withShadow" style="color: #ffffff">Storyline</h1>
    <div class="mainContainerPanel" style="width: 920px;">
        <div class="mainContainerBody" style="min-height: 600px;">
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                <tr>

                    <td style="width: 100%;">
                        <dx:ASPxNavBar SkinID="None" Width="100%" EnableViewState="False" ID="ASPxNavBar2"
                            runat="server" GroupSpacing="1px" AutoCollapse="True"
                            ExpandButtonPosition="Right" EnableAnimation="True">
                            <Border BorderColor="#BEBEBE" BorderStyle="Solid" BorderWidth="1px" />
                            <Paddings Padding="1px" />
                            <GroupContentStyle BackColor="#EBF4FC" ForeColor="#303030" Font-Names="arial narrow;">
                                <Border BorderStyle="None" />
                                <BorderTop BorderColor="White" BorderStyle="Solid" BorderWidth="1px" />
                                <Paddings Padding="11px" />
                            </GroupContentStyle>
                            <GroupHeaderStyleCollapsed BackColor="#F1F1F1" ForeColor="Gray">
                                <HoverStyle BackColor="#DAEBFD">
                                </HoverStyle>
                            </GroupHeaderStyleCollapsed>
                            <GroupHeaderStyle BackColor="#C7DEF7" ImageSpacing="1px" Cursor="pointer" Font-Names="Arial Narrow" Font-Size="1.4em">
                                <HoverStyle BackColor="Silver">
                                </HoverStyle>
                                <Paddings Padding="4px" PaddingLeft="11px" />
                                <Border BorderStyle="None" />
                            </GroupHeaderStyle>
                            <ExpandImage AlternateText="Show details" />
                            <Groups>
                                <dx:NavBarGroup AllowDragging="False" Expanded="False" Name="Prelude" Text="Prelude">
                                    <ContentTemplate>
                                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" Height="450px" ScrollBars="Auto">
                                            <PanelCollection>
                                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                                    <table style="width: 100%; text-align: left;">
                                                        <tr>
                                                            <td>



                                                                <uc1:PreludeControl runat="server" ID="PreludeControl" />


                                                            </td>
                                                        </tr>

                                                    </table>
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxPanel>

                                    </ContentTemplate>
                                </dx:NavBarGroup>
                                <dx:NavBarGroup Text="Stage 1">
                                    <ContentStyle CssClass="stage1_content">
                                    </ContentStyle>
                                    <ContentTemplate>
                                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" Height="450px" ScrollBars="Auto">
                                            <PanelCollection>
                                                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                                    <table style="width: 100%; text-align: left;">
                                                        <tr>
                                                            <td>

                                                                <uc1:Stage1Control runat="server" ID="Stage1Control" />


                                                            </td>
                                                        </tr>

                                                    </table>
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxPanel>

                                    </ContentTemplate>
                                </dx:NavBarGroup>
                                <dx:NavBarGroup Text="Next stage is coming soon" Expanded="False">
                                </dx:NavBarGroup>
                            </Groups>
                            <ItemStyle VerticalAlign="Top" ForeColor="Black">
                                <Paddings Padding="13px" PaddingBottom="39px" />
                            </ItemStyle>

                        </dx:ASPxNavBar>

                    </td>

                </tr>
                <tr>

                    <td style="width: 100%;">
                        <div class="Spacer" style="width: 1px;">
                        </div>
                    </td>

                </tr>
            </table>

        </div>
    </div>
</asp:Content>
