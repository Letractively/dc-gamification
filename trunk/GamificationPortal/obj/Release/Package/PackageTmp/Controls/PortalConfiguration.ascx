<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PortalConfiguration.ascx.cs" Inherits="GamificationPortal.Controls.PortalConfiguration" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="DB Credentials" Theme="Default" Width="200px">
    <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="ASPxLabel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="tbDBCredentialsLogin" runat="server" Width="170px" Text="sa">
                </dx:ASPxTextBox>
            </td>
        </tr>
     
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="ASPxLabel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="tbDBCredentialsPassword" runat="server" Width="170px" Password="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
            <td>
                
                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Submit">
                </dx:ASPxButton>
                
            </td>
        </tr>
    </table>
    

</dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

