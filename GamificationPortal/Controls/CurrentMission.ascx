<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CurrentMission.ascx.cs" Inherits="GamificationPortal.Controls.CurrentMission" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxRatingControl" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxPopupControl" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<h2 class="withShadow" style="color: #ffffff">Current Mission</h2>

<div class="mainContainerPanel">
    <div class="mainContainerBody" style="min-height: 350px;">
        <table id="tblCurrentMissionInfo" runat="server" style="width: 100%; vertical-align: top;">
            <tr>
                <td style="width: 100px;">Name
                </td>
                <td style="width: 300px;">
                    <dx:ASPxLabel ID="lblCurrentMissionName" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxProgressBar ID="ProgressBarCurrentMission" runat="server" Height="21px" Position="50" Width="200px" CustomDisplayFormat="Days Left {0}" DisplayMode="Position"
                        DisplayFormatString="Days Left {0}" Theme="" ShowPosition="True">
                    </dx:ASPxProgressBar>
                </td>
            </tr>
            <tr>
                <td />
            </tr>
            <tr>
                <td />
            </tr>
            <tr>
                <td style="vertical-align: top;">Description
                </td>
                <td colspan="2">
                    <div runat="server" id="lblCurrentMissionDescr1"></div>
                </td>

            </tr>
            <tr>
                <td />
            </tr>
            <tr>
                <td style="vertical-align: top;">Skills Required
                </td>
                <td>
                    <div runat="server" id="lblSkillsRequired"></div>
                </td>
            </tr>
            <tr>
                <td>Reward
                </td>
                <td>
                    <dx:ASPxLabel ID="lblReward" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>Complexity
                </td>
                <td>
                    <dx:ASPxRatingControl ID="rcMissionRatingValue" runat="server" ItemCount="3" Value="0" ReadOnly="True" Theme="Default">
                    </dx:ASPxRatingControl>
                </td>
            </tr>
            <tr>
                <td>Owner
                </td>
                <td>
                    <dx:ASPxLabel ID="lblOwner" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>Mission End Date
                </td>
                <td>
                    <dx:ASPxLabel ID="lblEndDate" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxButton ID="btnDropMission" runat="server" Text="Drop Mission" Width="100px" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
	popupScreenDropMission.Show();
}" />
                    </dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton ID="btnCompleteMission" runat="server" Text="Submit" Width="100px" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
	PopupControlSubmitMission.Show();
}" />
                    </dx:ASPxButton>
                </td>

            </tr>
        </table>
        <table id="NoDataAvailableMessage" runat="server" visible="False">

            <tr>
                <td style="width: 600px;">
                    <h3>No missions available.</h3>
                </td>
            </tr>


        </table>
        <asp:HiddenField ID="tbMissionId" runat="server" />
    </div>
</div>
<dx:ASPxPopupControl ID="popupScreenDropMission" ClientIDMode="Static" runat="server" Height="176px" Width="397px" EnableCallbackAnimation="True" HeaderText="Confirm mission drop." PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" CloseAction="CloseButton" ShowCloseButton="False">
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" DefaultButton="ASPxButton2" ShowHeader="False" Width="100%">
                <ContentPaddings Padding="0px" />
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                        <table style="width: 100%;">
                            <tr>
                                <td style="text-align: center; height: 65px;">
                                    <img alt="" src="Images/info.png" />
                                </td>
                                <td>Do you really wants to drop this mission?
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" />

                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div>
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="btnConfirmDropMission" runat="server" Text="Drop" AutoPostBack="False" EnableTheming="True" Width="100px" align="center" OnClick="btnConfirmDropMission_Click">
                                                        <ClientSideEvents Click="function(s, e) {
	popupScreenDropMission.Hide(); 
}" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="btnDropCancel" runat="server" Text="Cancel" AutoPostBack="False" EnableTheming="True" Width="100px" align="center">
                                                        <ClientSideEvents Click="function(s, e) {
	popupScreenDropMission.Hide(); 
}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>



                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxPopupControl ID="PopupControlSubmitMission" ClientIDMode="Static" runat="server" Height="176px" Width="397px" EnableCallbackAnimation="True" HeaderText="Confirm mission submit." PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowPageScrollbarWhenModal="True" CloseAction="CloseButton" ShowCloseButton="False">
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" DefaultButton="ASPxButton2" ShowHeader="False" Width="100%">
                <ContentPaddings Padding="0px" />
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                        <table style="width: 100%;">
                            <tr>
                                <td style="text-align: center; height: 65px;">
                                    <img alt="" src="Images/info.png" />
                                </td>
                                <td>Do you really wants to submit this mission?
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" />

                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div>
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="btnConfirmSubmit" runat="server" Text="Submit" AutoPostBack="False" EnableTheming="True" Width="100px" align="center" OnClick="btnConfirmSubmit_Click" >
                                                        <ClientSideEvents Click="function(s, e) {
	PopupControlSubmitMission.Hide(); 
}" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="btnSubmitCancel" runat="server" Text="Cancel" AutoPostBack="False" EnableTheming="True" Width="100px" align="center">
                                                        <ClientSideEvents Click="function(s, e) {
	PopupControlSubmitMission.Hide(); 
}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>



                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

