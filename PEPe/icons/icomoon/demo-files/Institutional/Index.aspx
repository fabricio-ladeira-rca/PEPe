<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Institucional
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Institucional</span></span>
					
					<!-- primary -->
					<div id="primary">
					    
						<h2 class="title">Consórcio Nascional Volare</h2>
						
						
						<img src="<%= Html.RootUrl() %>Content/imgs/others/volare.jpg" alt="Volare"/>
						
						<h3 class="subtitle">Uns ficam. Outros Volare.</h3>
						
						<p>
						    Pertencente à Marcopolo S.A, a Volare nasceu em 1998, em Caxias do Sul, a partir da demanda do mercado por um veículo ágil, seguro, econômico e confortável para o transporte coletivo de passageiros.						</p>						<p>						    Desde 2004, o Consórcio Nacional Volare vem oferecendo uma nova opção para facilitar a aquisição de miniônibus. A qualidade e a garantia são assinadas pela parceria entre Randon Consórcios e Volare. 						</p>
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
