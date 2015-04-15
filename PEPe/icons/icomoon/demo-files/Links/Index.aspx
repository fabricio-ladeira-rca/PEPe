<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>
<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Links recomendados
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Sites Recomendados</span></span>
					
					<!-- primary -->
					<div id="primary">

						<h2 class="title">Site Recomendados</h2>
						<p>
							Veja abaixo os sites que indicamos para que você possa conhecer melhor e esclarecer dúvidas a respeito de consórcios e da nossa empresa.
						</p>
						<ul class="links">
							<li class="clearfix">
								<a href="http://www.abac.org.br/" rel="external">
									<span class="image"><img src="<%= Html.RootUrl() %>Content/imgs/others/abac.jpg" alt="" /></span>
									Associação Brasileira de Administradora de Consórcios
								</a>
							</li>
							<li class="clearfix">
								<a href="http://www.bcb.gov.br/" rel="external">
									<span class="image"><img src="<%= Html.RootUrl() %>Content/imgs/others/banco-central.jpg" alt="" /></span>
									Banco Central do Brasil
								</a>
							</li>
							<li class="clearfix">
								<a href="http://www.randon.com.br" rel="external">
									<span class="image"><img src="<%= Html.RootUrl() %>Content/imgs/others/empresas-randon.jpg" alt="" /></span>
									Empresas Randon
								</a>
							</li>
							<li class="clearfix">
								<a href="http://www.volare.com.br/" rel="external">
									<span class="image"><img src="<%= Html.RootUrl() %>Content/imgs/others/logo-volare.jpg" alt="" /></span>
									Volare
								</a>
							</li>
							
						</ul>
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
