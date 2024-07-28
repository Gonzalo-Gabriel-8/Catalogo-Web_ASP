<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Gestion-Marcas.aspx.cs" Inherits="Catalogo_Web.Vistas.Gestion_Marcas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="margin-top: 70px">
        <div class="container mt-4">
            <div class=" row">
                <div class=" col-6">
                    <div class="mb-3">
                        <asp:GridView runat="server" ID="dgv_Marcas" AutoGenerateColumns="false"
                            CssClass="table">
                            <Columns>
                                <asp:BoundField HeaderText="Listado de marcas existentes" DataField="Descripcion" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class=" col-6">
                    <div class="mb-3">
                        <asp:TextBox ID="txtNuevaMarca" CssClass="form-control" PlaceHolder="Escriba la nueva marca" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:Button Text="Agregar" ID="btn_Agregar_Marcas" CssClass="btn btn-outline-primary"
                            OnClick="btn_Agregar_Marcas_Click" runat="server" />
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
