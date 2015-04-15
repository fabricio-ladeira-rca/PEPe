<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" Culture="auto:pt-BR" UICulture="auto"%>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>


<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Assembleias
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Assembleias</span></span>
					
					<!-- primary -->
					<div id="primary">

						<h2 class="title">Assembleias</h2>
						<p>
							Acompanhe o calendário dos vencimentos e assembleias do Consórcio Nacional Volare
						</p>
						<table class="result">
							<thead>
								<tr>	
									<th>Mês</th>
									<th>Vencimento</th>
									<th>Assembleia</th>
									<th>Hora</th>
								</tr>
							</thead>
							<% 
                                System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("pt-BR");
                                System.Globalization.DateTimeFormatInfo dtfi = culture.DateTimeFormat;
                                System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("pt-BR");				    
							%>
							<tbody>
							    
							    <% if(ViewData["assemblies"] != null && ((Assembly[])ViewData["assemblies"]).Count() > 0){ %>
							        <%foreach(Assembly assembleia in (Assembly[])ViewData["assemblies"]){ %>
								    <tr>
									    <td><strong><%= Html.Captalize(assembleia.Date.ToString("MMMM"))%> <%= assembleia.Date.Year.ToString() %></strong></td>
									    <td><%= assembleia.DueDate %></td>
									    <td><%= assembleia.Date.Day %> <%= Html.Captalize(dtfi.GetAbbreviatedDayName(assembleia.Date.DayOfWeek)) %></td>
									    <td><%= assembleia.Date.ToShortTimeString() %></td>
								    </tr>
								    <% } %>
								<% } %>
							</tbody>
						</table>
						
						<a href="#" class="webtv">
							<img src="<%= Html.RootUrl() %>Content/imgs/others/webtv.jpg" alt="Acesse a WebTv" />
						</a>
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
