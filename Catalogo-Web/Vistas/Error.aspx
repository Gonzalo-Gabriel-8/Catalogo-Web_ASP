<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Catalogo_Web.Vistas.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Error</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="margin-top: 70px">
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <h3>
                        <asp:Label Text="text" ID="lblError" runat="server" />
                    </h3>                    
                </div>
                <div class="mb-3">
                    <a href="../Vistas/Registro.aspx" class="btn btn-outline-primary">Registrarse!</a>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
