<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Slowniki.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Slowniki" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <a href="Produkty_Slowniki.aspx"><div class="produkt">Produkty</div></a>
    <a href="Klienci_Slowniki.aspx"><div class="klienci">Klienci</div></a>
    <a href="Status_Slowniki.aspx"><div class="status">Status</div></a>
    <a href="Typ_bledu_Slowniki.aspx"><div class="typbledu">Typ błędu</div></a>
    <a href="Warstwa_Slowniki.aspx"><div class="warstwa">Warstwa</div></a>
    <a href="Klasyfikacja_Slowniki.aspx"><div class="klasyfikacja">Klasyfikacja</div></a>
    <asp:Button ID="Button1" runat="server" Text="Powrót do Panelu Sterowania" OnClick="Button1_Click" />

</asp:Content>
