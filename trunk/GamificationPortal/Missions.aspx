<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Missions.aspx.cs" Inherits="GamificationPortal.Missions" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRatingControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainContainerPanel" style="width: 400px; width: 920px;">
        <div class="mainContainerBody" style="min-height: 600px;">
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" XPath="//mission" EnableCaching="False"></asp:XmlDataSource>

            <div runat="server" id="MissionsContainer">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 290px; padding-left: 10px;">Name</td>
                        <td style="width: 85px;">Type</td>
                        <td style="width: 85px;">Reward</td>
                        <td style="width: 85px;">Starts</td>
                        <td style="width: 85px;">Ends</td>
                        <td style="width: 90px;">Complexity</td>
                        <td>Owner</td>
                    </tr>
                </table>


                <dx:ASPxNavBar ID="MissionsNavigationBar" runat="server"
                    EnableAnimation="True"
                    OnGroupDataBound="MissionsNavigationBar_GroupDataBound"
                    AutoCollapse="True"
                    GroupSpacing="5px"
                    AllowSelectItem="True"
                    Width="100%" DataSourceID="XmlDataSource1"
                    EnableCallbackAnimation="True"
                    EnableCallBacks="True">
                    <GroupHeaderTemplate>
                        <table>
                            <tr>
                                <td style="width: 290px;">
                                    <asp:Label ID="lblMissionName" runat="server" Text='<%# Container.EvalDataItem("Name") %>'></asp:Label></td>
                                <td style="width: 85px;">
                                    <asp:Label ID="lblMissionType" runat="server" Text='<%# Container.EvalDataItem("TypeDescription") %>'></asp:Label>
                                </td>
                                <td style="width: 85px;">
                                    <asp:Label ID="lblMissionReward" runat="server" Text='<%# Container.EvalDataItem("Reward") %>'></asp:Label></td>
                                <td style="width: 85px;">
                                    <asp:Label ID="lblMissionStartDate" runat="server" Text='<%# (Convert.ToDateTime(Container.EvalDataItem("StartDate"))).ToShortDateString() %>'></asp:Label>
                                </td>
                                <td style="width: 85px;">
                                    <asp:Label ID="lblMissionEndDate" runat="server" Text='<%# (Convert.ToDateTime(Container.EvalDataItem("EndDate"))).ToShortDateString() %>'></asp:Label></td>
                                <td style="width: 90px;">
                                    <dx:ASPxRatingControl ID="rcMissionRatingValue" runat="server" ItemCount="3" Value='<%# Convert.ToDecimal(Container.EvalDataItem("ComplexityId")) %>' ReadOnly="True" Theme="Default">
                                    </dx:ASPxRatingControl>
                                </td>
                                <td>
                                    <asp:Label ID="lblOwner" runat="server" Text='<%# Container.EvalDataItem("Owner") %>'></asp:Label></td>
                            </tr>
                        </table>
                    </GroupHeaderTemplate>

                    <GroupHeaderStyle Font-Bold="False" HorizontalAlign="Left" Wrap="True" CssClass="dxnbGroupHeader_dcUniverse_Missions">
                        <HoverStyle CssClass="dxnbGroupHeaderCollapsedHover_dcUniverse_Missions">
                        </HoverStyle>
                        <Paddings PaddingBottom="0px" PaddingLeft="10px" PaddingRight="0px" PaddingTop="0px" />
                        <BorderTop BorderStyle="Solid" BorderWidth="2px" />
                    </GroupHeaderStyle>
                    <GroupHeaderStyleCollapsed CssClass="dxnbGroupHeaderCollapsed_dcUniverse_Missions">
                    </GroupHeaderStyleCollapsed>
                    <GroupContentStyle Wrap="False">
                        <BorderTop BorderStyle="Solid" BorderWidth="1px" />
                    </GroupContentStyle>
                    <ItemStyle Wrap="False">
                        <Paddings PaddingLeft="5px" />
                    </ItemStyle>

                    <GroupContentTemplate>
                        <table style="width: 100%; vertical-align: top; table-layout: fixed;">
                            <tr>
                                <td>
                                    <h4>Details</h4>
                                </td>

                            </tr>
                            <tr>
                                <td style="vertical-align: top; word-wrap: break-word; white-space: normal;">
                                    <%# Container.EvalDataItem("Description") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Skills required</h4>
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top; word-wrap: break-word;">

                                    <%# Container.EvalDataItem("SkillsRequired") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="BtnTakeMission" runat="server" OnClick="BtnTakeMission_Click" Text="Take mission" CommandArgument='<%# Container.EvalDataItem("MissionId") %>'
                                        Visible='<%# !IsMissionInProgress(Container.EvalDataItem("StatusDescription")) %>' AutoPostBack="True">
                                    </dx:ASPxButton>

                                    <dx:ASPxLabel ID="LblMissionIsInProgress" runat="server" Text="Mission is in progress" Visible='<%# IsMissionInProgress(Container.EvalDataItem("StatusDescription")) %>'>
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                        </table>
                        <hr />
                    </GroupContentTemplate>

                </dx:ASPxNavBar>
            </div>
            <div runat="server" id="MissionsContainerNoMissions" visible="False">
                <h3>There are no available missions for current stage...
                </h3>
            </div>
        </div>
    </div>
    <dx:ASPxPopupControl ID="PopupControlMissionApplyConfirmation" ClientIDMode="Static" runat="server" Width="368px" HeaderText="Take mission" CloseAction="CloseButton" EnableCallbackAnimation="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" DefaultButton="ASPxButton2" ShowHeader="False" Width="100%">
                    <ContentPaddings Padding="0px" />
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="text-align: center; height: 65px;">
                                        <img alt="" src="Images/info.png" />
                                    </td>
                                    <td colspan="2">Good luck with your mission.
                                        <br />
                                        We're sure you will cope with it easily.
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" />

                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="btnMissionApplyOk" runat="server" Text="Take mission" AutoPostBack="True" EnableTheming="True" Width="100px" align="right" OnClick="btnConfirmOk_Click">
                                                        <ClientSideEvents Click="function(s, e) {
	PopupControlMissionApplyConfirmation.Hide(); 
}" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="btnMissionApplyCancel" runat="server" Text="Reject" AutoPostBack="False" EnableTheming="True" Width="100px" align="left">
                                                        <ClientSideEvents Click="function(s, e) {
	PopupControlMissionApplyConfirmation.Hide(); 
}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
