<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserAchevements.ascx.cs" Inherits="GamificationPortal.Controls.UserAchevements" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>

<script type="text/javascript">
    // <![CDATA[
    var postponedCallbackRequired = false;
    function OnGridRowChanged(s, e) {
        alert('asd');
        //if (ASPxCallbackPanel1.InCallback())
        //    postponedCallbackRequired = true;
        //else
        //    ASPxCallbackPanel1.PerformCallback();
    }

    function OnEndCallback(s, e) {
        if (postponedCallbackRequired) {
            ASPxCallbackPanel1.PerformCallback();
            postponedCallbackRequired = false;
        }
    }
    // ]]> 
</script>

<table style="width: 100%; vertical-align: top;">
    <tr>
        <td colspan="4" style="text-align: center; vertical-align: central; height: 128px;">
            <table align="center" style="width: 150px;">
                <tr>
                    <td>
                        <div class="mainContainerPanel">
                            <div class="mainContainerBody" style="width: 250px; height: 250px;">


                                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" ClientIDMode="Static" runat="server" EnableCallbackAnimation="True" Width="100%">
                                    <PanelCollection>
                                        <dx:PanelContent ID="PanelContent4" runat="server" SupportsDisabledAttribute="True">

                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Users/default.jpeg"/>

                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxCallbackPanel>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 10px;">
                        <div class="mainContainerBody" style="padding: 0;">
                            <dx:ASPxButton ID="ASPxButton1" runat="server" align="center" Text="Show on profile" Width="100%" OnClick="ASPxButton1_Click"></dx:ASPxButton>
                        </div>
                    </td>
                </tr>

            </table>

        </td>
    </tr>
    <tr>
        <td colspan="4">

            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" TabAlign="Center" Width="100%">
                <TabPages>
                    <dx:TabPage Name="Custom Badges" Text="Custom Badges">
                        <TabTemplate>
                            <h3 class="withShadow" style="color: #ffffff">Emblems
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

                                                    <dx:ASPxGridView ID="gvBackgrounds" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" KeyFieldName="FileGroupId" OnFocusedRowChanged="gvBackgrounds_FocusedRowChanged">
                                                        <ClientSideEvents EndCallback="function(s, e) {
 gvUnique.SetFocusedRowIndex(-1);
	if (ASPxCallbackPanel1.InCallback())
             postponedCallbackRequired = true;
         else
            ASPxCallbackPanel1.PerformCallback();
}" />
                                                        <Columns>
                                                            <dx:GridViewDataImageColumn Caption="ImageUrl" FieldName="ImageUrl" Name="ImageUrl" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                                                <PropertiesImage ImageHeight="100px" ImageWidth="100px" IsPng="True" ToolTipField="Description">
                                                                </PropertiesImage>
                                                            </dx:GridViewDataImageColumn>
                                                            <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Name="Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="FileGroupId" FieldName="FileGroupId" Name="FileGroupId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" AllowGroup="False" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowSort="False" ProcessFocusedRowChangedOnServer="True" />
                                                        <SettingsPager Position="TopAndBottom">
                                                        </SettingsPager>
                                                        <Settings ShowColumnHeaders="False" />
                                                        <Styles>
                                                            <Row Cursor="pointer">
                                                            </Row>
                                                        </Styles>
                                                    </dx:ASPxGridView>

                                                </div>
                                            </div>
                                        </td>
                                        <td style="vertical-align: top;">
                                            <h2 class="withShadow" style="color: #ffffff">Titles</h2>
                                            <div class="mainContainerPanel">
                                                <div class="mainContainerBody">

                                                    <dx:ASPxGridView ID="gvTitles" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" KeyFieldName="FileGroupId" OnFocusedRowChanged="gvTitles_FocusedRowChanged">
                                                        <ClientSideEvents EndCallback="function(s, e) {
 gvUnique.SetFocusedRowIndex(-1);
	if (ASPxCallbackPanel1.InCallback())
             postponedCallbackRequired = true;
         else
            ASPxCallbackPanel1.PerformCallback();
}" />
                                                        <Columns>
                                                            <dx:GridViewDataImageColumn Caption="ImageUrl" FieldName="ImageUrl" Name="ImageUrl" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                                                <PropertiesImage ImageHeight="100px" ImageWidth="100px" IsPng="True" ToolTipField="Description">
                                                                </PropertiesImage>
                                                            </dx:GridViewDataImageColumn>
                                                            <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Name="Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="FileGroupId" FieldName="FileGroupId" Name="FileGroupId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" AllowGroup="False" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowSort="False" ProcessFocusedRowChangedOnServer="True" />
                                                        <SettingsPager Position="TopAndBottom">
                                                        </SettingsPager>
                                                        <Settings ShowColumnHeaders="False" />
                                                        <Styles>
                                                            <Row Cursor="pointer">
                                                            </Row>
                                                        </Styles>
                                                    </dx:ASPxGridView>

                                                </div>
                                            </div>
                                        </td>
                                        <td style="vertical-align: top;">
                                            <h2 class="withShadow" style="color: #ffffff">Miscs</h2>
                                            <div class="mainContainerPanel">
                                                <div class="mainContainerBody">

                                                    <dx:ASPxGridView ID="gvMisc" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" KeyFieldName="FileGroupId" OnFocusedRowChanged="gvMisc_FocusedRowChanged">
                                                        <ClientSideEvents EndCallback="function(s, e) {
    gvUnique.SetFocusedRowIndex(-1);
	if (ASPxCallbackPanel1.InCallback())
             postponedCallbackRequired = true;
         else
            ASPxCallbackPanel1.PerformCallback();
}" />
                                                        <Columns>
                                                            <dx:GridViewDataImageColumn Caption="ImageUrl" FieldName="ImageUrl" Name="ImageUrl" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                                                <PropertiesImage ImageHeight="100px" ImageWidth="100px" IsPng="True" ToolTipField="Description">
                                                                </PropertiesImage>
                                                            </dx:GridViewDataImageColumn>
                                                            <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Name="Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="FileGroupId" FieldName="FileGroupId" Name="FileGroupId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" AllowGroup="False" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowSort="False" ProcessFocusedRowChangedOnServer="True" />
                                                        <SettingsPager Position="TopAndBottom">
                                                        </SettingsPager>
                                                        <Settings ShowColumnHeaders="False" />
                                                        <Styles>
                                                            <Row Cursor="pointer">
                                                            </Row>
                                                        </Styles>
                                                    </dx:ASPxGridView>

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
                                        <dx:ASPxGridView align="center" ID="gvUnique" ClientIDMode="Static" runat="server" AutoGenerateColumns="False" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" KeyFieldName="FileGroupId" OnFocusedRowChanged="gvUnique_FocusedRowChanged">

                                            <ClientSideEvents EndCallback="function(s, e) {
        gvBackgrounds.SetFocusedRowIndex(-1);
        gvTitles.SetFocusedRowIndex(-1);
        gvMisc.SetFocusedRowIndex(-1);
		if (ASPxCallbackPanel1.InCallback())
             postponedCallbackRequired = true;
         else
            ASPxCallbackPanel1.PerformCallback();
}" />

                                            <Columns>
                                                <dx:GridViewDataImageColumn Caption="ImageUrl" FieldName="ImageUrl" Name="ImageUrl" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                                    <PropertiesImage ImageHeight="100px" ImageWidth="100px" IsPng="True" ToolTipField="Description">
                                                    </PropertiesImage>
                                                </dx:GridViewDataImageColumn>
                                                <dx:GridViewDataTextColumn Caption="Name" FieldName="Name" Name="Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="FileGroupId" FieldName="FileGroupId" Name="FileGroupId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="IsLocked" FieldName="IsLocked" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" AllowGroup="False" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowSort="False" ProcessFocusedRowChangedOnServer="True" />
                                            <SettingsPager Position="TopAndBottom" PageSize="6">
                                            </SettingsPager>
                                            <Settings ShowColumnHeaders="False" />
                                            <Styles>
                                                <Row Cursor="pointer">
                                                </Row>
                                            </Styles>
                                        </dx:ASPxGridView>
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


