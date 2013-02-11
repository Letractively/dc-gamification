<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserStatistic.ascx.cs" Inherits="GamificationPortal.Controls.UserStatistic" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<table style="width:100%">
    <tr>
        <td style="width: 50%; text-align: right; padding-right: 10px;">Level</td>
        <td>1</td>
    </tr>
    <tr>
        <td style="width: 50%; text-align: right; padding-right: 10px;">Missions Finished</td>
      
        <td>10</td>
    </tr>
    <tr>
        <td style="width: 50%; text-align: right; padding-right: 10px;">Unlocked Budges</td>
        <td>
            <dx:ASPxLabel ID="LblUnlockedBadges" runat="server" Text=""></dx:ASPxLabel>/<dx:ASPxLabel ID="LblTotalBadges" runat="server" Text=""></dx:ASPxLabel>
            </td>
    </tr>
    <tr>
        <td style="width: 50%; text-align: right; padding-right: 10px;">Unlocked Statuses</td>
        <td>1</td>
    </tr>

</table>
