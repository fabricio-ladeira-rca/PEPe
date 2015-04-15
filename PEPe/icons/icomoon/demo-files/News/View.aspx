<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_volare_v1.Models" %>
<%@ Import Namespace="randon_consorcios_volare_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Notícias
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Notícias</span></span>
					
					<!-- primary -->
					<div id="primary">
					    <% if (ViewData["newsDetail"] != null) { %>
						<h2><%= ((News)ViewData["newsDetail"]).Title%></h2>
						<% if (!string.IsNullOrEmpty(((News)ViewData["newsDetail"]).FirstImage)){%>
						    <div class="news-images">
						    <% foreach( NewsImage image in ((News)ViewData["newsDetail"]).Images) { %>
						        <a href="<%= Html.RootUrl() %>upload/news/<%= image.Name %>" title="<%= image.Legend %>"><img src="<%= Html.RootUrl() %>upload/news/thumb/<%= image.Name %>" alt="<%= image.Legend %>" title="<%= image.Legend %>" /></a>
						    <% } %>
						    </div>
						<%}%>
						<span class="date"><%= ((News)ViewData["newsDetail"]).PostedAt.ToShortDateString()%></span>
						<p>
						    <%= ((News)ViewData["newsDetail"]).Body.Replace("\n", "<br />")%>
						</p>
						<br class="clear"/>
						<% }else{ %>
						    <p>
							    Nenhuma notícia encontrada
						    </p>
						<% } %>
						<%= Html.ActionLink("Voltar", "index", "index", null, new { Class = "back" })%>
						
					</div>
					<!-- end:primary -->
					
					<!-- secondary -->
					<div id="secondary">
						<h3>Mais Notícias</h3>
						<% if (ViewData["otherNews"] != null){ %>
						<ul>
	                        <% foreach(News news in (News[])ViewData["otherNews"]) { %>
							<li>
								<span class="date"><%= news.PostedAt.ToShortDateString() %></span>
								<h5><%= Html.LinkTo(news.Title,"Default", "view", "news", new {id = news.Id})%></h5>
								<p><%= Html.LinkTo(Html.Truncate(news.Body, 130, "..."),"Default", "view", "news", new {id = news.Id})%></p>
							</li>
							<%} %>
						</ul>
						<%} %>
					</div>
					<!-- end:secondary -->
</asp:Content>
