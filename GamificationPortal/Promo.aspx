<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Promo.aspx.cs" Inherits="GamificationPortal.Promo" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxTimer" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxImageSlider" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>DC Gamification Promo Page</title>
    <script src="Scripts/SiteScripts.js"></script>

    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <meta name="viewport" content="width=device-width" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Content/Login.css" rel="stylesheet" />
</head>
<body style="background-image: url('Images/layout/theme/bg1.jpg');">
    <form runat="server" id="wrapper" clientidmode="Static">
        <div id="header">
            <table align="center" class="header_table">
                <tr>
                    <td>
                        <h3  id="jorneyLeftLable" class="withShadow" style="color: #ffffff"></h3>
                         
                    </td>
                </tr>
            </table>
           
             <dx:ASPxTimer ID="ASPxTimer1" runat="server" Interval="1000">
                 <ClientSideEvents Tick="function(s, e) {
        var today = new Date();
        var dueDate = new Date('February 20, 2013 13:00:00');
       
         var diffSec = (dueDate - today)/1000; // seconds between now & dueDate

         var diffDays =Math.round(diffSec / 86400); // days
         var diffHrs = Math.round((diffSec % 86400) / 3600); // hours
         var diffMins = Math.round(((diffSec % 86400) % 3600) / 60); // minutes
         var diffSecs =  (Math.round(((diffSec % 86400) % 3600)  % 60)); // secs
        document.getElementById('jorneyLeftLable').innerHTML = 'Journey begins in ' + diffDays + ' days ' + diffHrs + ' hours ' + diffMins + ' minutes ';     
    
}" />
    </dx:ASPxTimer>
        </div>
        <div id="content">
            <div id="box">
                

                <table align="center" style="width: 960px;">
                    <tr>
                        <td>
                            <dx:ASPxImageSlider ID="BannerSlider" ClientIDMode="Static" runat="server" Height="250px" Width="100%" EncodeHtml="False" Style="top: -5px;">
        <Items>
            <dx:ImageSliderItem ImageUrl="Images/layout/theme/banner1.png" Name="BeTheFirst"  />
            <dx:ImageSliderItem ImageUrl="Images/layout/theme/banner2.png" Name="Missions"  />
            <dx:ImageSliderItem ImageUrl="Images/layout/theme/banner3.png" />
            <dx:ImageSliderItem ImageUrl="Images/layout/theme/banner4.png" />
        </Items>
        
        <SettingsImageArea ImageSizeMode="ActualSizeOrFit" NavigationButtonVisibility="None" />
        <SettingsNavigationBar Mode="Dots" />
    </dx:ASPxImageSlider>
    <dx:ASPxTimer ID="ASPxTimer2" runat="server" Interval="20000">
        <ClientSideEvents Tick="function(s, e) {
            var index=BannerSlider.GetActiveItemIndex()+1;
            if(index&gt;=(BannerSlider.GetItemCount()))
                index=0;
            BannerSlider.SetActiveItemIndex(index);
    
}" />
            </dx:ASPxTimer>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="height: 250px;">
                                <p class="front_page_header">
                                    Allstars Spacecare
                                </p>
                                <p class="front_page_sub_header">
                                    One Team, One Vision
            <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Join Now" CssClass="front_page_promo_link" NavigateUrl="Profile.aspx">
            </dx:ASPxHyperLink>
                                </p>
                                <img id="promo_ship" src="Images/layout/theme/front_page_ship.png"  />

                            </div>
                        </td>
                    </tr>
                    
                </table>
              
            </div>
        </div>
        <div id="footer">
            <table align="center" style="width: 960px;">
                <tr>
                    <td style="text-align: left;">
                        <ul>
                            <li class="first"><a href="About.aspx">About</a></li>
                            <li><a href="Contact.aspx">Contacts Us</a></li>
                            <li><a href="SiteMap.aspx">Site Map</a></li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="float-left" style="color: #606060; font-size: 0.9em;">
                            Copyright  © SoftServe Delphi DC Gamification 2013 
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
