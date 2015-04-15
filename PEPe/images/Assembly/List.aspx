<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_volare_v1.Models" %>
<%@ Import Namespace="randon_consorcios_volare_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare Consórcios - Manager - Assembléias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div id="actions" class="index">
		<ul>
			<li>
				<a href="<%= Html.RootUrl() %>manager/assembly/new">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/add.png" alt="add" height="16" width="16"/>
					Adicionar
				</a>
			</li>
		</ul>
	</div>

	<table class="adminlist">
	    <thead>
	        <tr>
	            <th>Mês</th>
	            <th>Ano</th>
				<th>Vencimento</th>
				<th>Assembléia</th>
				<th>Hora</th>
	            <th width="60" align="center">&nbsp;</th>
	        </tr>
	    </thead>
	    <% if(ViewData["assemblies"] != null) { %>
	    <% foreach(randon_consorcios_volare_v1.Models.Assembly assembly in (randon_consorcios_volare_v1.Models.Assembly[])ViewData["assemblies"]) { %>
	    <tr>
	        <td><strong><%= assembly.Date.ToString("MMMM").ToUpperInvariant()%></strong></td>
	        <td><%= assembly.Date.Year%></td>
		    <td><%= assembly.DueDate%></td>
		    <td><%= assembly.Date.Day%></td>
		    <td><%= assembly.Date.ToShortTimeString()%></td>
	        <td>
				<a href="<%= Html.RootUrl() %>manager/assembly/destroy/<%= assembly.Id %>" class="delete">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/del.png" alt="remove" height="16" width="16"/>
					Excluir
				</a>
			</td>
	    </tr>
	    <% } %>
	    <% } %>
	</table>
</asp:Content>