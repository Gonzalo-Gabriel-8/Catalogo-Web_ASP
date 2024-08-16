<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Catalogo_Web.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="margin-top: 70px">
        <div class="row">
            <div class="col-4">
                <div class="mb-3">
                    <asp:Label Text="Email" CssClass="form-label" runat="server" />
                    <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El Email es requerido" ControlToValidate="txtEmail" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Label Text="Contraseña" CssClass="form-label" runat="server" />
                    <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="la contraseña es requerida" ControlToValidate="txtPass" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Label Text="Nombre" CssClass="form-label" runat="server" />
                    <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El nombre es requerido" ControlToValidate="txtNombre" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Label Text="Apellido" CssClass="form-label" runat="server" />
                    <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="El apellido es requerido" ControlToValidate="txtApellido" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Button Text="Registrarse" CssClass="btn btn-outline-primary" ID="btnIngresar"
                        runat="server" OnClick="btnIngresar_Click" />
                </div>
            </div>
        </div>

    </div>
</asp:Content>
