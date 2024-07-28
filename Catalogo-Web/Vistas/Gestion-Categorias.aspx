<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Gestion-Categorias.aspx.cs" Inherits="Catalogo_Web.Vistas.Gestion_Categorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="margin-top: 70px">
        <div class="container mt-4">
            <div class=" row">
                <div class=" col-6">
                    <div class="mb-3">
                        <asp:GridView CssClass="table" ID="dgv_Categorias" AutoGenerateColumns="false" runat="server">
                            <Columns>
                                <asp:BoundField HeaderText="Listado de categorias existentes" DataField="Descripcion" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="col-6">
                    <div class="mb-3">
                        <asp:TextBox ID="txtNuevaCategoria" CssClass="form-control" PlaceHolder="Nueva Categoria" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:Button Text="Agregar" ID="btn_Agregar_Categoria" CssClass="btn btn-outline-primary"
                            runat="server" OnClick="btn_Agregar_Categoria_Click" />
                    </div>
                </div>



            </div>
        </div>
    </div>


</asp:Content>
