<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - Destaques
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div id="actions" class="index">
		<ul>
			<li>
				<a href="<%= Html.RootUrl() %>manager/highlight/new">      
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
	            <th width="30%">Visualizar</th>
	            <th width="10%">Data</th>
	            <th width="60" align="center">&nbsp;</th>
	        </tr>
	    </thead>
	    <% if (ViewData["allHighlight"] != null)
        { %>
	    <% foreach (Highlight highlight in (Highlight[])ViewData["allHighlight"])
        { %>
	    <tr>
	        <td><%= highlight.Section != null ?  highlight.Section.Name : "Home" %></td>
	        <td><%= highlight.Title %></td>
			<td align="center">
			    <% if (highlight.IsFlash()){ %>
			        <div id="highlight<%= highlight.Id %>">
			            
			        </div>
			        <script type="text/javascript">
			            swfobject.embedSWF("<%= Html.RootUrl() %>upload/highlight/<%= highlight.FileUrl %>", "highlight<%= highlight.Id %>", "150", "60", "9");
			        </script>
			    <%} else{%>
			        <img src="<%= Html.RootUrl() %>upload/highlight/<%= highlight.FileUrl %>" width="150" alt="" />
			    <%} %>
			</td>
	        <td><%= highlight.CreatedAt.ToShortDateString() %></td>
	        <td>
	            <a href="<%= Html.RootUrl() %>manager/highlight/edit/<%= highlight.Id %>" class="edit">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/edit.png" alt="edit" height="16" width="16"/>
					Editar
				</a>
				<br />
				<a href="<%= Html.RootUrl() %>manager/highlight/destroy/<%= highlight.Id %>" class="delete">      
					<img src="<%= Html.RootUrl() %>Content/imgs/manager/buttons/del.png" alt="remove" height="16" width="16"/>
					Excluir
				</a>
			</td>
	    </tr>
	    <% } %>
	    <% } %>
	</table>
</asp:Content>  