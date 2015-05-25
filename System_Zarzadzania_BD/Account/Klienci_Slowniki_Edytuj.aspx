<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Klienci_Slowniki_Edytuj.aspx.cs" Inherits="System_Zarzadzania_BD.Account.Klienci_Slowniki_Edytuj" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Edytuj pozycję słownika Klienci</h2>
    <table>
        <tr><td>Kod klienta:</td><td>
            <asp:TextBox ID="kod_klienta" runat="server" Enabled="False"></asp:TextBox>
            </td></tr>
        <tr><td>NIP:</td><td><asp:TextBox ID="NIP" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Nazwa:</td><td><asp:TextBox ID="nazwa" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Ulica:</td><td><asp:TextBox ID="ulica" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Nr:</td><td><asp:TextBox ID="numer" runat="server" Width="323px" TextMode="Number"></asp:TextBox></td></tr>
        <tr><td>Miejscowość:</td><td><asp:TextBox ID="miejscowosc" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Kod pocztowy:</td><td><asp:TextBox ID="kod_pocztowy" runat="server" Width="323px" TextMode="Number"></asp:TextBox></td></tr>
        <tr><td>Poczta:</td><td><asp:TextBox ID="poczta" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Województwo</td><td><asp:TextBox ID="wojewodztwo" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Kraj:</td><td><asp:TextBox ID="kraj" runat="server" Width="323px"></asp:TextBox></td></tr>
        <tr><td>Telefon:</td><td><asp:TextBox ID="telefon" runat="server" Width="323px" TextMode="Phone"></asp:TextBox></td></tr>
        <tr><td>Email:</td><td><asp:TextBox ID="email" runat="server" Width="323px" TextMode="Email"></asp:TextBox></td></tr>
        <tr><td>Uwagi:</td><td><asp:TextBox ID="uwagi" runat="server" Width="323px" TextMode="MultiLine"></asp:TextBox></td></tr>
    </table>
    <asp:Button ID="Button1" runat="server" Text="Zapisz" OnClick="Button1_Click" />
    <asp:Button ID="Button3" runat="server" Text="Anuluj" OnClick="Button3_Click" />

    <h2>Produkty klienta</h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="GetKlientProdukt" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="kod_klienta" Name="id_klient" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_produkt" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id_produkt" HeaderText="kod_produktu" InsertVisible="False" ReadOnly="True" SortExpression="id_produkt" />
                    <asp:BoundField DataField="nazwa" HeaderText="Nazwa" SortExpression="nazwa" />
                    <asp:BoundField DataField="wersja" HeaderText="Wersja" SortExpression="wersja" />
                    <asp:BoundField DataField="opis" HeaderText="Opis" SortExpression="opis" />
                    <asp:CommandField ButtonType="Button" SelectText="Usuń powiązanie" ShowSelectButton="True" />
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

            <asp:DropDownList ID="kod_produktu" runat="server" DataSourceID="SqlDataSource2" DataTextField="produkt" DataValueField="id_produkt"></asp:DropDownList> <asp:Button ID="Button2" runat="server" Text="Dodaj powiązanie" OnClick="Button2_Click" />


            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="GetProduktForKlient" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="kod_klienta" Name="id_klient" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>


            <asp:Literal ID="Literal1" runat="server"></asp:Literal>


        </ContentTemplate>
        
        
    </asp:UpdatePanel>
    <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>Ładuję dane proszę czekać</ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>
