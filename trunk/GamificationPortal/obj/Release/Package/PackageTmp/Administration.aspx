<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Administration.aspx.cs" Inherits="GamificationPortal.Administration" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>

<%@ Register src="Account/ManageUsers.ascx" tagname="ManageUsers" tagprefix="uc2" %>

<%@ Register src="Controls/ManageBadges.ascx" tagname="ManageBadges" tagprefix="uc3" %>

<%@ Register src="Controls/ManageStages.ascx" tagname="ManageStages" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <div>
        

        <dx:ASPxPageControl ID="PageControlAdministration" runat="server" ActiveTabIndex="0" EnableTheming="True" Theme="" Width="100%" EnableCallbackAnimation="True" EnableCallBacks="True" TabAlign="Center" TabSpacing="5px">
            <TabPages>
                <dx:TabPage Name="Users Manage" Text="Users Manage">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                            <uc2:ManageUsers ID="ManageUsers1" runat="server" />
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="Portal Configuration" Text="Portal Configuration">
                    <ContentCollection>
                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                            <h2 style="color:#ffffff">Manage Stages</h2>
                                
                                          <uc1:ManageStages ID="ManageStages1" runat="server" />
                                
                          
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                
                 <dx:TabPage Name="Badges Manage" Text="Badges Manage">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                           
                            <uc3:ManageBadges ID="ManageBadges1" runat="server" />
                           
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
        </dx:ASPxPageControl>
        
        

    </div>

    </asp:Content>
