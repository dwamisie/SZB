<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Zarzadzanie_bledami.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Zarzadzanie_bledami" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [id_blad], [produkt], [typ_bledu], [warstwa], [kod_bledu], [tytul], [data_otwarcia], [data_zamkniecia], [SLA], [opis] FROM [blad_Wszystkie]"></asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_blad" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="id_blad" HeaderText="Błąd Nr" ReadOnly="True" SortExpression="id_blad" />
            <asp:BoundField DataField="produkt" HeaderText="Produkt" ReadOnly="True" SortExpression="produkt" />
            <asp:BoundField DataField="typ_bledu" HeaderText="Typ błędu" SortExpression="typ_bledu" />
            <asp:BoundField DataField="warstwa" HeaderText="Warstwa" SortExpression="warstwa" />
            <asp:BoundField DataField="kod_bledu" HeaderText="Kod błędu" SortExpression="kod_bledu" />
            <asp:BoundField DataField="tytul" HeaderText="Tytuł" SortExpression="tytul" />
            <asp:BoundField DataField="opis" HeaderText="Opis" SortExpression="opis" />
            <asp:BoundField DataField="data_otwarcia" HeaderText="Data otwarcia" SortExpression="data_otwarcia" />
            <asp:BoundField DataField="SLA" HeaderText="SLA" SortExpression="SLA" />
            <asp:BoundField DataField="data_zamkniecia" HeaderText="Data zamkniecia" SortExpression="data_zamkniecia" />
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

    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Nowy" />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Powrót" />

</asp:Content>
