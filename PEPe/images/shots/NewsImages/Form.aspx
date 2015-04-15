<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - Notícias
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%= Html.ValidationSummary() %>


<% using (Html.BeginRouteForm("ManagerDefault", new { action = ViewData["actionPost"], id = ViewContext.RouteData.Values["id"] }, FormMethod.Post, new { enctype = "multipart/form-data", Id = "news_form" })) { %>

    <%if(((NewsImage)ViewData["newsImage"]) != null){ %>
        <%= Html.Hidden("newsImage.id")%>
        <%= Html.Hidden("newsImage.newsId")%>
    <%} %>
    
    <label>Legenda</label>
    <%= Html.TextBox("newsImage.legend", null, new { Class = "text-field" })%>
    <br />
    <label>Foto:</label><br />
    <input type="file" name="newsImage.imageFile" size="50" />
    <%= Html.Hidden("newsImage.name")%>

    <br /><br />
    <% if (((NewsImage)ViewData["newsImage"]) != null) { %>
    <img src="<%= Html.RootUrl() %>upload/news/thumb/<%= ((NewsImage)ViewData["newsImage"]).Name %>" />
    <%} %>

    <input type="submit" class="submit" value="Salvar" />
<% } %>

</asp:Content>