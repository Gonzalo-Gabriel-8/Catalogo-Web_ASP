<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Gestion-Articulo.ascx.cs" Inherits="Catalogo_Web.User_Control.Gestiones_Productos.Filtro_Avanzado" %>
<div class="container-fluid" style="margin-top: 70px">
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <h1>Listado de Articulos</h1>
            </div>
        </div>
        <div style="text-align: right" class="col-6">
            <div class="mb-3">
                <a href="../Vistas/Formulario-Articulo.aspx" class="btn btn-outline-primary">+ Agregar Articulo</a>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-6">
        <div class="mb-3">
            <asp:TextBox PlaceHolder="Buscar Articulo" ID="txtBusquedaRapida" CssClass="form-control"
                runat="server" AutoPostBack="true" OnTextChanged="txtBusquedaRapida_TextChanged" />
        </div>
    </div>
</div>
<div class="row">
    <div class="col-6">
        <div class="mb-3">
            <asp:CheckBox AutoPostBack="true" OnCheckedChanged="ckbFiltroAvanzado_CheckedChanged" ID="ckbFiltroAvanzado" runat="server" />
            <asp:Label Text="Filtrar Busqueda" ID="lblFiltrarBusqueda" CssClass="form-label" runat="server" />
        </div>
    </div>
</div>
<div class="row">
    <div class="col-12">
        <div class="mb-3">
            <%if (ckbFiltroAvanzado.Checked)
                {%>

            <div class="row">
                <div class="col-2" style="margin: auto">
                    <div class="mb-3">
                        <label>Campo</label>
                        <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" ID="ddlCampos" 
                            OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                            <asp:ListItem Text="" />
                            <asp:ListItem Text="Nombre" />
                            <asp:ListItem Text="Marca" />
                            <asp:ListItem Text="Categoria" />

                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label ID="Label1" runat="server" Text="Criterio"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label ID="Label3" runat="server" Text="Estado"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control">
                            <asp:ListItem Text="Todos" />
                            <asp:ListItem Text="Disponible" />
                            <asp:ListItem Text="No Disponible" />
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label ID="Label2" runat="server" Text="Filtro"></asp:Label>
                        <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                    </div>
                </div>
                <div class="col-1" style="margin-top: auto; text-align: right">
                    <div class="mb-3">
                        <asp:Button Text="✅ Filtrar" runat="server" CssClass="btn btn-outline" ID="btnBuscar" OnClick="btnBuscar_Click" />
                         <asp:Button Text="Limpiar" runat="server" CssClass="btn btn-outline" ID="BtnLimpiar" OnClick="BtnLimpiar_Click"  />
                    </div>
                </div>
            </div>
            <%} %>
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
                        AllowPaging="true" PageSize="5" OnPageIndexChanging="dgvArticulo_PageIndexChanging">
                        <Columns>
                            <asp:BoundField HeaderText="N° Identificación" DataField="Id" />
                            <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                            <asp:BoundField HeaderText="Categoria" DataField="categoria.Descripcion" />
                            <asp:BoundField HeaderText="Marca" DataField="marca.Descripcion" />
                            <asp:BoundField HeaderText="Precio" DataField="Precio" />
                            <asp:BoundField HeaderText="Estado" DataField="PrecioCadena" />
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
