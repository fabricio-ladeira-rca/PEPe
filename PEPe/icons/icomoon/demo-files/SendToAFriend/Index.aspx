<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Indique o site
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Indique o site</span></span>
					
					<!-- primary -->
					<div id="primary">
					    
						<h2 class="title">Indique este site</h2>
						<% if (ViewContext.TempData["notice"] != null) {%>
					        <div class="notice-message"><%= ViewContext.TempData["notice"]%></div>
			            <%}else{ %>
				            <p>
						        Encontrou as informações que procurava em nosso site? Então preencha os campos abaixo e o indique para seus amigos. 
						    </p>
    						
						    <% using (Html.BeginRouteForm("Default", new { action = "sendEmail" }, FormMethod.Post, null)) { %>
						        <% if (ViewContext.TempData["error"] != null) { %>
					                <div class="error-message"><%= ViewContext.TempData["error"]%></div>
					            <% } %>
						        <p class="nome">
						            <label for="name">* Seu nome:</label>
						            <%= Html.TextBox("name", null, new { Class = "text-field" })%>    
    						        
						        </p>
						        <p class="email">
						            <label for="email">* Seu e-mail:</label>
						            <%= Html.TextBox("email", null, new { Class = "text-field" })%>    
						        </p>
						        <p>
						            <strong>Indique para:</strong>
						        </p>
						        <p class="nome-indicado">
						            <label for="friend-name">* Nome:</label>
						            <%= Html.TextBox("friendName", null, new { Class = "text-field" })%>    
						        </p>
						        <p class="email-indicado">
						            <label for="friend-email">* E-mail:</label>
						            <%= Html.TextBox("friendEmail", null, new { Class = "text-field" })%>    
						        </p>
    						    
						        <p class="mensagem">
						            <label for="message">* Mensagem</label>
						            <%= Html.TextArea("message", null, new { Class = "text-field message" })%>    
						        </p>
						        <button class="submit enviar">Enviar</button>
						    <%} %>
                        <%} %>
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
