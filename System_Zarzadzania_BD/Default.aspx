<%@ Page Title="SZB.Cloud" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="System_Zarzadzania_BD._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="font-size:18pt; font-family:Tahoma; font-weight:bold;">
        System zarządzania błędami</div>

    <div class="row">
        <div class="col-md-4">
            <h2>Administracja</h2>
            <p>Kliknij w przycisk Administracja i przejdź do Panelu Administratora.</p>
            <a href="Account/Administracja.aspx"><div class="admin">Administracja</div></a>
        </div>

         <div class="col-md-4">
            <h2>Błędy</h2>
            <p>
                Kliknij w przycisk Błędy i przejdź do Zarządzanie Błędami.
            </p>
               <a href="Account/Bledy.aspx"><div class="blad">Błąd</div></a>
        </div>
 
        <div class="col-md-4">
            <h2>Incydenty</h2>
            <p>
                Kliknij w przycisk Incydenty i przejdź do Moje incydenty oraz Zarządzanie incydentami .
            </p>
                <a href="Account/Incydent.aspx"><div class="incydent">Incydent</div></a>
        </div>

        <div class="col-md-4">
            <h2>Zgłoś inncydent</h2>
            <p>
                Kliknij w przycisk Zgłoś incydent i przejdź do Zgłoś Incyent.
            </p>
           <a href="Account/Zglos.aspx"><div class="zglos_incydent">Zgłoś incydent</div></a>
        </div>
    </div>

</asp:Content>
