<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" ValidateRequest="false" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>
<%@ Import Namespace="W3.Helper" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - FAQ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%= Html.ValidationSummary(null, new { Class = "error-message" })%>

<% using (Html.BeginRouteForm("ManagerDefault", new { action = ViewData["actionPost"] }, FormMethod.Post, null)) { %>

    <%if(((Faq)ViewData["faq"]) != null){ %>
        <%= Html.Hidden("faq.id")%>
    <%} %>
    
    <label for="category">Categoria</label>
    
    <select class="select-field" name="section.id">
        <% foreach(Section section in (Section[])ViewData["sections"]) { %>    
            <%if (((Faq)ViewData["faq"]) != null && ((Faq)ViewData["faq"]).Section.Id == section.Id) { %>
                <option value="<%= section.Id %>" selected="select"><%= section.Name %></option>
            <%} %>
                <option value="<%= section.Id %>"><%= section.Name %></option>
        <%} %>
    </select>
    
	<label>Pergunta:</label>
	<%= Html.TextBox("faq.question", null, new { Class = "text-field" })%>
	<%= Html.ValidationMessage("faq.answer", "*") %>

	<label>Resposta:</label>
	<%= Html.TextArea("faq.answer", null, new { Class = "text-field", rows="12" })%>
	<%= Html.ValidationMessage("faq.answer", "*") %>

	<input type="submit" class="submit" value="Salvar" />
<% } %>

</asp:Content>


