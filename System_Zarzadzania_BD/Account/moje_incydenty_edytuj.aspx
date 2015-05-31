<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="moje_incydenty_edytuj.aspx.cs" Inherits="System_Zarzadzania_BD.Account.moje_incydenty_edytuj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Incydent o kodzie
        <asp:Literal ID="Id_incydent" runat="server"></asp:Literal>
    </h2>
    <table>
        <tr><td>Kod incydentu:</td><td><asp:Literal ID="kod_incydentu" runat="server"></asp:Literal></td></tr>
        <tr><td>Nazwa klienta:</td><td><asp:TextBox ID="nazwa_klienta" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Nazwa produktu:</td><td>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ProduktSrc" DataTextField="produkt" DataValueField="id_produkt">
            </asp:DropDownList>
            <asp:SqlDataSource ID="ProduktSrc" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select id_produkt,nazwa+' '+wersja as produkt from dbo.produkt;"></asp:SqlDataSource>
            </td></tr>
        <tr><td>Tytuł:</td><td>
            <asp:Literal ID="TytulIncydentu" runat="server"></asp:Literal>
            </td></tr>
        <tr><td>Opis:</td><td>
            <asp:Literal ID="OpisIncydentu" runat="server"></asp:Literal>
            </td></tr>
        <tr><td>Status klasyfikacji:</td><td>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="KlasyfikacjaSrc" DataTextField="nazwa" DataValueField="id_klasyfikacja">
            </asp:DropDownList>
            <asp:SqlDataSource ID="KlasyfikacjaSrc" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select id_klasyfikacja,nazwa from slo.klasyfikacja order by nazwa;"></asp:SqlDataSource>
            </td></tr>
        <tr><td>Status:</td><td>
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="StatusSrc" DataTextField="nazwa" DataValueField="id_status">
            </asp:DropDownList>
            <asp:SqlDataSource ID="StatusSrc" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select id_status,nazwa from slo.status order by nazwa;"></asp:SqlDataSource>
            </td></tr>
        <tr><td>Zgłaszający:</td><td>
            <asp:Literal ID="ZglaszajacyIncydent" runat="server"></asp:Literal>
            </td></tr>
        <tr><td>Diagnoza:</td><td><asp:TextBox ID="DiagnozaIncydentu" runat="server" Height="134px" TextMode="MultiLine" Width="737px"></asp:TextBox></td></tr>
        <tr><td>Prośba o dane:</td><td><asp:TextBox ID="ProsbaODane" runat="server" Height="91px" TextMode="MultiLine" Width="740px"></asp:TextBox></td></tr>
    </table>
    <asp:Button ID="Button1" runat="server" Text="Zapisz" OnClick="Button1_Click" Height="26px" />
    <asp:Button ID="Button3" runat="server" Text="Anuluj" OnClick="Button3_Click" />
    <asp:Button ID="Button4" runat="server" Text="Prośba o dodatkowe dane" OnClick="Button4_Click" />
    <asp:Button ID="Button2" runat="server" Text="Eskalacja do błędu" OnClick="Button2_Click" />
    </asp:Content>
