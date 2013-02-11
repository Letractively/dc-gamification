<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.ascx.cs" Inherits="GamificationPortal.Account.ManageUsers" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<style type="text/css">
    .auto-style2
    {
        width: 85px;
    }

    .auto-style3
    {
        width: 85px;
    }
</style>
<div class="mainContainerPanel">
    <div class="mainContainerBody">
<div>
    <dx:ASPxGridView ID="UsersGrid" runat="server" AutoGenerateColumns="False" EnableCallbackAnimation="True" EnableTheming="True" KeyFieldName="UserId" Width="100%" OnRowUpdated="UsersGrid_RowUpdated" OnRowUpdating="UsersGrid_RowUpdating" OnCellEditorInitialize="UsersGrid_CellEditorInitialize" OnRowDeleted="UsersGrid_RowDeleted" OnRowDeleting="UsersGrid_RowDeleting">
        <Columns>
            <dx:GridViewCommandColumn Caption="Edit" VisibleIndex="9" Width="75px">
                <EditButton Visible="True">
                </EditButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn VisibleIndex="0" Caption="User Id" FieldName="UserId" Name="UserId" ReadOnly="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="SpecializationId" FieldName="SpecializationId" Name="SpecializationId" Visible="False" VisibleIndex="2">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Specialization" FieldName="SpecializationDescription" Name="SpecializationDescription" VisibleIndex="3">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="User Name" FieldName="UserName" Name="UserName" ReadOnly="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="SysAdmin" FieldName="SystemAdmin" Name="SystemAdmin" VisibleIndex="4" Width="60px">
                <PropertiesCheckEdit AllowGrayedByClick="False">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Admin" FieldName="Admin" Name="Admin" VisibleIndex="5" Width="60px">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Creator" FieldName="MissionsCreator" Name="MissionsCreator" VisibleIndex="7" Width="60px">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="Moderator" FieldName="Moderator" Name="Moderator" VisibleIndex="6" Width="60px">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn Caption="User" FieldName="User" Name="User" VisibleIndex="8" Width="60px">
            </dx:GridViewDataCheckColumn>

        </Columns>
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsEditing Mode="EditForm" />
    </dx:ASPxGridView>

</div>
<p>
    <dx:ASPxButton ID="BtnAddUser" runat="server" Text="Add User" AutoPostBack="False" Theme="" Width="100px">
    </dx:ASPxButton>
</p>
<dx:ASPxPopupControl ID="PopupControlAddUser" ClientIDMode="Static" runat="server" AllowDragging="True" EnableCallbackAnimation="True" HeaderText="Add User" Height="246px" Modal="True" PopupElementID="BtnAddUser" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="" Width="444px">
    <ContentCollection>
        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" ShowHeader="False">
                <ContentPaddings Padding="0px" />
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                        <table style="width: 100%; height: 200px;">
                            <tr>
                                <td class="auto-style2">User login
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="TbUserLogin" runat="server" Width="200px" Theme=""></dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxButton ID="BtnFindUser" runat="server" Text="Find User" Theme="" OnClick="BtnFindUser_Click"></dx:ASPxButton>
                                </td>
                            </tr>
                            <tr>
                                <td>Full Name</td>
                                <td>
                                    <dx:ASPxLabel ID="lblUserName" runat="server" Text="" Theme=""></dx:ASPxLabel>
                                </td>
                                <td />
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>
                                    <dx:ASPxLabel ID="LblEmail" runat="server" Text="" Theme=""></dx:ASPxLabel>
                                </td>
                                <td />
                            </tr>
                            <tr>
                                <td>Department</td>
                                <td>
                                    <dx:ASPxLabel ID="LblDepartment" runat="server" Text="" Theme=""></dx:ASPxLabel>
                                </td>
                                <td />
                            </tr>
                            <tr>
                                <td>Office</td>
                                <td>
                                    <dx:ASPxLabel ID="LblOffice" runat="server" Text="" Theme=""></dx:ASPxLabel>
                                </td>
                                <td />
                            </tr>
                            <tr>
                                <td class="auto-style3"></td>
                                <td />
                                <td>
                                    <dx:ASPxButton ID="BtnAdd" runat="server" Text="Add User" Theme="" OnClick="BtnAdd_Click">
                                        <ClientSideEvents Click="function(s, e) {
	PopupControlAddUser.Hide();
}" />
                                    </dx:ASPxButton>



                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
        </div>
    </div>
