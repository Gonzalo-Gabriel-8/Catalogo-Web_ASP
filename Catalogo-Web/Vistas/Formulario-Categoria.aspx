<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Formulario-Categoria.aspx.cs" Inherits="Catalogo_Web.Vistas.Formulario_Categoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/Estilos-Formularios.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="centered-form">
            <div class="form-container">
                <%if (CategoriaID)
                    {%>
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Id</label>
                    <div class="col-sm-10">
                        <asp:Label ID="lblId" CssClass="form-control" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                        <asp:Label ID="lblDescripcion" CssClass="form-control" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Editar</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtEditarCategoria" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <%}
                    else
                    {%>
                <label class="col-sm-2 col-form-label">Nueva Categoria</label>
                <div class="col-sm-10 mb-3">
                    <asp:TextBox ID="txtNuevaCategoria" CssClass="form-control" runat="server" />
                </div>
                <%}%>
                <div class="mb-1 row-3" style="text-align: right">
                    <asp:Button Text="Aceptar" CssClass="btn btn-outline-primary" ID="btnAceptar" OnClick="btnAceptar_Click"
                        runat="server" />
                    <a href="../Vistas/Gestion-Articulo.aspx" class="btn btn-outline-secondary">Cancelar</a>
                    <%if (CategoriaID)
                        {%>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Eliminar
                    </button>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Confirmar Eliminación</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body" style="text-align: left">
                                    ¿Estas seguro que desea eliminar
                                <strong>
                                    <asp:Label ID="lblEliminar" runat="server" /></strong>?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger"
                                        OnClick="btnEliminar_Click" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
