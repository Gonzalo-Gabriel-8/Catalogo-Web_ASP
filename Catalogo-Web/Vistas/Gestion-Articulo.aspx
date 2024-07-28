<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Gestion-Articulo.aspx.cs" Inherits="Catalogo_Web.Vistas.ListaCatalogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Script/Modal.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   

    <div class="container-fluid" style="margin-top: 70px">
        <a href="../Vistas/Gestion-Marcas.aspx" class="btn btn-outline-dark"> + Agregar Marca</a>
        <a href="../Vistas/Gestion-Categorias.aspx" class="btn btn-outline-dark"> + Agregar Categorias</a>

        <div class="mt-4">
            <div class="mb-3">
                <asp:GridView ID="dgvArticulo" runat="server" CssClass="gridview table table-striped table-bordered"
                    AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvArticulo_SelectedIndexChanged"
                    AllowPaging="true"
                    PageSize="10" OnPageIndexChanging="dgvArticulo_PageIndexChanging" OnRowDataBound="dgvArticulo_RowDataBound">
                    <Columns>
                        <asp:BoundField HeaderText="N° Identificación" DataField="Id" />
                        <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Categoria" DataField="categoria.Descripcion" />
                        <asp:BoundField HeaderText="Marca" DataField="marca.Descripcion" />
                        <asp:BoundField HeaderText="Precio" DataField="Precio" />
                        <asp:CommandField HeaderText="Modificar" ShowSelectButton="true" SelectText="✍️" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="mb-3">
                <a href="../Vistas/Formulario.aspx" class="btn btn-outline-primary">Agregar</a>
            </div>

        </div>
    </div>
</asp:Content>
