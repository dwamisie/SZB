<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Produkty_Slowniki.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Produkty_Slowniki" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Słownik produktów</h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select id_produkt, nazwa, wersja, opis, data_produktu from [dbo].[produkt]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_produkt" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="id_produkt" HeaderText="Kod produktu" InsertVisible="False" ReadOnly="True" SortExpression="id_produkt" />
            <asp:BoundField DataField="nazwa" HeaderText="Nazwa" SortExpression="nazwa" />
            <asp:BoundField DataField="wersja" HeaderText="Wersja" SortExpression="wersja" />
            <asp:BoundField DataField="opis" HeaderText="Opis" SortExpression="opis" />
            <asp:BoundField DataField="data_produktu" HeaderText="Data produktu" SortExpression="data_produktu" />
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
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Nowy" />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Powrót" />
</asp:Content>
