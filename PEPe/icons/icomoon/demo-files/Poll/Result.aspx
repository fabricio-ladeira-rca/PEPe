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
						<% if (ViewData["hasVoted"] != null && (bool)ViewData["hasVoted"] == true){  %>
						    <p class="notice-message">
							    Você já votou nessa enquete hoje.
						    </p>
						<%} else { %>
						    <div class="poll clearfix">
							    <strong>Parabéns pela sua participação!</strong>
							    <span class="date">Início <%= ((Poll)ViewData["poll"]).StartAt.ToShortDateString()%> - Encerramento <%= ((Poll)ViewData["poll"]).EndAt.ToShortDateString()%></span>
							    <strong><%= ((Poll)ViewData["poll"]).Question %></strong>
							    <div class="result">
							        <% foreach (PollAnswer answer in ((Poll)ViewData["poll"]).Answers) {%>
								    <p class="answer"><%= answer.Description %></p><span style="width:<%= answer.AsPercent() %>px" class="percent">&nbsp;</span><%= answer.AsPercent() %>%
								    <br class="clear"/>
								    <%} %>
							    </div>
						    </div>    
						<%} %>
						<% foreach(Poll poll in (Poll[])ViewData["otherPoll"]) { %>
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
					</div>
					<!-- end:primary -->
</asp:Content>
