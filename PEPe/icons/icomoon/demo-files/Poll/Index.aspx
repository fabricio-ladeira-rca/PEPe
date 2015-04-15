<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Enquetes
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Enquetes</span></span>
					
					<!-- primary -->
					<div id="primary">
						<h2 class="title">Enquete</h2>
						<% if ((Poll[])ViewData["Poll"] != null && ((Poll[])ViewData["Poll"]).Length > 0){ %>
						<p>
							Responda as enquetes abaixo e nos ajude a melhorar ainda mais a qualidade dos serviços que oferecemos aos nossos clientes.
						</p>
						
						<% foreach(Poll poll in (Poll[])ViewData["Poll"]) { %>
						    <div class="poll clearfix">
						        <% using (Html.BeginRouteForm("Default", new { controller = "poll", action = "result" }, FormMethod.Post, null)) { %>
							    <span class="date">Início <%= poll.StartAt.ToShortDateString() %> - Encerramento <%= poll.EndAt.ToShortDateString() %></span>
							    <strong><%= poll.Question %></strong>
							    <% foreach (PollAnswer answer in poll.Answers) {%>
							        <p><input type="radio" name="answerId"  value="<%= answer.Id %>"/> <%= answer.Description %></p>
							    <% } %>
							    <button class="submit" type="submit">Votar</button>
							    <%}%>
						    </div>
						<% } %>
						<% }else{ %>
						    <p>
							    Nenhuma enquete cadastrada.
						    </p>
						<% } %>
					</div>
					
					<!-- end:primary -->
</asp:Content>
