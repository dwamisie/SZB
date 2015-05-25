<%@ Page Title="Hasło zostało zmienione" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPasswordConfirmation.aspx.cs" Inherits="System_Zarzadzania_BD.Account.ResetPasswordConfirmation" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Hasło zostało zmienione.</h2>
    <div>
        <p>Twoje hasło zostało zmienione. Kliknij <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">Tutaj</asp:HyperLink> aby się zalogować </p>
    </div>
</asp:Content>
