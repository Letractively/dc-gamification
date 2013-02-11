<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="GamificationPortal.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link href="Content/ContactUs.css" rel="stylesheet" />

    <div class="contact_us_content">


        <hgroup class="title">
            <h2><%: Title %>.</h2>

        </hgroup>




        <header>
            <h3>Email:</h3>
        </header>
        <div class="mainContainerPanel">
            <div class="mainContainerBody" style="color: #000000;">
                <p>
                    <span class="label">Engineering Deck:</span>
                    <span><a href="mailto:ssadur@softserveinc.com">ssadur@softserveinc.com</a></span>
                </p>
                <p>
                    <span class="label">Communication Desc:</span>
                    <span><a href="mailto:omelnychuk@softserveinc.com">omelnychuk@softserveinc.com</a></span>
                </p>
                <p>
                    <span class="label">General:</span>
                    <span><a href="mailto:tmysko@softserveinc.com">tmysko@softserveinc.com</a></span>
                </p>
            </div>
        </div>


        <header>
            <h3>Address:</h3>
        </header>
        <div class="mainContainerPanel">
            <div class="mainContainerBody" style="color: #000000;">
                <p>
                    79000, Pasternaka Str., 5<br />
                    2nd floor: room 1234 <br/>
                    4th floor: rooms 1408, 1412
                </p>
                <p>
                    <b>Direction Map</b>
                    <br/>
                    <a href="http://goo.gl/maps/LR97">
                    <img class="border" src="http://softserve.ua/upload/images/contacts/pasternaka5.png"/>
                        </a>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
