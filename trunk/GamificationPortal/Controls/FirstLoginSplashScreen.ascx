<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FirstLoginSplashScreen.ascx.cs" Inherits="GamificationPortal.Controls.FIrstLoginSplashScreen" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxPopupControl" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxPanel" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<script src="JavaScript1.js"></script>
<dx:ASPxPopupControl ID="PopupProfileWelcomeScreen" runat="server" ClientIDMode="Static" Theme="" EnableCallbackAnimation="True"
        Width="650px"
        Height="520px" Modal="True" ShowCloseButton="True" ShowOnPageLoad="False" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" CloseAction="CloseButton" ShowPageScrollbarWhenModal="True">
        <HeaderTemplate>
            Hi newcomer!
            
        </HeaderTemplate>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">


                <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Height="100%" ShowHeader="False" View="GroupBox" Width="100%">
                    <PanelCollection>
                        <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                            <div class="ProfileSplashScreen">


                                <div class="ProfileSplashScreen_text">
                                    <h3>Welcome on board of Allstars Spacecare.</h3>
                                    <br />
                                    From now on, this is your home. Now, you are a part of the most noble mission: to explore strange new worlds, to see new life and new civilizations, to go where no one have ever been before.<br />
                                    The Allstars Spacecare ship waits for you. Be ready to follow the tradition and serve an example of courage, honor, and wisdom. 
                        <br />
                                    Learn more about our  <b>journey</b> and make your input into our common mission. Select and complete the <b>mission </b>
                                    to contribute into success of the whole crew. You can monitor your own missions’ status and the achievements of your fellows.<br />
                                    <br />
                                    We are proud that you joined our team. Enough talk! Buckle down and let’s go!<br /> <br />  
               
                <div style="text-align: center">
                    <table style="width: 100%;">
                        <tr>
                            <td style="text-align: right; padding-right: 10px;">Select your specialization:</td>
                            <td>
                                <dx:ASPxComboBox ID="cbSpecialization" runat="server" OnSelectedIndexChanged="ASPxComboBox1_SelectedIndexChanged" TextField="Description" ValueField="SpecializationId" Width="250px">
                                    
                                    <ClientSideEvents  ValueChanged="function(s, e) {

                                           btnProceenToRoom.SetEnabled(true);
}" />
                                    
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                    </table>
                    
                    
                    <br/>
                   
                    <dx:ASPxButton ID="btnProceenToRoom" ClientIDMode="Static" runat="server" Text="Go to your room" AutoPostBack="True" CausesValidation="False" HorizontalAlign="Center" align="center"
                        Width="120px" Height="35px"  OnClick="ASPxButton1_Click">
                        <ClientSideEvents Click="function(s, e) {
	PopupProfileWelcomeScreen.Hide();
                           
}" />
                    </dx:ASPxButton>
                </div>
                                </div>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>


            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
<script type="text/javascript">
    btnProceenToRoom.SetEnabled(false);
</script>