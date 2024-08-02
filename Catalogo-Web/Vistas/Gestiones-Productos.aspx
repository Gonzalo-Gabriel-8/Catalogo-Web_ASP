<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Gestiones-Productos.aspx.cs" Inherits="Catalogo_Web.Vistas.ListaCatalogo" %>

<%@ Register Src="~/User Control/Gestiones-Productos/Gestion-Articulo.ascx" TagPrefix="uc1" TagName="GestionArticulo" %>


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
            <!-- Columna de Marcas -->
            <div class="col-6">
                <div class="row align-items-center mb-2">
                    <div class="col-8">
                        <h4>Listado de Marcas</h4>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12">
                        <asp:TextBox PlaceHolder="Buscar Marca" ID="txtBusquedaRapida_Marcas"
                            OnTextChanged="txtBusquedaRapida_Marcas_TextChanged" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:GridView runat="server" ID="dgv_Marcas" AutoGenerateColumns="false"
                                    CssClass="table" DataKeyNames="Id" OnSelectedIndexChanged="dgv_Marcas_SelectedIndexChanged"
                                    AllowPaging="true" PageSize="5" OnPageIndexChanging="dgv_Marcas_PageIndexChanging">
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
                    <div class="col-12 text-right mb-5">
                        <a href="../Vistas/Formulario-Marca.aspx" class="btn btn-outline-primary">+ Agregar Marca</a>
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
