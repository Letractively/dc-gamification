<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CaptainStatistics.ascx.cs" Inherits="GamificationPortal.Controls.CaptainStatistics" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<table align="center">
    <tr>
        <td colspan="2" style="text-align: center;">
            <h3>Journey Report</h3>
        </td>
    </tr>
    
    <tr>
        <td style="padding-right: 5px; text-align: right; width:200px;">Journey status:</td>
        <td style="padding-left: 10px;width:200px;">Before Start Preparations</td>
    </tr>
    <tr>
        <td style="padding-right: 5px; text-align: right;">Crew members:</td>
        <td style="padding-left: 10px;">
            <dx:ASPxLabel ID="lblCrewNumber" runat="server" Text=""></dx:ASPxLabel>
            </td>
    </tr>
    <tr>
        <td style="padding-right: 5px; text-align: right;">Missions in progress:</td>
        <td style="padding-left: 10px;"><dx:ASPxLabel ID="lblInProgressMissionsCount" runat="server" Text=""></dx:ASPxLabel></td>
    </tr>
    <tr>
        <td style="padding-right: 5px; text-align: right;">Missions completed:</td>
        <td style="padding-left: 10px;"><dx:ASPxLabel ID="lblCompletedMissions" runat="server" Text=""></dx:ASPxLabel></td>
    </tr>
     <tr>
        <td style="padding-right: 5px; text-align: right;">Next stage progress:</td>
        <td style="padding-left: 10px;">
            <img src="Images/SiteMap/soon.gif" /></td>
    </tr>
    <tr>
        <td style="padding-right: 5px; text-align: right;">Next stage date:</td>
        <td style="padding-left: 10px;">
            <dx:ASPxLabel ID="lblNextStageDate" runat="server" Text=""></dx:ASPxLabel></td>
    </tr>
    <tr>
        <td ><br/>
            </td>
    </tr>
</table>
