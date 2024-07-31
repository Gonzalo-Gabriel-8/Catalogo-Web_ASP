<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="MI-Perfil.aspx.cs" Inherits="Catalogo_Web.Vistas.MI_Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="margin-top: 15px">
        <div class="row">
            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-8 col-lg-6 text-center">
                        <div class="card mb-4">
                            <div class="card-body">
                                <asp:Image runat="server" ID="MiAvatar" Style="height: 150px; width: 150px; border-radius: 50%; object-fit: cover; object-position: center;" />
                                <h3 class="mt-3">
                                    <asp:Label CssClass="form-label" ID="lblNombre_Apellido" runat="server" />
                                </h3>
                                <p class="text-muted">
                                    <asp:Label CssClass="form-label" ID="lblEmail" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="accordion" id="accordionExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Información Personal
                           
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item"><strong>Nombre: </strong>
                                                <asp:Label ID="lblInfo_Nombre" runat="server" /></li>
                                            <li class="list-group-item"><strong>Email: </strong>
                                                <asp:Label ID="lblInfo_Email" runat="server" /></li>
                                            <li class="list-group-item"><strong>Apellido: </strong>
                                                <asp:Label ID="lblInfo_Apellido" runat="server" /></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingThree">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        Configuración de Cuenta                           
                                    </button>
                                </h2>
                                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <div>
                                            <div class="mb-3">
                                                <label for="email" class="form-label">Correo Electrónico</label>
                                                <asp:TextBox TextMode="Email" CssClass="form-control" ID="txtEmail"
                                                    PlaceHolder="email@ejemplo.com" runat="server" />
                                            </div>
                                            <div class="mb-3">
                                                <label for="password" class="form-label">Contraseña</label>
                                                <asp:TextBox TextMode="Password" CssClass="form-control"
                                                    PlaceHolder="Contraseña" runat="server" />
                                            </div>
                                            <asp:Button Text="Guardar Cambios" CssClass="btn btn-outline-primary" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-4 mb-3">
                            <asp:Button Text="Cerrar Sesión" CssClass="btn btn-outline-secondary" runat="server" />
                        </div>

                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Eliminar
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Confirmar eliminación de la cuenta</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">

                                        ¿Estas seguro que quiere eliminar tu cuenta? Se eliminará tu cuenta y todos los datos asociados a ella!!
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                        <asp:Button ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger" Text="Eliminar" runat="server" />
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
