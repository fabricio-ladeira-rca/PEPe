<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" ValidateRequest="false" %>
<%@ Import Namespace="W3.Helper" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>


<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Manager - Enquetes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Poll poll = (Poll)ViewData["poll"]; %>
    <table class="adminlist result">
        <caption><strong><%= poll.Question %></strong></caption>
	    <thead>
	        <tr>
	            <th>Resposta</th>
	            <th width="30%">Votação</th>
	            <th width="10%">Total de Votos</th>
	        </tr>
	    </thead>
	    <% foreach (PollAnswer answer in poll.Answers){ %>
	    <tr>
	        <td><%= answer.Description %></td>
	        <td><div class="bar" style="width:<%= answer.AsPercent()*2 %>px"></div><p><%= answer.AsPercent() %>%</p></td>
	        <td><%= answer.Votes.Count() %></td>
	    </tr>
	    <% } %>
	</table>
</asp:Content>


