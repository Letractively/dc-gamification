<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaderPreview.ascx.cs" Inherits="GamificationPortal.LeaderBoardControls.LeaderPreview" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<div class="mainContainerPanel">
    <div class="mainContainerBody">
<p>
    <dx:ASPxLabel ID="lblTitale" runat="server" Text="Unknown" style="font-weight: 700"></dx:ASPxLabel>
</p>
<div>
    <dx:ASPxImage ID="imgUser" ClientIDMode="Static" runat="server" ImageUrl="~/Images/Users/default.jpeg"></dx:ASPxImage>
</div>
<p><dx:ASPxLabel ID="lblUserName" runat="server" Text="Unknown"></dx:ASPxLabel></p>
</div>
    </div>