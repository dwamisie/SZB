<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="kontakt_ze_zglaszajacym.aspx.cs" Inherits="System_Zarzadzania_BD.Account.kontakt_ze_zglaszajacym" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Kontakt ze zgłaszającym</h2>
    <h4>Prośba o dodatkowe informacje o błędzie/incydencie <asp:Literal ID="id_incydentu" runat="server" /></h4>
    <table>
        <tr><td>Diagnosta</td><td><asp:TextBox ID="Diagnosta" runat="server" Height="100px" TextMode="MultiLine" Width="800px"></asp:TextBox></td></tr>
    </table>
    <asp:Button ID="WyslijDiag" runat="server" Text="Wyślij" OnClick="WyslijDiag_Click" />
</asp:Content>
