<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>
<%@ Import namespace = "randon_consorcios_volare_v1.DbServer" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Cons�rcio Nacional - Simulador de cons�rcios
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Servi�os</span></span>
					
					<!-- primary -->
					<div id="primary">

						<h2 class="title">Simulador de cons�rcios</h2>
						<p>
							Resultado da simula��o:
						</p>
					    <table class="result">
						        <tr>
						            <th>Cr�dito</th>
						            <th>Parcela</th>
						            <th>Amortiza��o</th>
						            <th>Prazo</th>
						            <th>Detalhes</th>
						        </tr>
                            <% if(ViewData["tabelaPrecos"] != null && ((TabelaPrecos[])ViewData["tabelaPrecos"]).Length > 0){ %>
                                <% foreach(TabelaPrecos credito in (TabelaPrecos[])ViewData["tabelaPrecos"]){ %>                                    
                                <tr>
			                        <td><%= string.Format("{0:c}",credito.Credito) %></td>
			                        <td><%= string.Format("{0:c}",credito.ParcelaAmort) %></td>
			                        <td><%= credito.FormaAmort %></td>
			                        <td><%= credito.Prazo %></td>
			                        <td>
			                            <% using (Html.BeginRouteForm("Default", new { action = "Detail" }, FormMethod.Post, null)) {%>
			                                <input type="hidden" value="<%= string.Format("{0:c}",credito.Credito) %>" name="valorBem" />
			                                <input type="hidden" value="<%= credito.Prazo %>" name="prazo" />
			                                <button type="submit" class="submit details">Detalhes</button>
			                            <% } %>
			                        </td>
    			                </tr>
		    			        <%} %>
					        <%}else{ %>
					            <tr>
						            <td colspan="5">Para outras op��es de cr�ditos entrar em contato com a Franquia mais pr�xima</td>
						        </tr>
					        <%} %>
			            </table>
				        <%= Html.LinkTo("Fazer nova simula��o", "Default", "index", "simulator", null, new {Class = "new-simulation" })%>
					</div>
					<!-- end:primary -->
</asp:Content>