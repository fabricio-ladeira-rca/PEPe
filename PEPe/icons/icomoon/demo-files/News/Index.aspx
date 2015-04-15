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
		    
            <% if(ViewData["highlights"] != null && ((News[])ViewData["highlights"]).Count() > 0){ %>
                <% foreach (News highlight in (News[])ViewData["highlights"]){ %>
                    <div class="highlight"> 
                        <h2><%= Html.RouteLink(highlight.Title, "Default", new { Controller = "news", action = "view", id = highlight.Id })%></h2>
                        <% if (!string.IsNullOrEmpty(highlight.FirstImage)){ %>
                            <img src="<%= Html.RootUrl() %>upload/news/thumb/<%= highlight.FirstImage%>" width="80" class="left" />
                        <%} %>
                        <p>
                            <%= Html.RouteLink(Html.Truncate(highlight.Body, 135, "..."), "Default", new { Controller = "news", action = "view", id = highlight.Id })%>
                        </p>
                    </div>
                <%}%>
		    <%}%>		    
		    <br class="clear"/>
		    <% if(ViewData["otherNews"] != null && ((News[])ViewData["otherNews"]).Count() > 0){ %>
		        <ul class="other-news">
                <% foreach(News news in (News[])ViewData["otherNews"]){ %>
		            <li class="clearfix">
		                <span class="date"><%= news.PostedAt.ToShortDateString() %></span>
		                <div class="resume">
		                    <h2><%= Html.RouteLink(news.Title,"Default", new{Controller = "news", action = "view", id = news.Id}) %></h2>
                            <p>
                                <%= Html.RouteLink(Html.Truncate(news.Body, 150, "..."),"Default", new{Controller = "news", action = "view", id = news.Id}) %>
		                    </p>
		                </div>
		            </li>
		        <% } %>
		        </ul>
            <%} %>
		    
		</div>
		<!-- end:primary -->
</asp:Content>
