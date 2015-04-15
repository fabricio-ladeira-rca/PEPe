<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - Revendas - (cadastro de currículos)
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div id="actions" class="index">
		<ul>
			<li>
				<a href="<%= Html.RootUrl() %>manager/reseller/new">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/add.png" alt="add" height="16" width="16"/>
					Adicionar
				</a>
			</li>
		</ul>
	</div>

	<table class="adminlist">
	    <thead>
	        <tr>
	            <th>Nome</th>
	            <th>Email</th>
	            <th>Cidade</th>
	            <th>Estado</th>
	            <th width="60" align="center">&nbsp;</th>
	        </tr>
	    </thead>
	    <% if(ViewData["resellers"] != null) { %>
	    <% foreach(Reseller reseller in (Reseller[])ViewData["resellers"]) { %>
	    <tr>
	        <td><%= reseller.Name %></td>
	        <td><%= reseller.Email %></td>
	        <td><%= reseller.City.Name %></td>
	        <td><%= reseller.City.State.Name %></td>
	        <td>
	            <a href="<%= Html.RootUrl() %>manager/reseller/edit/<%= reseller.Id %>" class="edit">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/edit.png" alt="edit" height="16" width="16"/>
					Editar
				</a>
				<br />
				<a href="<%= Html.RootUrl() %>manager/reseller/destroy/<%= reseller.Id %>" class="delete">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/del.png" alt="remove" height="16" width="16"/>
					Excluir
				</a>
			</td>
	    </tr>
	    <% } %>
	    <% } %>
	</table>
</asp:Content>