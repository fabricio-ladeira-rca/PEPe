<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>
<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Sobre a Web TV
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Sobre  a Web TV</span></span>
					
					<!-- primary -->
					<div id="primary">

						<h2 class="title">Sobre a Web TV</h2>
						<p>
							Todas as assembleias do Consórcio Nacional Volare são transmitidas ao vivo pela internet. Desta forma, garantimos a transparência e precisão dos sorteios. 
						</p>
						<p>
					        Para assistir às transmissões, você precisa ser consorciado e ter o Windows Media Player 9.0 ou superior no seu computador. Também é recomendado que sua conexão à internet seja de banda larga, com ADSL ou cabo.
					    </p>
					    <p>    
							<a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=1d224714-e238-4e45-8668-5166114010ca&DisplayLang=pt-br" rel="external">Clique aqui</a> para instalar o Windows Media Player em seu computador. 
						</p>
						
						<p class="webtv-link">
							Acesse WebTV
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
