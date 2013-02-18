<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaderPreview.ascx.cs" Inherits="GamificationPortal.LeaderBoardControls.LeaderPreview" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<div class="mainContainerPanel" style="width: 250px;">
    <div class="mainContainerBody" style="min-height: 225px;">
        <p>
            <dx:ASPxLabel ID="lblTitale" runat="server" Text="Unknown" Style="font-weight: 700"></dx:ASPxLabel>
        </p>
        <div>
            <div>
            <dx:ASPxImage ID="imgUser" ClientIDMode="Static" runat="server" ImageUrl="~/Images/Users/default.jpeg"></dx:ASPxImage>    
            </div>
            <div>
                 <dx:ASPxImage ID="imgUserEmblem" runat="server" ImageUrl="~/Images/EmptyImage.png" Style="position: absolute; top: 125px; left: 140px;" Width="75px" Height="75px"></dx:ASPxImage>
            </div>
            
        </div>
        <h4 runat="server" id="lblUserName" >Unknown</h4>
       <table style="width: 100%;">
           <tr>
               <td style="width: 120px; text-align: right;">Missions done: </td>
               <td style="text-align: left; padding-left: 10px;"><dx:ASPxLabel ID="lblMissionsDone" runat="server" Text="0" />/<dx:ASPxLabel ID="lblMissionsOnStage" runat="server" Text="Unknown" /></td>
           </tr>
           <tr>
               <td colspan="2" >% of missions done in stage</td>
           </tr>
           <tr>
               
               <td colspan="2" style="text-align: center;"><dx:ASPxProgressBar ID="pbStageImpact" runat="server" Height="18px" Position="50" Width="200px" CustomDisplayFormat="{0}"
                DisplayFormatString="{0}" Theme="" ShowPosition="True" align="center">
            </dx:ASPxProgressBar></td>
           </tr>
       </table>
    </div>
</div>
