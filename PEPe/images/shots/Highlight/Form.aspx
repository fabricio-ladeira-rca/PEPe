<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - Destaques
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%= Html.ValidationSummary() %>

<% using (Html.BeginRouteForm("ManagerDefault", new { action = ViewData["actionPost"] }, FormMethod.Post, new { enctype = "multipart/form-data" })) { %>
    <%if (((Highlight)ViewData["highlight"]) != null)
      { %>
        <%= Html.Hidden("highlight.id")%>
    <%} %>
    
    <label for="category">Seção:</label>
    <select class="select-field" name="section.id">
        <option value="0">Home</option>
        <% foreach(Section section in (Section[])ViewData["sections"]) { %>    
            <%if (((News)ViewData["news"]) != null && ((News)ViewData["news"]).Section.Id == section.Id) { %>
                <option value="<%= section.Id %>" selected="select"><%= section.Name %></option>
            <%} %>
                <option value="<%= section.Id %>"><%= section.Name %></option>
        <%} %>
    </select>
    
    <label>Título</label>
    <%= Html.TextBox("highlight.title", null, new { Class = "text-field" })%>

    <label>Arquivo:</label><br />
    <input type="file" name="highlight.highlightFile" size="50" />
    <%= Html.Hidden("highlight.fileUrl")%>

    <br /><br />
    <% if (((Highlight)ViewData["highlight"]) != null && !string.IsNullOrEmpty(((Highlight)ViewData["highlight"]).FileUrl)){%>
        <% if (((Highlight)ViewData["highlight"]).IsFlash())
           {%>
	        <div id="highlight<%= ((Highlight)ViewData["highlight"]).Id %>"></div>
	        <script type="text/javascript">
	            swfobject.embedSWF('<%= Html.RootUrl() %>upload/highlight/<%= ((Highlight)ViewData["highlight"]).FileUrl %>', 'highlight<%= ((Highlight)ViewData["highlight"]).Id %>', '260', '103', '9');
	        </script>
	    <%}else{%>
	        <img src="<%= Html.RootUrl() %>upload/highlight/<%= ((Highlight)ViewData["highlight"]).FileUrl %>" width="260" alt="" />
        <%}%>
    <%}%>
    <input type="submit" class="submit" value="Salvar" />
<% } %>

</asp:Content>