<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageMissions.ascx.cs" Inherits="GamificationPortal.Controls.ManageMissions" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<div class="mainContainerPanel">
    <div class="mainContainerBody">
        <div runat="server" id="MissionsReviewFrame">
            <h3>Missions Vaiting for review</h3>
            Total pending missions count :
            <dx:ASPxLabel ID="lblPendingMissionsCount" runat="server" Text=""></dx:ASPxLabel>
            <br />
            Total submited missions count :
            <img src="Images/SiteMap/soon.gif" />
            <dx:ASPxLabel ID="lblCompletedMissions" runat="server" Text=""></dx:ASPxLabel>
        </div>

        <br />
        <br />
        <h3>Missions Total List</h3>
        <div>

            <dx:ASPxButton ID="btnCreateMission" runat="server" Text="Create new mission" Theme="" Width="151px" AutoPostBack="False">
            </dx:ASPxButton>

        </div>
        <br />
        <div>
            <dx:ASPxGridView ID="GridViewMissionsList" runat="server" AutoGenerateColumns="False" Width="100%" KeyFieldName="MissionId"
                EnableCallbackAnimation="True"
                EnablePagingCallbackAnimation="True"
                OnCellEditorInitialize="GridViewMissionsList_CellEditorInitialize"
                OnRowUpdated="GridViewMissionsList_RowUpdated"
                OnRowUpdating="GridViewMissionsList_RowUpdating"
                OnStartRowEditing="GridViewMissionsList_StartRowEditing">
                <Columns>

                    <dx:GridViewDataTextColumn Caption="Name" Name="Name" VisibleIndex="1" FieldName="Name" UnboundType="String" Width="100%">
                        <PropertiesTextEdit MaxLength="250" Width="250px">
                            <ValidationSettings>
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                        <EditFormSettings VisibleIndex="1" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="Description" FieldName="Description" Name="Description" UnboundType="String" Visible="False">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="Skills Required" FieldName="SkillsRequired" Name="SkillsRequired" Visible="False">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataComboBoxColumn Caption="Type" FieldName="TypeId" Name="TypeId" Visible="False" VisibleIndex="4">
                        <PropertiesComboBox Width="250px">
                        </PropertiesComboBox>
                        <EditFormSettings Visible="True" VisibleIndex="8" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Type" FieldName="TypeDescription" Name="Type" UnboundType="String" VisibleIndex="5" Width="100px">
                        <PropertiesComboBox Width="250px" TextField="TypeDescription" ValueField="TypeId">
                        </PropertiesComboBox>
                        <EditFormSettings VisibleIndex="8" Visible="False" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="Reward" Name="Reward" Width="75px" Caption="Reward" VisibleIndex="8" ReadOnly="True" Visible="False">
                        <PropertiesTextEdit Width="250px">
                        </PropertiesTextEdit>
                        <EditFormSettings VisibleIndex="1" Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Player Type" FieldName="PlayerType" Name="PlayerType" VisibleIndex="11" Width="75px" Visible="False">
                        <PropertiesTextEdit Width="250px">
                        </PropertiesTextEdit>
                        <EditFormSettings VisibleIndex="7" Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Status" FieldName="StatusDescription" Name="Status" VisibleIndex="14">
                        <PropertiesComboBox Width="250px">
                        </PropertiesComboBox>
                        <EditFormSettings VisibleIndex="11" Visible="False" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Status" FieldName="StatusId" Name="StatusId" Visible="False" VisibleIndex="13">
                        <PropertiesComboBox Width="250px">
                        </PropertiesComboBox>
                        <EditFormSettings Visible="True" VisibleIndex="11" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="OwnerId" FieldName="OwnerId" Name="OwnerId" Visible="False" VisibleIndex="12" Width="100px">
                        <PropertiesComboBox Width="250px">
                            <ValidationSettings>
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesComboBox>
                        <EditFormSettings Visible="True" VisibleIndex="9" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Owner" FieldName="OwnerFullName" Name="OwnerFullName" Visible="False" VisibleIndex="12" Width="100px">
                        <PropertiesComboBox Width="250px">
                            <ValidationSettings>
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesComboBox>
                        <EditFormSettings Visible="True" VisibleIndex="9" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Complexity" FieldName="ComplexityId" Name="ComplexityId" VisibleIndex="6" Visible="False">
                        <PropertiesComboBox Width="250px">
                        </PropertiesComboBox>
                        <EditFormSettings VisibleIndex="10" Visible="True" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Complexity" FieldName="ComplexityDescription" Name="ComplexityDescription" VisibleIndex="7" Width="100px">
                        <PropertiesComboBox Width="250px">
                        </PropertiesComboBox>
                        <EditFormSettings Visible="False" VisibleIndex="10" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn Caption="Start Date" FieldName="StartDate" UnboundType="DateTime" VisibleIndex="9" Width="75px" Name="StartDate" Visible="False">
                        <PropertiesDateEdit AllowNull="False" AllowUserInput="False" DisplayFormatString="" Width="250px">
                        </PropertiesDateEdit>
                        <Settings AllowAutoFilter="True" />
                        <EditFormSettings VisibleIndex="3" Visible="True" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn Caption="End Date" FieldName="EndDate" UnboundType="DateTime" VisibleIndex="10" Width="100px" Name="EndDate">
                        <PropertiesDateEdit AllowNull="False" AllowUserInput="False" DisplayFormatString="" Width="250px">
                        </PropertiesDateEdit>
                        <Settings AllowAutoFilter="True" />
                        <EditFormSettings VisibleIndex="5" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewCommandColumn VisibleIndex="15" Width="75px" Caption="Edit">
                        <EditButton Visible="True">
                        </EditButton>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn Caption="Id" FieldName="MissionId" Name="MissionId" ReadOnly="True" VisibleIndex="0" Width="15px" Visible="False">
                        <PropertiesTextEdit Width="250px">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" AllowAutoFilterTextInputTimer="False" AllowHeaderFilter="False" />
                        <EditFormSettings VisibleIndex="0" Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Stage" FieldName="StageId" Name="StageId" VisibleIndex="7" Width="100px" Visible="False">
                        <PropertiesComboBox Width="250px">
                        </PropertiesComboBox>
                        <EditFormSettings Visible="True" VisibleIndex="10" />
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                <SettingsEditing Mode="PopupEditForm" />
                <Settings ColumnMinWidth="75" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" />
                <SettingsDetail ShowDetailRow="True" />
                <SettingsPopup>
                    <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" ShowHeader="False" />
                </SettingsPopup>
                <Styles>
                    <EditForm HorizontalAlign="Center" VerticalAlign="Middle">
                    </EditForm>
                </Styles>
                <Templates>
                    <DetailRow>
                        <table style="width: 100%;">
                            <tr>
                                <td colspan="4">
                                    <h4>Description</h4>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4"><%# Eval("Description")%></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Skills Required</h4>
                                </td>
                                <td colspan="3"><%# Eval("SkillsRequired")%></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Stage:</h4>
                                </td>
                                <td colspan="3"><%# Eval("StageDescription")%></td>
                            </tr>
                            <tr>
                                <td colspan="4"></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Reward:</h4>
                                </td>
                                <td><%# Eval("Reward")%></td>
                                <td>
                                    <h4>Owner:</h4>
                                </td>
                                <td><%# Eval("OwnerFullName")%></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Start Date:</h4>
                                </td>
                                <td><%# Eval("StartDate")%></td>
                                <td>
                                    <h4>Player Type:</h4>
                                </td>
                                <td><%# Eval("PlayerType")%></td>
                            </tr>
                        </table>

                        <hr />
                    </DetailRow>
                    <EditForm>
                       
                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="700px" Height="500px" ScrollBars="Auto">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors"
                                        runat="server" ColumnID="Description"></dx:ASPxGridViewTemplateReplacement>
                                    <table>
                                        <tr>
                                            <td style="vertical-align: top;">Description</td>
                                        </tr>
                                        <tr>

                                            <td>
                                                 <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" EnableCallbackAnimation="True" Height="300px" Width="650px"
                                                    Html='<%#Bind("Description") %>'>
                                                    <Settings AllowContextMenu="False" AllowPreview="False" />
                                                    <SettingsHtmlEditing EnterMode="BR" />
                                                </dx:ASPxHtmlEditor>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top;">Skills Required</td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <dx:ASPxHtmlEditor ID="editorSkillsRequired" runat="server" EnableCallbackAnimation="True" Height="300px" Html='<%#Bind("SkillsRequired") %>' Width="650px">
                                                    <Settings AllowContextMenu="False" AllowPreview="False" />
                                                    <SettingsHtmlEditing EnterMode="BR" />
                                                </dx:ASPxHtmlEditor>
                                            </td>
                                        </tr>
                                    </table>

                                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>

                    </EditForm>
                </Templates>
            </dx:ASPxGridView>

        </div>
        <dx:ASPxPopupControl ID="NewMissionPopupWindow" runat="server" AllowDragging="True" CloseAction="CloseButton" Modal="True" PopupElementID="btnCreateMission" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="" HeaderText="New Mission" ClientIDMode="Static" EnableCallbackAnimation="True" ShowPageScrollbarWhenModal="True" Width="703px">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowHeader="False" Theme="" Height="337px" Width="697px">
                        <PanelCollection>
                            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Name">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="tbMissionName" runat="server" Width="400px" MaxLength="250" NullText="Enter name for a mission here" Theme="">
                                                <ValidationSettings ErrorText="Name is required" SetFocusOnError="True" ValidationGroup="NewMissionValidationGroup">
                                                    <RequiredField ErrorText="Name is reuired" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Description">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxHtmlEditor ID="editorDescription" runat="server" EnableCallbackAnimation="True" Height="275px" Width="650px">
                                                <Settings AllowContextMenu="False" AllowPreview="False" />
                                                <SettingsHtmlEditing EnterMode="BR" />
                                            </dx:ASPxHtmlEditor>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">
                                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Skills Required">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxHtmlEditor ID="editorSkillsRequired" runat="server" EnableCallbackAnimation="True" Height="200px" Width="650px">
                                                <Settings AllowContextMenu="False" AllowPreview="False" />
                                                <SettingsHtmlEditing EnterMode="BR" />
                                            </dx:ASPxHtmlEditor>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Type">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="tbMissionType" runat="server" Theme="" Width="250px" TextField="Description" ValueField="TypeId" ValueType="System.Int32">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Complexity">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="tbMissionComplexity" runat="server" Theme="" Width="250px" TextField="Description" ValueField="ComplexityId">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Start Date">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxDateEdit ID="tbMissionStartDate" runat="server" Date="12/25/2012 18:41:10" Theme="" Width="250px" AllowNull="False" AllowUserInput="False">
                                                <ValidationSettings ErrorText="Start date is required and can not be in past" ValidationGroup="NewMissionValidationGroup">
                                                    <RequiredField ErrorText="" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="End Date">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxDateEdit ID="tbMissionEndDate" runat="server" Date="12/25/2012 18:41:10" Theme="" Width="250px" AllowNull="False" AllowUserInput="False">
                                                <ValidationSettings ValidationGroup="NewMissionValidationGroup">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <dx:ASPxButton ID="btnSubmitNewMission" runat="server" Text="Submit" Height="16px" Width="153px" OnClick="ASPxButton1_Click" Theme="" ValidationGroup="NewMissionValidationGroup">
                                                <ClientSideEvents Click="function(s, e) {
	NewMissionPopupWindow.Hide();
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
