<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Zarzadzanie_bledami_edytuj.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Zarzadzanie_bledami_edytuj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2>Błąd o kodzie <asp:Literal ID="Id_blad" runat="server"></asp:Literal></h2>
    <table>
        <tr><td>Id błędu:</td><td><asp:Literal ID="Id_bledu" runat="server"></asp:Literal></td></tr>
        <tr><td>Produkt:</td><td>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="nazwa_produktu" DataTextField="produkt" DataValueField="id_produkt" Height="30px" Width="310px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="nazwa_produktu" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select id_produkt,nazwa+' '+wersja as produkt from dbo.produkt;"></asp:SqlDataSource>
        </td></tr>
        <tr><td>Typ błędu:</td><td>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="typbledusrc" DataTextField="nazwa" DataValueField="id_typ_bledu" Height="30px" Width="310px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="typbledusrc" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [nazwa], [id_typ_bledu] FROM [sTyp_BleduWszystkie]"></asp:SqlDataSource>
            </td></tr>
        <tr><td>Warstwa:</td><td>
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="warstwasrc" DataTextField="nazwa" DataValueField="id_warstwa" Height="30px" Width="310px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="warstwasrc" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [id_warstwa], [nazwa] FROM [sWarstwaWszystkie]"></asp:SqlDataSource>
            </td></tr>
        <tr><td>Kod błędu:</td><td><asp:TextBox ID="kod_bledu" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Tytuł:</td><td><asp:TextBox ID="tytul" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Opis:</td><td><asp:TextBox ID="opis" runat="server" Width="323px" Height="200px" TextMode="MultiLine"></asp:TextBox></td></tr>
    </table>
    <asp:Button ID="Button1" runat="server" Text="Zapisz" OnClick="Button1_Click" />
     <asp:Button ID="Button3" runat="server" Text="Zamknij błąd" />
     <asp:Button ID="Button2" runat="server" Text="Anuluj" OnClick="Button2_Click" />
</asp:Content>
