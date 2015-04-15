<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - FAQ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div id="actions" class="index">
		<ul>
			<li>
				<a href="<%= Html.RootUrl() %>manager/faq/new">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/add.png" alt="add" height="16" width="16"/>
					Adicionar
				</a>
			</li>
		</ul>
	</div>

	<table class="adminlist">
	    <thead>
	        <tr>
	            <th width="30%">Pergunta</th>
	            <th>Resposta</th>
	            <th>Seção</th>
	            <th width="70" align="center">Criado em:</th>
	            <th width="60" align="center">&nbsp;</th>
	        </tr>
	    </thead>
	    <% if(ViewData["faqs"] != null) { %>
	    <% foreach(Faq faq in (Faq[])ViewData["faqs"]) { %>
	    <tr>
	        <td><%= faq.Question %></td>
	        <td><%= Html.Truncate(faq.Answer, 250, "...") %></td>
	        <td><%= faq.Section.Name %></td>
	        <td align="center"><%= faq.CreatedAt.ToShortDateString() %></td>
	        <td>
	            <a href="<%= Html.RootUrl() %>manager/faq/edit/<%= faq.Id %>" class="edit">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/edit.png" alt="edit" height="16" width="16"/>
					Editar
				</a>
				<br />
				<a href="<%= Html.RootUrl() %>manager/faq/destroy/<%= faq.Id %>" class="delete">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/del.png" alt="remove" height="16" width="16"/>
					Excluir
				</a>
			</td>
	    </tr>
	    <% } %>
	    <% } %>
	</table>
</asp:Content>