<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Warstwa_Slowniki_Edytuj.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Warstwa_Slowniki_Edytuj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2>Edytuj pozycję słownika Warstwa</h2>
    <table>
        <tr><td>Kod warstwy:</td><td><asp:Literal ID="kod_warstwy" runat="server"></asp:Literal></td></tr>
        <tr><td>Nazwa:</td><td><asp:TextBox ID="nazwa" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Aktywny:</td><td><asp:Literal ID="aktywny" runat="server"></asp:Literal></td></tr>
    </table>
    <asp:Button ID="Button1" runat="server" Text="Zapisz" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Zmień Status" OnClick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="Anuluj" OnClick="Button3_Click" />
</asp:Content>
