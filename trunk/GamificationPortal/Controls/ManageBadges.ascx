<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageBadges.ascx.cs" Inherits="GamificationPortal.Controls.ManageBadges" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<style type="text/css">
    .auto-style2
    {
        width: 92px;
    }
</style>
<div class="mainContainerPanel">
    <div class="mainContainerBody">
<p>
    <dx:ASPxButton ID="BtnUploadBadge" runat="server" AutoPostBack="False" Text="Upload new Badge" Width="151px" Theme="">
    </dx:ASPxButton>
</p>
<dx:ASPxGridView ID="GridViewBadgesCollection" runat="server" AutoGenerateColumns="False" Width="100%" KeyFieldName="FileGroupId"
    EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" OnRowDeleted="GridViewBadgesCollection_RowDeleted" OnRowDeleting="GridViewBadgesCollection_RowDeleting">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="7" Width="75px">
            <DeleteButton Visible="True">
            </DeleteButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn Caption="ImageFileKey" FieldName="ImageFileKey" Name="ImageFileKey" VisibleIndex="8" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="LockedFileKey" FieldName="LockedFileKey" Name="LockedFileKey" Visible="False" VisibleIndex="9">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Name="Name" VisibleIndex="0">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="FileGroupId" FieldName="FileGroupId" Name="File Group ID" ShowInCustomizationForm="True" VisibleIndex="10" Width="30px" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="RuleName" FieldName="GrantRuleName" Name="GrantRuleName" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataImageColumn VisibleIndex="4" FieldName="ImageURL" Caption="Image" Width="115px">
            <PropertiesImage IsPng="True" ImageHeight="100px" ImageWidth="100px">
            </PropertiesImage>
        </dx:GridViewDataImageColumn>
        <dx:GridViewDataImageColumn VisibleIndex="5" FieldName="LockedURL" Caption="Locked" Width="115px">
            <PropertiesImage IsPng="True" ImageHeight="100px" ImageWidth="100px">
            </PropertiesImage>
        </dx:GridViewDataImageColumn>
<dx:GridViewDataTextColumn FieldName="Message" Name="Message" Caption="Message" VisibleIndex="2"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" Name="Description" Caption="Description" VisibleIndex="1"></dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="ImageType" FieldName="ImageType" Name="ImageType" VisibleIndex="6" Width="75px">
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
</dx:ASPxGridView>
<dx:ASPxPopupControl ID="PopupControlUploadBadges" ClientIDMode="Static" runat="server" Height="166px" Width="425px" EnableCallbackAnimation="True" Modal="True" PopupElementID="BtnUploadBadge" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="">
    <ContentCollection>
        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" ShowHeader="False">
                <ContentPaddings Padding="0px" />
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                    <table style="width: 100%;">
                        <tr>
                                <td>Badge Type:</td>
                            <td>
                                
                                <dx:ASPxComboBox ID="cbImageType" runat="server" SelectedIndex="0">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="Unique" Value="Unique" />
                                        <dx:ListEditItem Text="Background" Value="Background" />
                                        <dx:ListEditItem Text="Title" Value="Title" />
                                        <dx:ListEditItem Text="Misc" Value="Misc" />
                                    </Items>
                                </dx:ASPxComboBox>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Image:</td>
                            <td rowspan="2">
                                <dx:ASPxUploadControl ID="UploadControlBudges" ClientIDMode="Static" runat="server"
                                    Width="300px" AddUploadButtonsHorizontalPosition="Left"
                                    FileInputCount="2" OnFileUploadComplete="UploadControlBudgeFullSize_FileUploadComplete1" Theme="" OnFilesUploadComplete="UploadControlBudges_FilesUploadComplete" FileUploadMode="OnPageLoad">
                                    <ValidationSettings AllowedFileExtensions=".png">
                                    </ValidationSettings>

                                    <ClientSideEvents FilesUploadComplete="function(s, e) {
	__doPostBack('DataReload', null);
}" />

                                </dx:ASPxUploadControl>
                            </td>
                        </tr>
                         <tr>
                            <td class="auto-style2">Locked:</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Grant Rule:</td>
                            <td><dx:ASPxComboBox ID="cbGrantRule" runat="server" ValueType="System.String" Height="18px" TextField="Name" ValueField="GrantRuleId" Width="296px"></dx:ASPxComboBox></td>
                        </tr>
                         <tr>
                            <td class="auto-style2"> Name</td>
                             <td>
                                 <dx:ASPxTextBox ID="tbBadgeGroupName" runat="server" Width="200px">
                                 </dx:ASPxTextBox>
                             </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" colspan="2"> <br/>Description</td>
                        </tr>
                        <tr>
                            
                            <td class="auto-style2" colspan="2">
                                <dx:ASPxMemo ID="TbDescription" runat="server" Height="71px" Width="400px" NullText="Description" Theme=""></dx:ASPxMemo>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><br/>Congratulations message</td>
                        </tr>
                        <tr>
                            
                            <td class="auto-style2" colspan="2">
                                
                                <dx:ASPxMemo ID="tbMessage" runat="server" Height="71px" Width="400px" NullText="Description" Theme=""></dx:ASPxMemo>
                            </td>
                        </tr>
                    </table>

                    <p style="text-align: right">
                        <dx:ASPxButton ID="BtnUploadImages" ClientIDMode="Static" runat="server" Text="Upload Badge" AutoPostBack="False" Theme="" Style="text-align: right">
                            <ClientSideEvents Click="function(s, e) {
	UploadControlBudges.Upload();
    PopupControlUploadBadges.Hide();
}" />
                        </dx:ASPxButton>
                    </p>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

        </div>
    </div>