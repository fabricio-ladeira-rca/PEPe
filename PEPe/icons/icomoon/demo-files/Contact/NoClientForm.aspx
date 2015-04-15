<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>
<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Contato
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <%= Html.LinkTo("Contato", "Default", "index", "contact", null)%> | <span class="active">Ainda não sou cliente</span></span>
					
					<!-- primary -->
					<div id="primary">
					    
						<h2 class="title">Fale Conosco</h2>
						<% if (ViewContext.TempData["notice"] != null){%>
						    <div class="notice-message"><%= ViewContext.TempData["notice"]%></div>
				        <%}else{ %>
				            <p>
							    Interessado em adquirir um produto Volare? Entre em contato conosco e esclareça suas dúvidas!
						    </p>
					        <% using (Html.BeginRouteForm("Default", new { action = "SendEmailToNoClientForm" }, FormMethod.Post, null)){ %>
                                <% if (ViewContext.TempData["error"] != null)
                                   { %>
					                <div class="error-message"><%= ViewContext.TempData["error"]%></div>
					            <% } %>
					            <p class="nome">
						            <label for="name">*Nome:</label>
						            <%= Html.TextBox("name", null, new { Class = "text-field" })%>    
					            </p>
    						    
					            <p class="email">
						            <label for="email">*E-mail:</label>
						            <%= Html.TextBox("email", null, new { Class = "text-field" })%>
					            </p>
    						    
					            <p class="telefone">
						            <label for="phone">*Telefone:</label>
						            <%= Html.TextBox("phone", null, new { Class = "text-field" })%>
					            </p>
    						    
					            <p class="assunto">
						            <label for="subject">*Assunto:</label>
						            <%= Html.TextBox("subject", null, new { Class = "text-field" })%>
					            </p>
        						
						        <p class="mensagem">
						            <label for="message">*Mensagem:</label>
						            <% Html.TextArea("message", null, new { Class = "text-field" });%>
						            <textarea name="message" class="text-field"></textarea>
					            </p>
						   
					            <button class="submit enviar" type="submit">Enviar</button>
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
							<% foreach (News news in (News[])ViewData["latestNews"]) { %>
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
