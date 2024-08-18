<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Catalogo_Web.Vistas.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/Favoritos.css" rel="stylesheet" />
    <title>Favoritos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .img-fluid{
            max-height:200px;
            max-width:200px;
            padding:15px;
        }
    </style>
    <asp:ScriptManager runat="server" />
    <asp:Repeater ID="repRepetidor" runat="server">
        <ItemTemplate>
            <div class="container">
                <div class="card mb-3">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="<%#Eval("ImagenUrl") %>" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <asp:HiddenField ID="IdArticulo" runat="server" Value='<%# Eval("Id") %>' />
                                <h5 class="card-title"><%#Eval ("nombre") %></h5>
                                <p class="card-text"><%#Eval ("Descripcion") %></p>
                                <p class="card-text"><small class="text-body-secondary"><%#Eval ("Precio") %></small></p>
                                <asp:Button Text="Eliminar" CssClass="btn btn-outline-primary" ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
