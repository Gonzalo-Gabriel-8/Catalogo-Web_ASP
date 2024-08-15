<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Catalogo_Web.Vistas.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="margin-top:70px">
        <h3>
            <asp:Label Text="text" ID="lblError" runat="server" /> 
        </h3>
    </div>
</asp:Content>
