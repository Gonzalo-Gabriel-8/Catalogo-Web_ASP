<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Gestiones-Productos.aspx.cs" Inherits="Catalogo_Web.Vistas.ListaCatalogo" %>

<%@ Register Src="~/User Control/Gestiones-Productos/Gestion-Articulo.ascx" TagPrefix="uc1" TagName="GestionArticulo" %>
<%@ Register Src="~/User Control/Gestiones-Productos/Gestion-Marcas.ascx" TagPrefix="uc1" TagName="GestionMarcas" %>
<%@ Register Src="~/User Control/Gestion-Categoria.ascx" TagPrefix="uc1" TagName="GestionCategoria" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Script/Modal.js"></script>
    <link href="../Styles/Paginacion_Grilla.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .right-align {
            text-align: right;
        }
    </style>
    <asp:ScriptManager ID="Script" runat="server" />
    <uc1:GestionArticulo runat="server" ID="GestionArticulo" />
    <div class="container-fluid">
        <div class="row">
            <uc1:GestionMarcas runat="server" ID="GestionMarcas" />
            <uc1:GestionCategoria runat="server" id="GestionCategoria" />
        </div>
    </div>
</asp:Content>
