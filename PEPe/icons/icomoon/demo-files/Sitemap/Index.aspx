<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>
<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Mapa do site
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Mapa do site</span></span>
					
					<!-- primary -->
					<div id="primary">

						<h2 class="title">Mapa do site</h2>
						
						<div class="sitemap">
						    <p>
							    <%= Html.ActionLink("Home", "Index", "Index")%>
						    </p>
						    <ul>
							    <li><p><%= Html.LinkTo("Institucional", "Default", "Index", "Institutional", null)%></p></li>
							    <li><p><%= Html.LinkTo("Perguntas Frequentes", "Default", "Index", "Faq", null)%></p></li>
							    <li><p><%= Html.LinkTo("Contato", "Default", "Index", "Contact", null)%></p></li>
							    <li><p><%= Html.LinkTo("Indique o site", "Default", "Index", "SendToAFriend", null)%></p></li>
							    <li><p><%= Html.LinkTo("Serviços", "Default", "Index", "Services", null)%></p></li>
							    <li><p><%= Html.LinkTo("Simulador de Consórcios", "Default", "Index", "Simulator", null)%></p></li>
							    <li><p><%= Html.LinkTo("Assemleias", "Default", "Index", "Assemblies", null)%></p></li>
							    <li><p><%= Html.LinkTo("Notícias", "Default", "Index", "News", null)%></p></li>
							    <li><p><%= Html.LinkTo("Enquetes", "Default", "Index", "Poll", null)%></p></li>
							    <li><p><%= Html.LinkTo("Sites Recomendados", "Default", "Index", "Links", null)%></p></li>
							    <li><p><%= Html.LinkTo("Sobre a Web TV", "Default", "Index", "WebTv", null)%></p></li>
						    </ul>
					</div>
						
					</div>
					<!-- end:primary -->
					
					<!-- secondary -->
					<div id="secondary">
						
						<!-- end:box-assembleias -->
						<div class="box">
						    <a href="<%= ConfigurationManager.AppSettings["www.estarcomvoce.com.br"] %>" rel="external">
					            <img src="<%= Html.RootUrl() %>Content/imgs/others/programa-estar-com-voce.jpg" alt="Programa de Relacionamento Estar com Você." />
					        </a>
						</div>
						
						<div class="box news">
							<h3 class="title">Notícias</h3>
							<% if(ViewData["latestNews"] != null) { %>
							<ul>
							<% foreach(News news in (News[])ViewData["latestNews"]) { %>
								<li>
									<span class="date"><%= news.PostedAt.ToShortDateString() %></span>
								<h5><%= Html.LinkTo(news.Title,"Default", "view", "news", new {id = news.Id})%></h5>
								<p><%= Html.LinkTo(Html.Truncate(news.Body, 130, "..."),"Default", "view", "news", new {id = news.Id})%></p>
								</li>
							<%} %>
							</ul>
							<%} %>
						</div>
					</div>
					<!-- end:secondary -->
</asp:Content>
