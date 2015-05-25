<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="moje_incydenty.aspx.cs" Inherits="System_Zarzadzania_BD.Account.moje_incydenty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select id_incydent, id_klient, id_produkt, tytul, opis, SLA, czas_rejestracji, zglaszajacy from [dbo].[incydent]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_incydent" DataSourceID="SqlDataSource1" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="id_incydent" HeaderText="Kod incydentu" InsertVisible="False" ReadOnly="True" SortExpression="id_incydent" />
            <asp:BoundField DataField="id_klient" HeaderText="Kod klienta" SortExpression="id_klient" />
            <asp:BoundField DataField="id_produkt" HeaderText="Kod produktu" SortExpression="id_produkt" />
            <asp:BoundField DataField="tytul" HeaderText="Tytuł" SortExpression="tytul" />
            <asp:BoundField DataField="opis" HeaderText="Opis" SortExpression="opis" />
            <asp:BoundField DataField="SLA" HeaderText="SLA" SortExpression="SLA" />
            <asp:BoundField DataField="czas_rejestracji" HeaderText="Czas rejestracji" SortExpression="czas_rejestracji" />
            <asp:BoundField DataField="zglaszajacy" HeaderText="Zgłaszający" SortExpression="zglaszajacy" />
            <asp:CommandField ButtonType="Button" SelectText="Edytuj" ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
</asp:Content>
