<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Zgloszenie_Incydentu.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Zgloszenie_Incydentu" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        
    <h1>Zgłoś incydent</h1>

    <table>
        <tr><td>Kod klienta</td><td><asp:TextBox ID="id_klient" runat="server" TextMode="Number" Height="25px" Width="125px"></asp:TextBox><asp:TextBox ID="UserID" runat="server" TextMode="MultiLine" Height="25px" Width="276px"></asp:TextBox></td></tr>
        <tr><td>Produkt</td><td><asp:DropDownList ID="id_produkt" runat="server" DataSourceID="SqlDataSource1" DataTextField="nazwa" DataValueField="id_produkt" Height="25px" Width="250px"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="GetProduktByUserID" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="UserID" Name="UserID" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </td></tr>
        <tr><td>Tytuł</td><td><asp:TextBox ID="tytul" runat="server" TextMode="MultiLine" Height="48px" Width="424px"></asp:TextBox></td></tr>
        <tr><td>Opis</td><td><asp:TextBox ID="opis" runat="server" TextMode="MultiLine" Height="166px" Width="424px"></asp:TextBox></td></tr>
    </table>

    <asp:Button runat="server" Text="Zgłoś incydent" OnClick="Unnamed1_Click"/>
</asp:Content>
