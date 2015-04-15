<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - Notícias
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%= Html.ValidationSummary() %>

<% using (Html.BeginRouteForm("ManagerDefault", new { action = ViewData["actionPost"] }, FormMethod.Post, new { enctype = "multipart/form-data", Id = "news_form" })) { %>
    <%if(((News)ViewData["news"]) != null){ %>
        <%= Html.Hidden("news.id")%>
    <%} %>
    <label for="category">Seção</label>
    <select class="select-field" name="section.id">
        <option value="0">Todos</option>
        <% foreach(Section section in (Section[])ViewData["sections"]) { %>    
            <%if (((News)ViewData["news"]) != null && (((News)ViewData["news"]).Section != null  && ((News)ViewData["news"]).Section.Id == section.Id)) { %>
            <option value="<%= section.Id %>" selected="select"><%= section.Name %></option>
            <%} else { %>
            <option value="<%= section.Id %>"><%= section.Name %></option>
            <%} %>
        <%} %>
    </select>    
    <p class="date">
        <label>Data de publicação</label>
        <%= Html.TextBox("news.postedatdate", null, new { Class = "text-field", size = 10, Value = (((News)ViewData["news"]) != null ? ((News)ViewData["news"]).PostedAt : DateTime.Now).ToString("dd/MM/yyyy") })%>
    </p>
    <p class="hour">
        <label><em>hh:mm</em></label>
        <%= Html.TextBox("news.postedattime", null, new { Class = "text-field", size = 5, Value = (((News)ViewData["news"]) != null ? ((News)ViewData["news"]).PostedAt : DateTime.Now).ToString("HH:mm") })%>
        <%= Html.Hidden("news.postedAt")%>
    </p>
    <br class="clear" />
    <label>Título</label>
    <%= Html.TextBox("news.title", null, new { Class = "text-field" })%>

    <label>Texto</label>
    <%= Html.TextArea("news.body", null, new { rows = 12 })%>
    
    <br class="clear"/>
    <%= Html.CheckBox("news.isHighlight") %> <label>Mostrar como destaque na seção Notícias</label>    
    
    <label>Imagem</label><br />
    <input type="file" name="image" size="50" style="margin: 2px 0 8px;" /><br />
    
    <label>Legenda</label>
    <%= Html.TextBox("subtitle", null, new { Class = "text-field" })%>
    
    <% if (((News)ViewData["news"]) != null && ((News)ViewData["news"]).Images.Count > 0) { %>
        <label>Imagens adicionadas</label>
        <ul class="images">
        <% foreach(NewsImage image in ((News)ViewData["news"]).Images) {%>
            <li>
                <img width="100" height="75" src="<%= image.Thumb %>" alt="<%= image.Legend %>" title="<%= image.Legend %>" />
				<a href="<%= Html.RootUrl() %>manager/newsImages/destroy/<%= image.Id %>" class="delete">
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/del.png" alt="Excluir" height="16" width="16" />
				</a>
            </li>
        <% } %>
        </ul>
        <br class="clear" />
    <% } %>
    
    <input type="submit" class="submit" value="Salvar" />
    
<% } %>
<script type="text/javascript" src="<%= Html.RootUrl() %>Content/js/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(function(){
        $("#news_postedatdate").datepicker({
            altField: '#news_postedatdate',
            altFormat: 'dd/mm/yy',
            dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
            monthNames: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'] 
        });
        $("#news_postedatdate, #news_postedattime").change(function() {
            $("#news_postedAt").attr("value", getPublishDateTime());
        })
        $("#news_form").submit(function() {
            $("#news_postedAt").attr("value", getPublishDateTime());
        });
        function getPublishDateTime(){
            if ($("#news_postedatdate").val() != "" && $("#news_postedattime").val() != "") {
                return $("#news_postedatdate").val() + " " + $("#news_postedattime").val();
            } else {
                return "";
            }
        }
    });
</script>
</asp:Content>