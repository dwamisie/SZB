<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Klienci_Slowniki_Edytuj.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Klienci_Slowniki_Edytuj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2>Edytuj pozycję słownika Klienci</h2>
    <table>
        <tr><td>Kod klienta:</td><td><asp:Literal ID="kod_klienta" runat="server"></asp:Literal></td></tr>
        <tr><td>NIP:</td><td><asp:TextBox ID="NIP" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Nazwa:</td><td><asp:TextBox ID="nazwa" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Ulica:</td><td><asp:TextBox ID="ulica" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Nr:</td><td><asp:TextBox ID="numer" runat="server" Width="323px" TextMode="Number"></asp:TextBox></td></tr>
        <tr><td>Miejscowość:</td><td><asp:TextBox ID="miejscowosc" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Kod pocztowy:</td><td><asp:TextBox ID="kod_pocztowy" runat="server" Width="323px" TextMode="Number"></asp:TextBox></td></tr>
        <tr><td>Poczta:</td><td><asp:TextBox ID="poczta" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Województwo</td><td><asp:TextBox ID="wojewodztwo" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Kraj:</td><td><asp:TextBox ID="kraj" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Telefon:</td><td><asp:TextBox ID="telefon" runat="server" Width="323px" TextMode="Phone"></asp:TextBox></td></tr>
        <tr><td>Email:</td><td><asp:TextBox ID="email" runat="server" Width="323px" TextMode="Email"></asp:TextBox></td></tr>
        <tr><td>Uwagi:</td><td><asp:TextBox ID="uwagi" runat="server" Width="323px" TextMode="MultiLine"></asp:TextBox></td></tr>
    </table>
    <asp:Button ID="Button1" runat="server" Text="Zapisz" OnClick="Button1_Click" />
    <asp:Button ID="Button3" runat="server" Text="Anuluj" OnClick="Button3_Click" />
</asp:Content>
