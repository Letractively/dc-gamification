<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserAchevements.ascx.cs" Inherits="GamificationPortal.Controls.UserAchevements" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>


<table style="width: 100%; vertical-align: top;">
    <tr>
        <td colspan="4" style="text-align: center; vertical-align: central; height: 128px;">
            <div class="mainContainerPanel">
                <div class="mainContainerBody">
                    <asp:Image ID="Image1" runat="server" Height="125px" Width="125px" ImageUrl="~/Images/Users/default.jpeg" />
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="4">

            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" TabAlign="Center" Width="100%">
                <TabPages>
                    <dx:TabPage Name="Custom Badges" Text="Custom Badges">
                        <TabTemplate>
                            <h3 class="withShadow" style="color: #ffffff">Custom Badges
                            </h3>
                        </TabTemplate>
                        <TabStyle Width="250px">
                        </TabStyle>
                        <ContentCollection>
                            <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                                <table>
                                    <tr>

                                        <td style="vertical-align: top;">
                                            <h2 class="withShadow" style="color: #ffffff">Backgrounds</h2>
                                            <div class="mainContainerPanel">
                                                <div class="mainContainerBody">
                                                    <dx:ASPxPanel ID="ASPxPanel2" runat="server" Height="572px" ScrollBars="Auto">
                                                        <PanelCollection>
                                                            <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxGridView ID="gvBackgrounds" runat="server" AutoGenerateColumns="False" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" KeyFieldName="FileGroupId" OnFocusedRowChanged="gvBackgrounds_FocusedRowChanged" EnableCallBacks="False">
                                                                    <Columns>
                                                                        <dx:GridViewDataImageColumn Caption="ImageUrl" FieldName="ImageUrl" Name="ImageUrl" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                                                            <PropertiesImage ImageHeight="100px" ImageWidth="100px" IsPng="True">
                                                                            </PropertiesImage>
                                                                        </dx:GridViewDataImageColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Name="Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="FileGroupId" FieldName="FileGroupId" Name="FileGroupId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" AllowGroup="False" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowSort="False" ProcessFocusedRowChangedOnServer="True" />
                                                                    <SettingsPager Visible="False">
                                                                    </SettingsPager>
                                                                    <Settings ShowColumnHeaders="False" />
                                                                    <Styles>
                                                                        <Row Cursor="pointer">
                                                                        </Row>
                                                                    </Styles>
                                                                </dx:ASPxGridView>
                                                            </dx:PanelContent>
                                                        </PanelCollection>
                                                    </dx:ASPxPanel>
                                                </div>
                                            </div>
                                        </td>
                                        <td style="vertical-align: top;">
                                            <h2 class="withShadow" style="color: #ffffff">Titles</h2>
                                            <div class="mainContainerPanel">
                                                <div class="mainContainerBody">
                                                    <dx:ASPxPanel ID="ASPxPanel3" runat="server" Height="572px" ScrollBars="Auto">
                                                        <PanelCollection>
                                                            <dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxGridView ID="gvTitles" runat="server" AutoGenerateColumns="False" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" KeyFieldName="FileGroupId" OnFocusedRowChanged="gvTitles_FocusedRowChanged" EnableCallBacks="False">
                                                                    <Columns>
                                                                        <dx:GridViewDataImageColumn Caption="ImageUrl" FieldName="ImageUrl" Name="ImageUrl" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                                                            <PropertiesImage ImageHeight="100px" ImageWidth="100px" IsPng="True">
                                                                            </PropertiesImage>
                                                                        </dx:GridViewDataImageColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Name="Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="FileGroupId" FieldName="FileGroupId" Name="FileGroupId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" AllowGroup="False" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowSort="False" ProcessFocusedRowChangedOnServer="True" />
                                                                    <SettingsPager Visible="False">
                                                                    </SettingsPager>
                                                                    <Settings ShowColumnHeaders="False" />
                                                                    <Styles>
                                                                        <Row Cursor="pointer">
                                                                        </Row>
                                                                    </Styles>
                                                                </dx:ASPxGridView>
                                                            </dx:PanelContent>
                                                        </PanelCollection>
                                                    </dx:ASPxPanel>
                                                </div>
                                            </div>
                                        </td>
                                        <td style="vertical-align: top;">
                                            <h2 class="withShadow" style="color: #ffffff">Miscs</h2>
                                            <div class="mainContainerPanel">
                                                <div class="mainContainerBody">
                                                    <dx:ASPxPanel ID="ASPxPanel4" runat="server" Height="572px" ScrollBars="Auto">
                                                        <PanelCollection>
                                                            <dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxGridView ID="gvMisc" runat="server" AutoGenerateColumns="False" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" KeyFieldName="FileGroupId" OnFocusedRowChanged="gvMisc_FocusedRowChanged" EnableCallBacks="False">
                                                                    <Columns>
                                                                        <dx:GridViewDataImageColumn Caption="ImageUrl" FieldName="ImageUrl" Name="ImageUrl" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                                                            <PropertiesImage ImageHeight="100px" ImageWidth="100px" IsPng="True">
                                                                            </PropertiesImage>
                                                                        </dx:GridViewDataImageColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Name="Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="FileGroupId" FieldName="FileGroupId" Name="FileGroupId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" AllowGroup="False" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowSort="False" ProcessFocusedRowChangedOnServer="True" />
                                                                    <SettingsPager Visible="False">
                                                                    </SettingsPager>
                                                                    <Settings ShowColumnHeaders="False" />
                                                                    <Styles>
                                                                        <Row Cursor="pointer">
                                                                        </Row>
                                                                    </Styles>
                                                                </dx:ASPxGridView>
                                                            </dx:PanelContent>
                                                        </PanelCollection>
                                                    </dx:ASPxPanel>
                                                </div>
                                            </div>

                                        </td>
                                    </tr>
                                </table>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Name="Unique Badges" Text="Unique Badges">
                        <TabTemplate>
                            <h3 class="withShadow" style="color: #ffffff">Unique Badges
                            </h3>
                        </TabTemplate>
                        <TabStyle Width="250px">
                        </TabStyle>
                        <ContentCollection>
                            <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                                <div class="mainContainerPanel">
                                    <div class="mainContainerBody">
                                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" ScrollBars="Auto" Width="100%">
                                            <PanelCollection>
                                                <dx:PanelContent ID="PanelContent4" runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView align="center" ID="gvUnique" runat="server" AutoGenerateColumns="False" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" KeyFieldName="FileGroupId" OnFocusedRowChanged="gvUnique_FocusedRowChanged" EnableCallBacks="False" 
                                                        >
                                                                    <Columns>
                                                                        <dx:GridViewDataImageColumn Caption="ImageUrl" FieldName="ImageUrl" Name="ImageUrl" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                                                            <PropertiesImage ImageHeight="150px" ImageWidth="150px" IsPng="True">
                                                                            </PropertiesImage>
                                                                        </dx:GridViewDataImageColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Name="Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="FileGroupId" FieldName="FileGroupId" Name="FileGroupId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" AllowGroup="False" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowSort="False" ProcessFocusedRowChangedOnServer="True" />
                                                                    <SettingsPager Visible="False">
                                                                    </SettingsPager>
                                                                    <Settings ShowColumnHeaders="False" />
                                                                    <Styles>
                                                                        <Row Cursor="pointer">
                                                                        </Row>
                                                                    </Styles>
                                                                </dx:ASPxGridView>
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxPanel>

                                    </div>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
                <ActiveTabStyle Width="200px" Wrap="False">
                </ActiveTabStyle>
                <TabStyle Wrap="False">
                </TabStyle>
            </dx:ASPxPageControl>




        </td>
    </tr>


</table>


