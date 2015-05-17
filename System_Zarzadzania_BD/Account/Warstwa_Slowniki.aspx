<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Warstwa_Slowniki.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Warstwa_Slowniki" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Słownik Warstwy</h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select id_warstwa, nazwa, status from [dbo].[sWarstwaWszystkie]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_warstwa" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="id_warstwa" HeaderText="Kod warstwy " InsertVisible="False" ReadOnly="True" SortExpression="id_warstwa" />
            <asp:BoundField DataField="nazwa" HeaderText="Nazwa" SortExpression="nazwa" />
            <asp:BoundField DataField="status" HeaderText="Status" ReadOnly="True" SortExpression="status" />
            <asp:CommandField ButtonType="Button" SelectText="Edytuj" ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle ForeColor="#333333" BackColor="White" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Nowy" />
</asp:Content>
