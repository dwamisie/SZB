<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Eskalacja.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Eskalacja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Eskalacja</h2>
    <h4>Znany błąd
    </h4>

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Powiąż z błędem" />

    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="tytul" DataValueField="id_blad" Height="26px" Width="434px">
        </asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [id_blad], [tytul] FROM [blad_Wszystkie] where data_zamkniecia is null"></asp:SqlDataSource>

    <h4>Nowy błąd</h4>
    <table>
        <tr><td>Tytuł:</td><td><asp:TextBox ID="nBlad_tytul" runat="server" Height="26px" TextMode="MultiLine" Width="455px"></asp:TextBox></td></tr>
        <tr><td>Opis:</td><td><asp:TextBox ID="nBlad_opis" runat="server" Height="154px" TextMode="MultiLine" Width="455px"></asp:TextBox></td></tr>
    </table>
    <asp:Button ID="Button2" runat="server" Text="Dodaj nowy błąd" OnClick="Button2_Click" />
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</asp:Content>
