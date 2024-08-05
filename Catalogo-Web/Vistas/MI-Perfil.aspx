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
                            <asp:Image runat="server" ID="miAvatar" Style="height: 150px; width: 150px; border-radius: 50%; object-fit: cover; object-position: center;" />
                            <h3 class="mt-3">Nombre del Usuario</h3>
                            <p class="text-muted">email@ejemplo.com</p>
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
                                                    <li class="list-group-item"><strong>Nombre: </strong> Nombre del Usuario</li>
                                                    <li class="list-group-item"><strong>Email: </strong> email@ejemplo.com</li>
                                                    <li class="list-group-item"><strong>Teléfono: </strong> (123) 456-7890</li>
                                                    <li class="list-group-item"><strong>Dirección: </strong> Calle Falsa 123, Ciudad, País</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingPurchaseHistory">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePurchaseHistory" aria-expanded="false" aria-controls="collapsePurchaseHistory">
                                                Historial de Compras
                                            </button>
                                        </h2>
                                        <div id="collapsePurchaseHistory" class="accordion-collapse collapse" aria-labelledby="headingPurchaseHistory" data-bs-parent="#accordionProfile">
                                            <div class="accordion-body">
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">Compra 1: Descripción de la compra 1</li>
                                                    <li class="list-group-item">Compra 2: Descripción de la compra 2</li>
                                                    <li class="list-group-item">Compra 3: Descripción de la compra 3</li>
                                                    <!-- Más compras -->
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
                                                        <label for="email" class="form-label">Correo Electrónico</label>
                                                        <input type="email" class="form-control" id="email" placeholder="email@ejemplo.com">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="password" class="form-label">Contraseña</label>
                                                        <input type="password" class="form-control" id="password" placeholder="Contraseña">
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
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
