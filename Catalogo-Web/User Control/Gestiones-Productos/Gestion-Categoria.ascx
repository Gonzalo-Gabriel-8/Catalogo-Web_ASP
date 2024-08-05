<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Gestion-Categoria.ascx.cs" Inherits="Catalogo_Web.User_Control.Gestion_Categoria" %>
 <div class="col-6">
     <div class="row align-items-center mb-2">
         <div class="col-8">
             <h4>Listado de Categorías</h4>
         </div>

     </div>
     <div class="row mb-3">
         <div class="col-12">
             <asp:TextBox PlaceHolder="Buscar Categoría" ID="txtBusquedaRapida_Categoria"
                 CssClass="form-control" runat="server" OnTextChanged="txtBusquedaRapida_Categoria_TextChanged"/>
         </div>
     </div>
     <div class="row">
         <div class="col-12">
             <asp:UpdatePanel runat="server">
                 <ContentTemplate>
                     <asp:GridView runat="server" ID="dgvCategoria" AutoGenerateColumns="false"
                         CssClass="table" DataKeyNames="Id" OnSelectedIndexChanged="dgvCategoria_SelectedIndexChanged">
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
             <a href="../Vistas/Formulario-Categoria.aspx" class="btn btn-outline-primary">+ Agregar Categoría</a>
         </div>
     </div>
 </div>