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
                                                        <li class="list-group-item"><strong>Apellido: </strong>
                                                            <asp:Label ID="lblApellido" runat="server" /></li>
                                                        <li class="list-group-item"><strong>Email: </strong>
                                                            <asp:Label ID="lblEmail" runat="server" /></li>
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
                                                            <asp:TextBox CssClass="form-control" ID="txtId" runat="server" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="Nombre" class="form-label">Nombre</label>
                                                            <asp:TextBox CssClass="form-control" ID="txtNombre" runat="server" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="Apellido" class="form-label">Apellido</label>
                                                            <asp:TextBox CssClass="form-control" ID="txtApellido" runat="server" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="Email" class="form-label">Email</label>
                                                            <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" />
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="password" class="form-label">Contraseña</label>
                                                            <asp:TextBox TextMode="Password" CssClass="form-control" ID="txtPass" runat="server" />
                                                            <div class="mb-3">
                                                                <label class="form-label">Foto de Perfil</label>
                                                                <input class="form-control" type="file" runat="server" id="txtImagen" />
                                                            </div>
                                                            <div class="mb-3">
                                                                <!-- Button trigger modal -->
                                                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                                                    Eliminar Cuenta
                                                                </button>
                                                                <!-- Modal -->
                                                                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Eliminar</h1>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                Al eliminar la cuenta se perderán todos los datos y no se podrán recuperar.¿Deseas continuar?
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                                                <asp:Button Text="Eliminar" CssClass="btn btn-outline-primary" ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <asp:Button Text="Guardar Cambios" CssClass="btn btn-primary" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 text-end">
                                        <asp:Button Text="Cerrar Sesión" CssClass="btn btn-secondary" ID="btnSalir" OnClick="btnSalir_Click" runat="server" />
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
