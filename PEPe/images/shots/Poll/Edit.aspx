<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - Enquetes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<% using (Html.BeginForm("update", "poll")) { %>
	<%= Html.Hidden("poll.id") %>
	
    <label for="category">Seção:</label>
    <select class="select-field" name="section.id">
        <% foreach(Section section in (Section[])ViewData["sections"]) { %>    
            <%if (((Poll)ViewData["poll"]) != null && ((Poll)ViewData["poll"]).Section.Id == section.Id) { %>
                <option value="<%= section.Id %>" selected="select"><%= section.Name %></option>
            <%} %>
                <option value="<%= section.Id %>"><%= section.Name %></option>
        <%} %>
    </select>
    
    
    <p class="poll date">
        <label>Data de início:</label>
        <%= Html.TextBox("poll.startAt", ((Poll)ViewData["poll"]).StartAt.ToShortDateString(), new { Class = "date-field text-field" })%>
    </p>
    
    <p class="poll date">
        <label>Data de encerramento:</label>
        <%= Html.TextBox("poll.endAt", ((Poll)ViewData["poll"]).EndAt.ToShortDateString(), new { Class = "date-field text-field" })%>
    </p>
    
    
    <script type="text/javascript" src="<%= Html.RootUrl() %>Content/js/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("input.date-field").datepicker({
                altFormat: 'dd/mm/yy',
                dateFormat: 'dd/mm/yy',
                dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
                monthNames: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'] 
            });
        });
    </script>
    
	<label>Pergunta</label>
	<%= Html.TextBox("poll.question", null, new { Class = "text-field" })%>
	<%= Html.ValidationMessage("poll.question", "*") %>

	<label>Resposta 1</label>
	<%= Html.TextBox("answer1.description", null, new { Class = "text-field" })%>
	<%= Html.Hidden("answer1.id")%>
	<%= Html.ValidationMessage("answer1.description", "*") %>

	<label>Resposta 2</label>
	<%= Html.TextBox("answer2.description", null, new { Class = "text-field" })%>
	<%= Html.Hidden("answer2.id")%>
	<%= Html.ValidationMessage("answer2.description", "*")%>

	<label>Resposta 3</label>
	<%= Html.TextBox("answer3.description", null, new { Class = "text-field" })%>
	<%= Html.Hidden("answer3.id")%>
	<%= Html.ValidationMessage("answer3.description", "*")%>

	<label>Resposta 4</label>
	<%= Html.TextBox("answer4.description", null, new { Class = "text-field" })%>
	<%= Html.Hidden("answer4.id")%>
	<%= Html.ValidationMessage("answer4.description", "*")%>

	<label>Resposta 5</label>
	<%= Html.TextBox("answer5.description", null, new { Class = "text-field" })%>
	<%= Html.Hidden("answer5.id")%>
	<%= Html.ValidationMessage("asnwer5.description", "*") %>

	<input type="submit" class="submit" value="Salvar" />
<% } %>
</asp:Content>
