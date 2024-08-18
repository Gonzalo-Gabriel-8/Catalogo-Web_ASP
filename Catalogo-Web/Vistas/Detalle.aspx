<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Gonza.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Catalogo_Web.Vistas.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/Detalle.css" rel="stylesheet" />
    <title>Detalle de Articulo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        const alertPlaceholder = document.getElementById('liveAlertPlaceholder')
        const appendAlert = (message, type) => {
            const wrapper = document.createElement('div')
            wrapper.innerHTML = [
                `<div class="alert alert-${type} alert-dismissible" role="alert">`,
                `   <div>${message}</div>`,
                '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
                '</div>'
            ].join('')

            alertPlaceholder.append(wrapper)
        }

        const alertTrigger = document.getElementById('btnFavoritos')
        if (alertTrigger) {
            alertTrigger.addEventListener('click', () => {
                appendAlert('Nice, you triggered this alert message!', 'success')
            })
        }
    </script>
    <%if (detalle)
        {%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="row card-container justify-content-end">
            <div class="col-10">
                <div class="mb-3">
                    <div class="card mb-3 custom-card">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                    <ContentTemplate>
                                        <asp:Image ID="imgArticulo" CssClass="img-imagen" runat="server" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md-8 text-container">
                                <div class="card-body">
                                    <%if (cambiaImagen)
                                        {%>
                                    <asp:ImageButton ID="btnFavoritos" runat="server" AlternateText="Favoritos"
                                        ImageUrl="../Imagenes/heart-3510.png" CssClass="favorite-btn" OnClick="btnFavoritos_Click" />
                                    <%}
                                        else
                                        {%>
                                    <asp:ImageButton ID="btnFavoritos2" runat="server" AlternateText="Favoritos"
                                        ImageUrl="../Imagenes/pngwing.com.png" CssClass="favorite-btn-btn" OnClick="btnFavoritos_Click" />
                                    <% }%>
                                   

                                    <h5 class="card-title">
                                        <asp:Label ID="lblMarca" runat="server" /></h5>
                                    <h5 class="card-title">
                                        <asp:Label ID="lblNombre" runat="server" /></h5>
                                    <h5 class="card-text">
                                        <asp:Label ID="lblCodigo" runat="server" />
                                    </h5>
                                    <h4 class="card-title">$<asp:Label ID="lblPrecio" runat="server" /></h4>

                                    <p class="card-text">
                                        <small class="text-body-secondary">
                                            <asp:Label ID="lblDescripcion" runat="server" /></small>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%} %>
</asp:Content>
