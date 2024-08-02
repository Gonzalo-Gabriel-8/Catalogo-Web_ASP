<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Formulario-Articulo.aspx.cs" Inherits="Catalogo_Web.Vistas.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <style>
    .img-imagen {
        max-width: 200px; 
        max-height: 200px; 
        width: auto; 
        height: auto; 
        object-fit: contain; 
        display: block; 
    }
</style>
    <div class="container-fluid" style="margin-top: 70px">
        <div class="row">
            <div class="col-6">
                <%-- Carga de ID --%>
                <div class="mb-3">
                    <label for="txtId" class="form-label">Id</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>
                <%-- Carga de Codigo --%>
                <div class="mb-3">
                    <label for="txtCodigo" class="form-label">Codigo:</label>
                    <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
                </div>
                <%-- Carga de Nombre --%>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                </div>
                <%-- Carga de Precio --%>
                <div class="mb-3">
                    <label for="txtPrecio" class="form-label">Precio</label>
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                </div>
                <%--Carga Desplegable de Categoria--%>
                <div class="mb-3">
                    <label for="ddCategoria" class="form-label">Categoria</label>
                    <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select"></asp:DropDownList>
                </div>
                <%--Carga Desplegable de Marca--%>
                <div class="mb-3">
                    <label for="ddlMarca" class="form-label">Marca</label>
                    <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-select"></asp:DropDownList>
                </div>
            </div>
            <%-------------------------------------------------------------------------------------------------------------------------%>
            <%-- Carga de Descripcion --%>
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripcion</label>
                    <asp:TextBox TextMode="MultiLine" runat="server" ID="txtDescripcion" CssClass="form-control" />
                </div>
                <%-- Carga de Imagen con Actualizacion --%>
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <label for="txtUrlImagen" class="form-label">URL Imagen:</label>
                        <asp:TextBox runat="server" ID="txtUrlImagen" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtUrlImagen_TextChanged" />
                        <asp:Image ID="imgArticulo" CssClass="img-imagen" runat="server"  ImageUrl="https://epichotelsanluis.com/wp-content/uploads/2022/11/placeholder-2.png" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>


        <%--  -----------------Boton eliminar------------------------%>
        <div class="row">
            <div class="col-6">
                <div class="mb-5">
                    <asp:Button ID="btnAceptar" Text="Aceptar" CssClass="btn btn-outline-primary" OnClick="btnAceptar_Click" runat="server" />
                    
                    <a href="../Vistas/Gestiones-Productos.aspx" class="btn btn-outline-secondary">Cancelar</a>


                    <%if (botonEliminar)
                        {%>
                    <asp:Button Text="Dar de Baja" CssClass="btn btn-outline-warning" ID="btnBaja" OnClick="btnBaja_Click" runat="server" />
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Eliminar</button>
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Advertencia</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    
                                </div>
                                <div class="modal-body">                                    
                                    Esta acción no se podrá revertir.¿Estas seguro que deseas eliminar?                                
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <asp:Button Text="Eliminar" ID="btn_Eliminar" OnClick="btn_Eliminar_Click" CssClass="btn btn-danger" runat="server" ClientIDMode="Static" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</asp:Content>
