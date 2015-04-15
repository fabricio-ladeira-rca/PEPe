<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - Notícias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div id="actions" class="index">
	    <a href="<%= Html.RootUrl() %>manager/news/list"><%= ((News)ViewData["news"]).Title %></a>
	    <br />
	    <br />
		<ul>
			<li>
				<a href="<%= Html.RootUrl() %>manager/newsImages/new/<%= ((News)ViewData["news"]).Id %>">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/add.png" alt="add" height="16" width="16"/>
					Adicionar
				</a>
			</li>
		</ul>
	</div>

	<table class="adminlist">
	    <thead>
	        <tr>
	            <th>Legenda</th>
	            <th width="20%">Nome do arquivo</th>
	            <th width="10%">&nbsp;</th>
	            <th width="10%" align="center">&nbsp;</th>
	        </tr>
	    </thead>
	    <% if(ViewData["images"] != null) { %>
	    <% foreach(NewsImage newsImage in (NewsImage[])ViewData["images"]) { %>
	    <tr>
	        <td><%= newsImage.Legend %></td>
	        <td><%= newsImage.Name %></td>
	        <td align="center"><a href="<%= Html.RootUrl() %>upload/news/<%= newsImage.Name %>" target="_blank">visualizar</a></td>
	        <td>
	            <a href="<%= Html.RootUrl() %>manager/newsImages/edit/<%= newsImage.Id %>" class="edit">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/edit.png" alt="edit" height="16" width="16"/>
					Editar
				</a>
				<a href="<%= Html.RootUrl() %>manager/newsImages/destroy/<%= newsImage.Id %>" class="delete">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/del.png" alt="remove" height="16" width="16"/>
					Excluir
				</a>
			</td>
	    </tr>
	    <% } %>
	    <% } %>
	</table>
</asp:Content>