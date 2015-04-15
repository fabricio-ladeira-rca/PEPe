<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Perguntas Frequentes
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Perguntas Frequentes</span></span>
					
					<!-- primary -->
					<div id="primary">
					    
						<h2 class="title">Você Sabia?</h2>
						
						<%if (ViewData["faqs"] != null){ %>
						<ul class="questions">
						    <% int count = 1; %>
						    <% foreach(Faq faq in (Faq[])ViewData["faqs"]){%>
							<li <%if(count%2 == 0){ %>class="odd" <%} %>><p><a href="#f<%= faq.Id %>"><strong><%= count %> - </strong><%= faq.Question %></a></p></li>
							<% count++; %>
							<%}%>
						</ul>
						
						
						<dl class="answers">
						    <% count = 1; %>
						    <% foreach(Faq faq in (Faq[])ViewData["faqs"]){%>
							<dt><p><a name="f<%= faq.Id%>"><%= count %>- <%= faq.Question %></a></p></dt>
							<dd><p><%= faq.Answer.Replace("\n", "<br />") %></p></dd>
							<% count++; %>
							<%}%>
						</dl>
					<%}%>
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
