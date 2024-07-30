<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Gestiones-Productos.aspx.cs" Inherits="Catalogo_Web.Vistas.ListaCatalogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Script/Modal.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .right-align {
            text-align: right;
        }
    </style>
    <asp:ScriptManager ID="Script" runat="server" />
    <div class="container-fluid" style="margin-top: 70px">
        <div class="row">
            <div class="col-6">
                <h4>Listado de Articulos</h4>
            </div>
            <div style="text-align: right" class="col-6">
                <div class="mb-3">
                    <a href="../Vistas/Formulario-Articulo.aspx" class="btn btn-outline-primary">+ Agregar Articulo</a>
                </div>
            </div>


            <div class="row">
                <div class="col-6">
                    <div class="mb-3">
                        <asp:TextBox PlaceHolder="Buscar Articulo" ID="txtBuscarArticulo" CssClass="form-control" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-12">
                        <div class="mb-5">
                            <asp:GridView ID="dgvArticulo" runat="server" CssClass="gridview table table-striped table-bordered"
                                AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvArticulo_SelectedIndexChanged"
                                AllowPaging="true"
                                PageSize="5" OnPageIndexChanging="dgvArticulo_PageIndexChanging">
                                <Columns>
                                    <asp:BoundField HeaderText="N° Identificación" DataField="Id" />
                                    <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
                                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                    <asp:BoundField HeaderText="Categoria" DataField="categoria.Descripcion" />
                                    <asp:BoundField HeaderText="Marca" DataField="marca.Descripcion" />
                                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                                    <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✏"
                                        ItemStyle-CssClass="right-align"
                                        HeaderStyle-CssClass="right-align" ControlStyle-CssClass=" btn btn-outline-primary" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>


    <div class="container-fluid">
        <div class="row">
            <!-- Columna de Marcas -->
            <div class="col-6">
                <div class="row align-items-center mb-2">
                    <div class="col-8">
                        <h4>Listado de Marcas</h4>
                    </div>

                </div>
                <div class="row mb-3">
                    <div class="col-12">
                        <asp:TextBox PlaceHolder="Buscar Marca" ID="TextBox1" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:GridView runat="server" ID="dgv_Marcas" AutoGenerateColumns="false"
                                    CssClass="table" DataKeyNames="Id" OnSelectedIndexChanged="dgv_Marcas_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField HeaderText="Marcas" DataField="Descripcion" />
                                        <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✏"
                                            ItemStyle-CssClass="right-align"
                                            HeaderStyle-CssClass="right-align" ControlStyle-CssClass="btn btn-outline-primary" />
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col-4 text-right mb-5">
                        <a href="../Vistas/Formulario.aspx" class="btn btn-outline-primary">+ Agregar Marca</a>
                    </div>
                </div>
            </div>

            <!-- Columna de Categorías -->
            <div class="col-6">
                <div class="row align-items-center mb-2">
                    <div class="col-8">
                        <h4>Listado de Categorías</h4>
                    </div>

                </div>
                <div class="row mb-3">
                    <div class="col-12">
                        <asp:TextBox PlaceHolder="Buscar Categoría" ID="TextBox2" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:GridView runat="server" ID="dgvCategoria" AutoGenerateColumns="false"
                                    CssClass="table" DataKeyNames="Id" OnSelectedIndexChanged="dgv_Marcas_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField HeaderText="Categorías" DataField="Descripcion" />
                                        <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✏"
                                            ItemStyle-CssClass="right-align"
                                            HeaderStyle-CssClass="right-align" ControlStyle-CssClass="btn btn-outline-primary" />
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col-5 text-right">
                        <a href="../Vistas/Formulario.aspx" class="btn btn-outline-primary">+ Agregar Categoría</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
