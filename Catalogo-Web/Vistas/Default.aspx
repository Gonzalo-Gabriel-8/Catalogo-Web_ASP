<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Catalogo_Web.Vistas.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/Default.css" rel="stylesheet" />
    <title>Inicio</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% if (carrucel)
        { %>
    <div style="margin-top: 50px">
        <div id="carouselExampleDarkAutoplaying" class="carousel carousel-dark slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <asp:Repeater ID="RepeaterIndicators" runat="server">
                    <ItemTemplate>
                        <button type="button" data-bs-target="#carouselExampleDarkAutoplaying" data-bs-slide-to="<%# Container.ItemIndex %>" class="<%# Container.ItemIndex == 0 ? "active" : "" %>" aria-current="<%# Container.ItemIndex == 0 ? "true" : "" %>" aria-label="Slide <%# Container.ItemIndex + 1 %>"></button>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="carousel-inner">
                <asp:Repeater ID="RepeaterCarrusel" runat="server">
                    <ItemTemplate>
                        <a href="../Vistas/Detalle.aspx?id=<%# Eval("Id") %>">
                            <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>" data-bs-interval="10000">
                                <img src='<%# Eval("ImagenUrl") %>' class="d-block w-100" alt="...">
                                <div class="carousel-caption d-none d-md-block">
                                    <p><%# Eval("Descripcion") %></p>
                                </div>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDarkAutoplaying" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDarkAutoplaying" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <% } %>

    <div class="col-6">
        <div class="mb-3">
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-6 g-4">
        <asp:Repeater ID="repRepetidor" ViewStateMode="Disabled" runat="server">
            <ItemTemplate>
                <a href="../Vistas/Detalle.aspx?id=<%# Eval("Id") %>" style="text-decoration: unset">
                    <div class="col">
                        <div class="card h-100 border-dark" style="max-width: 16rem;">
                            <div class="card-img-container">
                                <img src="<%# Eval("ImagenUrl") %>" class="card-img-top img-fluid" alt="...">
                            </div>
                            <div class="card-body p-2">
                                <h5 class="card-title h6"><%# Eval("Nombre") %></h5>
                                <p class="card-text small"><%# Eval("Precio") %></p>
                            </div>
                        </div>
                    </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
