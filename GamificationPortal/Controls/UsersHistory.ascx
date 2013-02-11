<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UsersHistory.ascx.cs" Inherits="GamificationPortal.Controls.UsersMissions" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxRatingControl" Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
 <div class="mainContainerPanel">
        <div class="mainContainerBody" >
<table style="width: 100%;">
    <tr>
        <td>
            <table>
                <tr>
                    <td style="padding-right: 10px;">Total number of completed missions:</td>
                    <td>
                        <dx:ASPxLabel ID="lblNumberOfCompletedMission" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 10px;">Number of missions at current stage:</td>
                    <td>
                        <dx:ASPxLabel ID="lblNumberOfCompletedInCurrentStage" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 10px;">Days on board of Allstars Spacecare:</td>
                    <td><img src="Images/SiteMap/soon.gif" /></td>
                </tr>
            </table>

            <p></p>
        </td>
    </tr>
    <tr>
        <td>
            <h3>Missions In Progress</h3>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GridViewInProgress" runat="server" AutoGenerateColumns="False" Width="100%" KeyFieldName="MissionId"
                EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Name" Name="Name" VisibleIndex="0" FieldName="Name" UnboundType="String" Width="100%" />
                    
                    <dx:GridViewDataTextColumn FieldName="Reward" Name="Reward" Width="75px" Caption="Reward" VisibleIndex="2" ReadOnly="True" /> 
                    
                    <dx:GridViewDataTextColumn Caption="Complexity" FieldName="Complexity" Name="Complexity" ReadOnly="True" VisibleIndex="3" Width="90px">
                        <DataItemTemplate>
                            <dx:ASPxRatingControl ID="rcMissionRatingValue" runat="server" ItemCount="3" Value='<%# Convert.ToDecimal( Eval("Complexity")) %>' ReadOnly="True" Theme="Default">
                            </dx:ASPxRatingControl>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="End Date" FieldName="EndDate" UnboundType="DateTime" VisibleIndex="4" Width="90px" Name="EndDate" />
                    
                    <dx:GridViewDataTextColumn Caption="Owner" FieldName="Owner" Name="Owner" VisibleIndex="5" Width="200px" ReadOnly="True" />
                    
                </Columns>
                <Settings ShowFilterRow="False" ColumnMinWidth="75" HorizontalScrollBarMode="Auto" ShowFilterBar="Hidden" />
                <SettingsDetail ShowDetailRow="True" />
                <Templates>
                    <DetailRow>
                        <table>
                            <tr>
                                <td colspan="4">
                                    <h4>Description</h4>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4"><%# Eval("Description")%></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <h4>Skills Required</h4>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4"><%# Eval("SkillsRequired")%></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Reward:</h4>
                                </td>
                                <td><%# Eval("Reward")%></td>
                                <td>
                                    <h4>Owner:</h4>
                                </td>
                                <td><%# Eval("Owner")%></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Start Date:</h4>
                                </td>
                                <td><%# Eval("StartDate")%></td>
                            </tr>
                        </table>
                        <hr />
                    </DetailRow>
                </Templates>
            </dx:ASPxGridView>

        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <h3>Missions under review</h3>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GridViewUnderReview" runat="server" AutoGenerateColumns="False" Width="100%" KeyFieldName="MissionId"
                EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Name" Name="Name" VisibleIndex="0" FieldName="Name" UnboundType="String" Width="100%" />
                    
                    <dx:GridViewDataTextColumn FieldName="Reward" Name="Reward" Width="75px" Caption="Reward" VisibleIndex="2" ReadOnly="True" />
                    
                    <dx:GridViewDataTextColumn Caption="Complexity" FieldName="Complexity" Name="Complexity" ReadOnly="True" VisibleIndex="3" Width="90px">
                        <DataItemTemplate>
                            <dx:ASPxRatingControl ID="rcMissionRatingValue" runat="server" ItemCount="3" Value='<%# Convert.ToDecimal( Eval("Complexity")) %>' ReadOnly="True" Theme="Default">
                            </dx:ASPxRatingControl>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="End Date" FieldName="EndDate" UnboundType="DateTime" VisibleIndex="4" Width="90px" Name="EndDate" />
                    
                    <dx:GridViewDataTextColumn Caption="Owner" FieldName="Owner" Name="Owner" VisibleIndex="5" Width="200px" ReadOnly="True" />
                    
                </Columns>
                <Settings ShowFilterRow="False" ColumnMinWidth="75" HorizontalScrollBarMode="Auto" ShowFilterBar="Hidden" />
                <SettingsDetail ShowDetailRow="True" />
                <Templates>
                    <DetailRow>
                        <table>
                            <tr>
                                <td colspan="4">
                                    <h4>Description</h4>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4"><%# Eval("Description")%></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <h4>Skills Required</h4>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4"><%# Eval("SkillsRequired")%></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Reward:</h4>
                                </td>
                                <td><%# Eval("Reward")%></td>
                                <td>
                                    <h4>Owner:</h4>
                                </td>
                                <td><%# Eval("Owner")%></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Start Date:</h4>
                                </td>
                                <td><%# Eval("StartDate")%></td>
                            </tr>
                        </table>
                        <hr />
                    </DetailRow>
                </Templates>
            </dx:ASPxGridView>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <h3>Completed Missions</h3>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GridViewCompleted" runat="server" AutoGenerateColumns="False" Width="100%" KeyFieldName="MissionId"
                EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Name" Name="Name" VisibleIndex="0" FieldName="Name" UnboundType="String" Width="100%" />
                    
                    <dx:GridViewDataTextColumn FieldName="Reward" Name="Reward" Width="75px" Caption="Reward" VisibleIndex="2" ReadOnly="True" />
                    
                    <dx:GridViewDataTextColumn Caption="Complexity" FieldName="Complexity" Name="Complexity" ReadOnly="True" VisibleIndex="3" Width="90px">
                        <DataItemTemplate>
                            <dx:ASPxRatingControl ID="rcMissionRatingValue" runat="server" ItemCount="3" Value='<%# Convert.ToDecimal( Eval("Complexity")) %>' ReadOnly="True" Theme="Default">
                            </dx:ASPxRatingControl>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="End Date" FieldName="EndDate" UnboundType="DateTime" VisibleIndex="4" Width="90px" Name="EndDate" />
                    
                    <dx:GridViewDataTextColumn Caption="Owner" FieldName="Owner" Name="Owner" VisibleIndex="5" Width="200px" ReadOnly="True" />
                    
                </Columns>
                <Settings ShowFilterRow="False" ColumnMinWidth="75" HorizontalScrollBarMode="Auto" ShowFilterBar="Hidden" />
                <SettingsDetail ShowDetailRow="True" />
                <Templates>
                    <DetailRow>
                        <table>
                            <tr>
                                <td colspan="4">
                                    <h4>Description</h4>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4"><%# Eval("Description")%></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <h4>Skills Required</h4>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4"><%# Eval("SkillsRequired")%></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Reward:</h4>
                                </td>
                                <td><%# Eval("Reward")%></td>
                                <td>
                                    <h4>Owner:</h4>
                                </td>
                                <td><%# Eval("Owner")%></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Start Date:</h4>
                                </td>
                                <td><%# Eval("StartDate")%></td>
                            </tr>
                        </table>
                        <hr />
                    </DetailRow>
                </Templates>
            </dx:ASPxGridView>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td>
            <h3>Failed</h3>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GridViewFailed" runat="server" AutoGenerateColumns="False" Width="100%" KeyFieldName="MissionId"
                EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Name" Name="Name" VisibleIndex="0" FieldName="Name" UnboundType="String" Width="100%" />
                    
                    <dx:GridViewDataTextColumn FieldName="Reward" Name="Reward" Width="75px" Caption="Reward" VisibleIndex="2" ReadOnly="True" />
                    
                    <dx:GridViewDataTextColumn Caption="Complexity" FieldName="Complexity" Name="Complexity" ReadOnly="True" VisibleIndex="3" Width="90px">
                        <DataItemTemplate>
                            <dx:ASPxRatingControl ID="rcMissionRatingValue" runat="server" ItemCount="3" Value='<%# Convert.ToDecimal( Eval("Complexity")) %>' ReadOnly="True" Theme="Default">
                            </dx:ASPxRatingControl>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="End Date" FieldName="EndDate" UnboundType="DateTime" VisibleIndex="4" Width="90px" Name="EndDate" />
                    
                    <dx:GridViewDataTextColumn Caption="Owner" FieldName="Owner" Name="Owner" VisibleIndex="5" Width="200px" ReadOnly="True" />
                    
                </Columns>
                <Settings ShowFilterRow="False" ColumnMinWidth="75" HorizontalScrollBarMode="Auto" ShowFilterBar="Hidden" />
                <SettingsDetail ShowDetailRow="True" />
                <Templates>
                    <DetailRow>
                        <table>
                            <tr>
                                <td colspan="4">
                                    <h4>Description</h4>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4"><%# Eval("Description")%></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <h4>Skills Required</h4>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="4"><%# Eval("SkillsRequired")%></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Reward:</h4>
                                </td>
                                <td><%# Eval("Reward")%></td>
                                <td>
                                    <h4>Owner:</h4>
                                </td>
                                <td><%# Eval("Owner")%></td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Start Date:</h4>
                                </td>
                                <td><%# Eval("StartDate")%></td>
                            </tr>
                        </table>

                        <hr />
                    </DetailRow>
                </Templates>
            </dx:ASPxGridView>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>

</table>
            </div>
     </div>
