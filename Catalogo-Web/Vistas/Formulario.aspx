<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="Catalogo_Web.Vistas.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
    <br />

    <div class="container mt-4">
        <div class="row">
            <div class="col-6">
                <%-- Entrada de ID --%>
                <div class="mb-3">
                    <label for="txtId" class="form-label">Id</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>
                <%-- Entrada de Codigo --%>
                <div class="mb-3">
                    <label for="txtCodigo" class="form-label">Codigo:</label>
                    <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
                </div>
                <%-- Entrada de Nombre --%>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                </div>
                <%-- Entrada de Precio --%>
                <div class="mb-3">
                    <label for="txtPrecio" class="form-label">Precio</label>
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                </div>
                <%--Entrada Desplegable de Categoria--%>
                <div class="mb-3">
                    <label for="ddCategoria" class="form-label">Categoria</label>
                    <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select"></asp:DropDownList>
                </div>
                <%--Entrada Desplegable de Marca--%>
                <div class="mb-3">
                    <label for="ddlMarca" class="form-label">Marca</label>
                    <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-select"></asp:DropDownList>
                </div>
            </div>
            <%-------------------------------------------------------------------------------------------------------------------------%>
            <%-- Entrada de Descripcion --%>
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripcion</label>
                    <asp:TextBox TextMode="MultiLine" runat="server" ID="txtDescripcion" CssClass="form-control" />
                </div>
                <%-- Entrada de Imagen con Actualizacion --%>
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <label for="txtUrlImagen" class="form-label">URL Imagen:</label>
                            <asp:TextBox runat="server" ID="txtUrlImagen" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtUrlImagen_TextChanged" />
                        </div>
                        <asp:Image ID="imgArticulo" runat="server" Height="450" Width="50%" ImageUrl="https://epichotelsanluis.com/wp-content/uploads/2022/11/placeholder-2.png" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <%--boton de aceptar--%>
            <div class="mb-3">
                <asp:Button ID="btnAceptar" Text="Aceptar" CssClass="btn btn-outline-primary" OnClick="btnAceptar_Click" runat="server" />
                <%--boton de Cancelar--%>
                <a href="ListaCatalogo.aspx" class="btn btn-outline-secondary">Cancelar</a>
             <%--  -----------------Boton eliminar------------------------%>                
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> Eliminar</button>                 

                <!-- Modal -->
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
</asp:Content>
