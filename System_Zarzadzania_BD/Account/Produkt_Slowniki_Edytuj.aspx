<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Produkt_Slowniki_Edytuj.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Produkt_Slowniki_Edytuj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2> Edytuj pozycję słownika produkty</h2>
    <table>
        <tr><td>Kod produktu:</td><td><asp:Literal ID="kod_produktu" runat="server"></asp:Literal></td></tr>
        <tr><td>Nazwa:</td><td><asp:TextBox ID="nazwa" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Wersja:</td><td><asp:TextBox ID="wersja" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Opis:</td><td><asp:TextBox ID="opis" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Data produktu:</td><td><asp:Literal ID="data_produktu" runat="server"></asp:Literal></td></tr>
    </table>
    <asp:Button ID="Button1" runat="server" Text="Zapisz" OnClick="Button1_Click" />
    <asp:Button ID="Button3" runat="server" Text="Anuluj" OnClick="Button3_Click" />

</asp:Content>
