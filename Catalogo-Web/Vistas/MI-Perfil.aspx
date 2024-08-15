<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="MI-Perfil.aspx.cs" Inherits="Catalogo_Web.Vistas.MI_Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="margin-top: 70px">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-12 col-md-10 col-lg-8">
                    <div class="card">
                        <div class="row g-0">
                            <div class="col-md-4 text-center p-4">
                                <div class="mb-5">
                                    <asp:Image runat="server" ID="miAvatar" Style="height: 150px; width: 150px; border-radius: 50%; object-fit: cover; object-position: center;" />
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body mb-5">
                                    <h4 class="card-title">Mi Perfil</h4>
                                    <div class="accordion" id="accordionProfile">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingPersonalInfo">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePersonalInfo" aria-expanded="false" aria-controls="collapsePersonalInfo">
                                                    Información Personal
                                                </button>
                                            </h2>
                                            <div id="collapsePersonalInfo" class="accordion-collapse collapse" aria-labelledby="headingPersonalInfo" data-bs-parent="#accordionProfile">
                                                <div class="accordion-body">
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item"><strong>Nombre: </strong>
                                                            <asp:Label ID="lblNombre" runat="server" /></li>
                                                        <li class="list-group-item"><strong>Email: </strong>
                                                            <asp:Label ID="lblEmail" runat="server" /></li>
                                                        <li class="list-group-item"><strong>Apellido: </strong>
                                                            <asp:Label ID="lblApellido" runat="server" /></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingAccountSettings">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAccountSettings" aria-expanded="false" aria-controls="collapseAccountSettings">
                                                    Configuración de Cuenta
                                                </button>
                                            </h2>
                                            <div id="collapseAccountSettings" class="accordion-collapse collapse" aria-labelledby="headingAccountSettings" data-bs-parent="#accordionProfile">
                                                <div class="accordion-body">
                                                    <div>
                                                        <div class="mb-3">
                                                            <label for="Nombre" class="form-label">Nombre</label>
                                                            <asp:TextBox CssClass="form-control" ID="txtNombre" runat="server" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="Apellido" class="form-label">Apellido</label>
                                                            <asp:TextBox CssClass="form-control" ID="txtApellido" runat="server" />
                                                        </div>                                                       
                                                        <div class="mb-3">
                                                            <label for="password" class="form-label">Contraseña</label>
                                                            <asp:TextBox TextMode="Password" CssClass="form-control"
                                                                PlaceHolder="email@ejemplo.com" ID="txtPass" runat="server" />
                                                            <div class="mb-3">
                                                                <label class="form-label">Foto de Perfil</label>
                                                                <input class="form-control" type="file" runat="server" id="txtImagen" />
                                                            </div>
                                                        </div>
                                                        <asp:Button Text="Guardar Cambios" CssClass="btn btn-primary" ID="btnGuardar" OnClick="btnGuardar_Click" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 text-end">
                                        <button class="btn btn-danger">Cerrar Sesión</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
