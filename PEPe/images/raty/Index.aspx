<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_racon_v1.Models" %>
<%@ Import namespace = "randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Racon Consórcios - Perguntas Frequentes
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
                <div class="rightContent">					
					<div id="subNav">
					    <%= Html.LinkTo("Home", "Default", "index", "index", null, new { Class = "subNavHome hide-text" })%>
					    <span class="hidden"> | </span>
					    <%= Html.LinkTo(((randon_consorcios_racon_v1.Models.Section)ViewData["section"]).Name, "Racon", "index", "section", new { section = ((randon_consorcios_racon_v1.Models.Section)ViewData["section"]).Identification}, new { Class = "subNav" + ((randon_consorcios_racon_v1.Models.Section)ViewData["section"]).Identification + " hide-text" })%>
					    <span class="hidden"> | </span>
					    <span class="subNavFaq hide-text">Faq</span>
					</div>
					
					<p>
					    Você tem alguma dúvida sobre os nossos serviços? Aqui você encontra as respostas às perguntas mais frequentes recebedias por nossa Central de Relacionamento.
					</p>
					
					
					<%if (ViewData["faqs"] != null){ %>
						<ul class="questions">
						    <% int count = 1; %>
						    <% foreach(Faq faq in (Faq[])ViewData["faqs"]){%>
							<li <%if(count%2 == 0){ %>class="odd" <%} %>><a href="#f<%= faq.Id %>"><strong><%= count %> - </strong><%= faq.Question %></a></li>
							<% count++; %>
							<%}%>
						</ul>
						
						
						<dl class="answers">
						    <% count = 1; %>
						    <% foreach(Faq faq in (Faq[])ViewData["faqs"]){%>
							<dt><a name="f<%= faq.Id%>"><%= count %>- <%= faq.Question %></a></dt>
							<dd><%= faq.Answer.Replace("\n", "<br />") %></dd>
							<% count++; %>
							<%}%>
						</dl>
					<%}%>
				</div>
</asp:Content>