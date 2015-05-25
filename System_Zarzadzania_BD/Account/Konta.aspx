<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Konta.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Konta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <a href="Usun_konto.aspx"><div class="usun">Usuń konto</div></a>
   <a href="Zmien_parametry.aspx"><div class="zmien_parametry_konta">Zmień parametry konta</div></a>
    <asp:Button ID="Button1" runat="server" Text="Powrót do Panelu Sterowania" OnClick="Button1_Click" />
</asp:Content>
