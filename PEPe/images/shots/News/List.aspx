<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - Notícias
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<div id="Div1" class="index">
		<ul>
			<li>
				<a href="<%= Html.RootUrl() %>manager/news/new">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/add.png" alt="add" height="16" width="16"/>
					Adicionar
				</a>
			</li>
		</ul>
	</div>
	
    <% using (Html.BeginRouteForm("ManagerDefault", new { action = ViewData["actionPost"] }, FormMethod.Post, new { enctype = "multipart/form-data", Id = "seach" })) { %>

        <div class="column left">
            <label>ID</label>
            <%= Html.TextBox("id", null, new { Class = "text-field", Value = ViewData["id"] })%>
        </div>
        
        <div class="column left">
            <label>Título</label>
            <%= Html.TextBox("title", null, new { Class = "text-field", Value = ViewData["title"] })%>
        </div>
        
        <br class="clear" />
        
        <input type="submit" class="submit" value="Pesquisar" />
        
        <br class="clear" />
        
    <% } %>	

	<table class="adminlist">
	    <thead>
	        <tr>
	            <th width="5%">Id</th>
	            <th>Título</th>
	            <th width="20%">Seção</th>
	            <th width="12%">Publicação</th>
	            <th width="60" align="center">&nbsp;</th>
	        </tr>
	    </thead>
	    <% if(ViewData["allNews"] != null) { %>
	    <% foreach(News news in (News[])ViewData["allNews"]) { %>
	    <tr>
	        <td style="text-align: center;"><%= news.Id %></td>
	        <td><%= news.Title %></td>
	        <td><%= news.Section != null ? news.Section.Name : "Todas" %></td>	        
	        <td style="text-align: center; white-space: nowrap"><%= news.PostedAt.ToString("dd/MM/yyyy HH:mm") %></td>
	        <td>
	            <a href="<%= Html.RootUrl() %>manager/news/edit/<%= news.Id %>" class="edit">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/edit.png" alt="edit" height="16" width="16"/>
					Editar
				</a>
				<a href="<%= Html.RootUrl() %>manager/news/destroy/<%= news.Id %>" class="delete">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/del.png" alt="remove" height="16" width="16"/>
					Excluir
				</a>
			</td>
	    </tr>
	    <% } %>
	    <% } %>
	</table>
</asp:Content>