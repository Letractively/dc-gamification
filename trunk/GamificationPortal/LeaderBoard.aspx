<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaderBoard.aspx.cs" Inherits="GamificationPortal.LeaderBoard" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGridView" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Src="~/LeaderBoardControls/LeaderPreview.ascx" TagPrefix="uc1" TagName="LeaderPreview" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%">
        <tr>
            <td style="text-align: center;">
                <h4 class="withShadow" style="color: #ffffff">Top performers in <br/>current stage</h4>
            </td>
            <td rowspan="4" style=" vertical-align: top; padding-left: 15px;">
                <table style="width: 100%;">
                    <tr>
                        <td style="text-align: center;">
                            <h3 class="withShadow" style="color: #ffffff">General Statistics</h3>
                        </td>
                    </tr>
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
                                            <dx:GridViewDataComboBoxColumn Caption="Rank" FieldName="RankDescr" Name="Rank" VisibleIndex="5" Width="100px">
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
                                                            <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Images/Users/default.jpeg" Width="75px"></dx:ASPxImage>

                                                        </td>
                                                        <td>

                                                            <table>
                                                                <tr>
                                                                    <td style="width: 100%;">
                                                                       <%-- <dx:ASPxProgressBar ID="ASPxProgressBar1" runat="server" Height="10px" Position="50" Width="200px">
                                                                        </dx:ASPxProgressBar>--%>
                                                                        Status Bars <br/>"% if work done in stage "<br/>"Level progress"<br/>
                                                                        <img src="Images/SiteMap/soon.gif" /></td>
                                                                
                                                                
                                                                   
                                                                       <%-- <dx:ASPxProgressBar ID="ASPxProgressBar2" runat="server" CustomDisplayFormat="{0}/{2}" DisplayMode="Custom" Height="10px" Position="50" Width="200px">
                                                                        </dx:ASPxProgressBar>--%>
                                                                        
                                                               </tr>
                                                            </table>

                                                        </td>
                                                        <td style="vertical-align: top;">
                                                            <table style="vertical-align: top; border: #48d1cc solid 1px; width: 400px;">
                                                                <tr>
                                                                    <td colspan="3" style="text-align: center; border-bottom: #48d1cc solid 1px;">
                                                                        <h4>Missions</h4>
                                                                    </td>
                                                                    <td colspan="2"  style="text-align: center; border-bottom: #48d1cc solid 1px;">
                                                                        <h4>Badges</h4>
                                                                    </td>
                                                                    <td>
                                                                        
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center;">
                                                                        Created
                                                                    </td>
                                                                    <td style="text-align: center;">
                                                                       Completed
                                                                    </td>
                                                                    <td style="text-align: center; border-right: #48d1cc solid 1px;">
                                                                       Failed
                                                                    </td>
                                                                    <td style="text-align: center;">
                                                                        Standart
                                                                    </td>
                                                                    <td style="text-align: center;">
                                                                       Unique
                                                                    </td>
                                                                    <td style="width: 90px; text-align: center;">
                                                                        Days on board
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td  style="text-align: center;"><%# Eval("CreatedMissions")%></td>
                                                                    <td  style="text-align: center;"><%# Eval("CompletedMissions")%></td>
                                                                    <td  style="text-align: center;"><%# Eval("FailedMissions")%></td>
                                                                    <td  style="text-align: center;"><%# Eval("UnlockedBadges") %></td>
                                                                    <td  style="text-align: center;"><%# Eval("UnlockedUniqueBadges") %></td>
                                                                    <td  style="text-align: center;"><%# Eval("DaysOnBoard") %></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <hr />
                                            </DetailRow>
                                        </Templates>
                                    </dx:ASPxGridView>
                                </div>
                            </div>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; padding-right: 10px;">
                <uc1:LeaderPreview runat="server" ID="LeaderPreviewDev" />
            </td>

        </tr>
        <tr>
            <td style="text-align: center; padding-right: 10px;">
                <uc1:LeaderPreview runat="server" ID="LeaderPreviewQC" />
            </td>

        </tr>
        <tr>
            <td style="text-align: center; padding-right: 10px;">
                <uc1:LeaderPreview runat="server" ID="LeaderPreviewTW" />
            </td>

        </tr>
    </table>
</asp:Content>
