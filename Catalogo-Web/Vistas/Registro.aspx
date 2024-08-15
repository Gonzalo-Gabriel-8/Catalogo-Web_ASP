<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Catalogo_Web.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="margin-top: 70px">
        <div class="row">
            <div class="col-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Dirección de Correo</label>
                    <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="form-control" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-control" runat="server" />
                </div>
                <div class="mb-3">

                    <asp:Button Text="Registrarse" CssClass="btn btn-outline-primary" ID="btnIngresar"
                        runat="server" OnClick="btnIngresar_Click" />
                </div>
            </div>
        </div>

    </div>
</asp:Content>
