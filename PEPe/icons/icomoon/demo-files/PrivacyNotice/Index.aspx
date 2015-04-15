<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Política de Privacidade
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Política de Privacidade</span></span>
					
					<!-- primary -->
					<div id="primary">

						<h2 class="title">Política de Privacidade</h2>
						<p>
							O site do Consórcio Nacional Volare utiliza formulários de envio de informações, solicitações e também para os visitantes expressarem seus interesses sobre os nossos produtos e serviços. Estas informações e/ou solicitações poderão ser transmitidas para subsidiárias, sócios do negócio, bem como parceiros de negócios.
						</p>
						<p>
							A Randon Consórcios, administradora do Consórcio Nacional Volare, não dará, nem venderá a informação pessoal ou de identidade dos visitantes para terceiros.
						</p>
						<p>
							A Randon Consórcios manterá a confidencialidade e identidade de todas as informações pessoais deixadas pelos visitantes. Todas estas informações somente serão utilizadas para suportar o relacionamento da Randon Consórcios e seus Clientes e visitantes do site. 
						</p>
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
