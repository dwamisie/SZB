<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Klienci_Slowniki.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Klienci_Slowniki" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2>Słownik klientów</h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select id_klient, NIP, nazwa, ulica, nr, miejscowosc, kod_pocztowy, poczta, wojewodztwo, kraj, telefon, email, uwagi from [dbo].[klient]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_klient" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="id_klient" HeaderText="Kod klienta" InsertVisible="False" ReadOnly="True" SortExpression="id_klient" />
            <asp:BoundField DataField="NIP" HeaderText="NIP" SortExpression="NIP" />
            <asp:BoundField DataField="nazwa" HeaderText="Nazwa" SortExpression="nazwa" />
            <asp:BoundField DataField="ulica" HeaderText="Ulica" SortExpression="ulica" />
            <asp:BoundField DataField="nr" HeaderText="Nr" SortExpression="nr" />
            <asp:BoundField DataField="miejscowosc" HeaderText="Miejscowość" SortExpression="miejscowosc" />
            <asp:BoundField DataField="kod_pocztowy" HeaderText="Kod pocztowy" SortExpression="kod_pocztowy" />
            <asp:BoundField DataField="poczta" HeaderText="Poczta" SortExpression="poczta" />
            <asp:BoundField DataField="wojewodztwo" HeaderText="Województwo" SortExpression="wojewodztwo" />
            <asp:BoundField DataField="kraj" HeaderText="Kraj" SortExpression="kraj" />
            <asp:BoundField DataField="telefon" HeaderText="Telefon" SortExpression="telefon" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="uwagi" HeaderText="Uwagi" SortExpression="uwagi" />
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
     <asp:Button ID="Button1" runat="server" Height="40px" OnClick="Button1_Click" Text="Nowy" Width="113px" />
     <asp:Literal ID="Literal1" runat="server"></asp:Literal>
     <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Powrót" />
</asp:Content>
