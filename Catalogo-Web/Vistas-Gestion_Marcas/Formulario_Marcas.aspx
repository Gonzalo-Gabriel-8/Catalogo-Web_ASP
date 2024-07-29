<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Formulario_Marcas.aspx.cs" Inherits="Catalogo_Web.Vistas_Gestion_Marcas.Formulario_Marcas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class=" row">
            <div class=" col-6">
                <div class="mb-3" style="margin-top: 70px">

                    <label for="exampleInputEmail1" class="form-label">Id</label>
                    <asp:TextBox ID="txtId" CssClass="form-control" runat="server" />                    
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="txtMarcaVeja" CssClass="form-control" runat="server" />
                     <label for="exampleInputEmail1" class="form-label">Renombrar Marca</label>
                     <asp:TextBox ID="txtMarcaNueva" CssClass="form-control" runat="server" />
                </div>
                
                <asp:Button runat="server" Text="Aceptar" CssClass="btn btn-outline-primary" ID="Aceptar" OnClick="Aceptar_Click"/>


            </div>
        </div>
    </div>
</asp:Content>
