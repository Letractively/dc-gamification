<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.ascx.cs" Inherits="GamificationPortal.Controls.UserProfile" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxPopupControl" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxUploadControl" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<h2 runat="server" id="lblUserFullName" style="color: #ffffff">User Full Name</h2>

<div class="mainContainerPanel">
    <div class="mainContainerBody">

        <dx:ASPxImage ID="imgUserAvatar" runat="server" ImageUrl="~/Images/layout/untitled.png"></dx:ASPxImage>
        <h4 runat="server" id="lblSpecialization" style="color: #000000">Level Specialization</h4>
        <%--<h4 runat="server" id="lblRankDescription" style="color: #000000">Level Caption</h4>--%>
        <div>
            <dx:ASPxProgressBar ID="pbExpirience" runat="server" Height="21px" Position="50" Width="200px"
                CustomDisplayFormat="{0}/{2}"
                Theme="" ShowPosition="True" DisplayFormatString="{0}" DisplayMode="Position" align="Center">
            </dx:ASPxProgressBar>


        </div>
        <div>
            <table style="width: 100%">
                <tr>
                    <td style="width: 50%; text-align: right; padding-right: 10px;">Rank</td>
                    <td style="text-align: left;">
                        <dx:ASPxLabel ID="lblRankDescription" runat="server" Text=""></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align: right; padding-right: 10px;">Missions completed</td>
                    <td style="text-align: left;">
                        <dx:ASPxLabel ID="lblCompletedMissionsCount" runat="server" Text=""></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align: right; padding-right: 10px;">Missions failed</td>
                    <td style="text-align: left;">
                        <dx:ASPxLabel ID="lblFailedMissionsCount" runat="server" Text=""></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align: right; padding-right: 10px;">Unlocked badges</td>
                    <td style="text-align: left;">
                        <dx:ASPxLabel ID="lblUnlockedBadges" runat="server" Text=""></dx:ASPxLabel>
                        /<dx:ASPxLabel ID="lblTotalBadges" runat="server" Text=""></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%; text-align: right; padding-right: 10px;">Unlocked statuses</td>
                    <td style="text-align: left;">
                        <img src="Images/SiteMap/soon.gif" /></td>
                </tr>

            </table>
        </div>

        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnChangeProfile" ClientIDMode="Static" runat="server" Text="Change profile" align="center"></dx:ASPxButton>
                    </td>
                    <td>
                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Share on Facebook" Enabled="False" align="center"></dx:ASPxButton>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</div>
<dx:ASPxPopupControl ID="PopupControlUploadAvatar" ClientIDMode="Static" runat="server" Height="166px" Width="425px"
    EnableCallbackAnimation="True" Modal="True"
    PopupElementID="btnChangeProfile" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="" HeaderText="Manage">
    <ContentCollection>
        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" ShowHeader="False">
                <ContentPaddings Padding="0px" />
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">

                        <table style="width: 100%;">
                            <tr>
                                <td colspan="2" style="text-align: center;">
                                    <dx:ASPxImage ID="imgAvatarPreview" runat="server" ImageUrl="~/Images/layout/untitled.png" Style="text-align: center" align="center"></dx:ASPxImage>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center;">
                                    <dx:ASPxButton ID="btnRemove" ClientIDMode="Static" runat="server" Text="Remove avatar" AutoPostBack="True" HorizontalAlign="Center" align="center" Theme="" Style="text-align: center" OnClick="btnRemove_Click" Width="118px" />


                                </td>
                            </tr>

                            <tr>
                                <td class="auto-style2">File:</td>
                                <td>
                                    <dx:ASPxUploadControl ID="UploadControlAvatar" ClientIDMode="Static" runat="server"
                                        Width="300px" AddUploadButtonsHorizontalPosition="Left"
                                        FileInputCount="1"
                                        Theme=""
                                        FileUploadMode="OnPageLoad" OnFileUploadComplete="UploadControlAvatar_FileUploadComplete">
                                        <ValidationSettings AllowedFileExtensions=".jpg,.jpeg,.jpe,.gif,.png">
                                        </ValidationSettings>

                                        <ClientSideEvents FilesUploadComplete="function(s, e) {
	__doPostBack('ReloadData', null);
}" />

                                    </dx:ASPxUploadControl>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <dx:ASPxLabel ID="lblError" runat="server" Text="" Style="color: red;"></dx:ASPxLabel>
                                </td>
                            </tr>

                        </table>

                        <p style="text-align: right">
                            <dx:ASPxButton ID="BtnUploadImage" ClientIDMode="Static" runat="server" Text="Upload avatar" AutoPostBack="False" Theme="" Style="text-align: right">
                                <ClientSideEvents Click="function(s, e) {
	UploadControlAvatar.Upload();
   
}" />
                            </dx:ASPxButton>
                        </p>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
