<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - Enquetes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div id="actions" class="index">
		<ul>
			<li>
				<a href="<%= Html.RootUrl() %>manager/poll/new">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/add.png" alt="add" height="16" width="16"/>
					Adicionar
				</a>
			</li>
		</ul>
	</div>

	<table class="adminlist">
	    <thead>
	        <tr>
	            <th>Seção</th>
	            <th>Título</th>
	            <th width="10%">Início</th>
	            <th width="10%">Encerramento</th>
	            <th width="7%">Número de Respostas</th>
				<th width="7%">Número de Votos</th>
				<th width="7%">&nbsp;</th>
	            <th width="60" align="center">&nbsp;</th>
	        </tr>
	    </thead>
	    <% if(ViewData["polls"] != null) { %>
	    <% foreach(Poll poll in (Poll[])ViewData["polls"]) { %>
	    <tr>
	        <td><%= poll.Section.Name %></td>
	        <td><%= poll.Question %></td>
	        <td align="center"><%= poll.StartAt.ToShortDateString() %></td>
	        <td align="center"><%= poll.EndAt.ToShortDateString() %></td>
	        <td align="center"><%= poll.Answers.Count %></td>
			<td align="center"><%= poll.TotalVotes() %></td>
			<td align="center"><%= Html.LinkTo("Resultado", "ManagerDefault", "result", "poll", new { id = poll.Id }, null)%></td>
	        <td>
	            <a href="<%= Html.RootUrl() %>manager/poll/edit/<%= poll.Id %>" class="edit">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/edit.png" alt="edit" height="16" width="16"/>
					Editar
				</a>
				<br />
				<a href="<%= Html.RootUrl() %>manager/poll/destroy/<%= poll.Id %>" class="delete">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/del.png" alt="remove" height="16" width="16"/>
					Excluir
				</a>
			</td>
	    </tr>
	    <% } %>
	    <% } %>
	</table>
</asp:Content>