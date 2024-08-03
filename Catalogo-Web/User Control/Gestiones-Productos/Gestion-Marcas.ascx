<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Gestion-Marcas.ascx.cs" Inherits="Catalogo_Web.User_Control.Gestiones_Productos.Gestion_Marcas" %>
<div class="col-6">
    <div class="row align-items-center mb-2">
        <div class="col-8">
            <h4>Listado de Marcas</h4>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-12">
            <asp:TextBox PlaceHolder="Buscar Marca" ID="txtBusquedaRapida_Marcas"
                OnTextChanged="txtBusquedaRapida_Marcas_TextChanged"
                CssClass="form-control" runat="server" />
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