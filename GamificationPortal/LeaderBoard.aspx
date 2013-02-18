<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaderBoard.aspx.cs" Inherits="GamificationPortal.LeaderBoard" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGridView" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Src="~/LeaderBoardControls/LeaderPreview.ascx" TagPrefix="uc1" TagName="LeaderPreview" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxTabControl" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxClasses" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" TabAlign="Center" Width="100%">
        <TabPages>
            <dx:TabPage Name="Custom Badges" Text="Custom Badges">
                <TabTemplate>
                    <h3 class="withShadow" style="color: #ffffff">Current stage
                    </h3>
                </TabTemplate>
                <TabStyle Width="250px">
                </TabStyle>
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                        <table style="width: 100%;">
                        <tr>
                            <td><h3 class="withShadow" style="color: #ffffff">Top performers in current stage</h3></td>
                            <td style="width: 150px;"><h3 class="withShadow" style="color: #ffffff">Stage progress: </h3></td>
                            <td style="width: 150px;">
                                <dx:ASPxProgressBar ID="pbStageProgress" runat="server" Height="18px" Position="50" Width="150px" CustomDisplayFormat="{0}"
                DisplayFormatString="{0}" Theme="" ShowPosition="True" align="center">
            </dx:ASPxProgressBar>
                            </td>
                        </tr>
                        </table>
                        
                        <table style="width: 100%">

                            <tr>
                                <td style="text-align: center; padding-right: 10px; vertical-align: top;">
                                    <uc1:LeaderPreview runat="server" ID="LeaderPreviewDev" />
                                </td>
                               <td style="text-align: center; padding-right: 10px; vertical-align: top;">
                                    <uc1:LeaderPreview runat="server" ID="LeaderPreviewQC" />
                                </td>

                               <td style="text-align: center; padding-right: 10px; vertical-align: top;">
                                    <uc1:LeaderPreview runat="server" ID="LeaderPreviewTW" />
                                </td>

                            </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="Unique Badges" Text="Unique Badges">
                <TabTemplate>
                    <h3 class="withShadow" style="color: #ffffff">General statistics
                    </h3>
                </TabTemplate>
                <TabStyle Width="250px">
                </TabStyle>
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                        <table style="width: 100%;">

                            <tr>
                                <td style="vertical-align: top;">
                                    <div class="mainContainerPanel">
                                        <div class="mainContainerBody" style="min-height: 450px;">
                                            <dx:ASPxGridView ID="GridViewMLeaderBoard" runat="server"
                                                AutoGenerateColumns="False" Width="100%"
                                                EnableCallbackAnimation="True"
                                                EnablePagingCallbackAnimation="True"
                                                KeyFieldName="UserId">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="" FieldName="Position" Name="MissionId" ReadOnly="True" VisibleIndex="0" Width="30px">
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Name" Name="Name" VisibleIndex="1" FieldName="FullName" UnboundType="String">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="Specialization" FieldName="SpecializationDescription" Name="SpecializationDescription" UnboundType="String" VisibleIndex="4" Width="150px">
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="Rank" FieldName="RankDescr" Name="Rank" VisibleIndex="5" Width="150px">
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="Experience" FieldName="Experience" Name="Experience" VisibleIndex="6" Width="75px">
                                                    </dx:GridViewDataComboBoxColumn>

                                                </Columns>
                                                <SettingsBehavior AllowFocusedRow="True" />
                                                <SettingsDetail ShowDetailRow="True" />
                                                <Templates>
                                                    <DetailRow>
                                                       
                                                      
                                                        <table style="width: 100%;">
                                                            <tr>
                                                                <td>
                                                                    <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl='<%#Bind("Image_key") %>' ></dx:ASPxImage>

                                                                </td>
                                                                <td>
                                                                    <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl='<%#FormatUrl(Eval("EmblemImageKey"), Eval("UserName")) %>' Width="128px" Height="128px"></dx:ASPxImage>

                                                                </td>
                                                                <td style="vertical-align: top;">
                                                                    <h4>Missions</h4>
                                                                    <table>
                                                                        <tr>
                                                                            <td  style="width: 75px;">Created:</td>
                                                                            <td><%# Eval("CreatedMissions")%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Completed:</td>
                                                                            <td><%# Eval("CompletedMissions")%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Failed:</td>
                                                                            <td><%# Eval("FailedMissions")%></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                 <td style="vertical-align: top;">
                                                                    <h4>Emblems and Badges</h4>
                                                                    <table>
                                                                        <tr>
                                                                            <td style="width: 110px;">Unlocked emblems:</td>
                                                                            <td><%# Eval("UnlockedBadges")%>/<%# Eval("EmblemsTotal")%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Unlocked badges:</td>
                                                                            <td><%# Eval("UnlockedUniqueBadges")%>/<%# Eval("UniqueBadgesTotal")%></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                    
                                                                
                                                            </tr>
                                                        </table>
                                                         <p>Days on board: <%# Eval("DaysOnBoard") %></p> 
                                                        <hr />
                                                    </DetailRow>
                                                </Templates>
                                            </dx:ASPxGridView>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
        <ActiveTabStyle Width="200px" Wrap="False">
        </ActiveTabStyle>
        <TabStyle Wrap="False">
        </TabStyle>
    </dx:ASPxPageControl>






</asp:Content>
