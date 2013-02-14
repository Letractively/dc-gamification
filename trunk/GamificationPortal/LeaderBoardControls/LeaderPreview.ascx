<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaderPreview.ascx.cs" Inherits="GamificationPortal.LeaderBoardControls.LeaderPreview" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<div class="mainContainerPanel">
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
        <p>
            <dx:ASPxLabel ID="lblUserName" runat="server" Text="Unknown"></dx:ASPxLabel>
        </p>
    </div>
</div>
