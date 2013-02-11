<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageStages.ascx.cs" Inherits="GamificationPortal.Controls.ManageStages" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<div class="mainContainerPanel">
    <div class="mainContainerBody">
        <h4>New Stage</h4>
<table style="width: 100%">
    <tr>
        <td>
            Description: 
            <dx:ASPxTextBox ID="tbDescription" runat="server" Width="170px"></dx:ASPxTextBox>
        </td>
        <td>
            Start Date:
            <dx:ASPxDateEdit ID="dateEditStartDate" runat="server"></dx:ASPxDateEdit>
        </td>
        <td>
            End Date:
            <dx:ASPxDateEdit ID="dateEditEndDate" runat="server"></dx:ASPxDateEdit>
        </td>
        <td>
            <dx:ASPxButton ID="btnAddStage" runat="server" Text="Add Stage" OnClick="btnAddStage_Click"></dx:ASPxButton>
        </td>
    </tr>

</table>
<h4>Existing Stages</h4>
<dx:ASPxGridView ID="gvStages" runat="server" AutoGenerateColumns="False" Width="100%" KeyFieldName="StageId" OnRowDeleted="gvStages_RowDeleted" OnRowDeleting="gvStages_RowDeleting">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="5">
            <DeleteButton Visible="True">
            </DeleteButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn Caption="Id" VisibleIndex="0" FieldName="StageId">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Description" VisibleIndex="1" FieldName="Description">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="StartDate" VisibleIndex="2" FieldName="Start_Date">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="EndDate" VisibleIndex="3" FieldName="End_Date">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Status" VisibleIndex="4" FieldName="Status">
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
</dx:ASPxGridView>
        </div>
    </div>
