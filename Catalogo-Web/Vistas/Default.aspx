<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Catalogo_Web.Vistas.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/Default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%if (carrucel)
        {%>
    <div style="margin-top: 70px">
        <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <asp:Repeater ID="RepeaterCarrusel" runat="server">
                    <ItemTemplate>
                        <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                            <img src='<%# Eval("ImagenUrl") %>' class="d-block" alt="...">
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <%} %>
    <%---------------------------------------------Cards--------------------------------------%>
    <div class="col-6">
        <div class="mb-3">
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-6 g-4">
        <asp:Repeater ID="repRepetidor" ViewStateMode="Disabled" runat="server">
            <ItemTemplate>
                <a href="../Vistas/Detalle.aspx?id=<%#Eval("Id") %>" style="text-decoration: unset">
                    <div class="col">
                        <div class="card h-100 border-dark" style="max-width: 16rem;">
                            <div class="card-img-container">
                                <img src="<%#Eval("ImagenUrl") %>" class="card-img-top img-fluid" alt="...">
                            </div>
                            <div class="card-body p-2">
                                <h5 class="card-title h6"><%#Eval("Nombre")%></h5>
                                <p class="card-text small"><%#Eval("Precio") %></p>

                            </div>
                        </div>
                    </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
