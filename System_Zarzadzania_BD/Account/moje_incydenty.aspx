<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="moje_incydenty.aspx.cs" Inherits="System_Zarzadzania_BD.Account.moje_incydenty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [id_incydent], [klient], [produkt], [tytul], [opis], [klasyfikacja], [status], [zglaszajacy], [id_blad] FROM [incydentyWszystkie]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
        <Columns>
            <asp:BoundField DataField="id_incydent" HeaderText="Kod incydentu" SortExpression="id_incydent" />
            <asp:BoundField DataField="klient" HeaderText="Nazwa klienta" SortExpression="klient" />
            <asp:BoundField DataField="produkt" HeaderText="Nazwa produktu" SortExpression="produkt" />
            <asp:BoundField DataField="tytul" HeaderText="Tytuł" SortExpression="tytul" />
            <asp:BoundField DataField="opis" HeaderText="Opis" SortExpression="opis" />
            <asp:BoundField DataField="klasyfikacja" HeaderText="Klasyfikacja" SortExpression="klasyfikacja" />
            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
            <asp:BoundField DataField="zglaszajacy" HeaderText="Zgłaszający" SortExpression="zglaszajacy" />
            <asp:BoundField DataField="id_blad" HeaderText="Błąd" SortExpression="id_blad" />
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
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Powrót" />
</asp:Content>
