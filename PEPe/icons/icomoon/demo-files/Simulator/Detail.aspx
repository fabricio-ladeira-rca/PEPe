<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>
<%@ Import namespace = "randon_consorcios_volare_v1.DbServer" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Simulador de consórcios
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Serviços</span></span>
					
					<!-- primary -->
					<div id="primary">

						<h2 class="title">Simulador de consórcios</h2>
						<p>
						    <b>Detalhes de resultado para simulação:</b>
						</p>
						<p>
						    <b>Valor do bem:</b> R$: <%= Session["valorBem"] %> <br />
						    <b>Prazo do plano:</b> <%= Session["prazo"]%> <br />
						</p>
						
						<a href="javascript:void(0)" id="solicitar-visita">Solicite visita</a> <a href="javascript:void(0)" id="contato" class="off">Contato por e-mail</a>
						<br class="clear"/>
                        <div id="visita" class="clearfix">
                            
                            <% if (!string.IsNullOrEmpty((string)TempData["error"]) && ViewData["type"] == "visita"){ %>
					                <div class="error-message"><%= TempData["error"]%></div>
					        <% }else{ %>
					            <p>
                                    Agora que você já fez a simulação do consórcio que deseja adquirir, solicite a visita de um vendedor e esclareça todas as suas dúvidas. Basta preencher o formulário abaixo e enviar.
                                </p>     
					        <%} %>
                             <% using (Html.BeginRouteForm("Default", new { action = "SendContactRequeset" }, FormMethod.Post, null)){%>
                                
                                <label>Seu nome:</label>
                                <%= Html.TextBox("name", null, new{Class = "text-field name"}) %>
                                
                                <label>Seu e-mail:</label>
                                <%= Html.TextBox("email", null, new{Class = "text-field email"}) %>
                                
                                <label>Telefones para contato:</label>
                                <%= Html.TextBox("prefix", null, new{Class = "text-field prefix"}) %> <%= Html.TextBox("phone", null, new{Class = "text-field phone"}) %> <br />
                                <%= Html.TextBox("prefix2", null, new{Class = "text-field prefix"}) %> <%= Html.TextBox("phone2", null, new{Class = "text-field phone"}) %>
                                
                                <label>Endereço:</label>
                                <%= Html.TextBox("address", null, new{Class = "text-field address"}) %>
                                
                                <div class="state">
                                    <label>Estado</label>
                                    <select name="uf" class="select-field state" id="select-state">
                                        <option value="">Selecione</option>
                                        <% foreach (State state in (State[])ViewData["states"])
                                           { %>
                                            <option value="<%= state.Id %>"><%= state.Uf %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="city">
                                    <label>Cidade</label>
                                    <select name="city" class="select-field" id="select-city">
                                        <option value="">&nbsp;</option>
                                    </select>
                                </div>
                                <br class="clear"/>
                                
                                <%= Html.Hidden("valorBem", Session["valorBem"])%>
                                <%= Html.Hidden("prazo", Session["prazo"])%>
                                <%= Html.Hidden("type", "visita") %>
                                
                                <button type="submit" class="submit">Enviar</button>
                            <%} %>
						</div>
						
						<div id="contato-email" class="clearfix">
						    <% if (!string.IsNullOrEmpty((string)TempData["error"]) && ViewData["type"] == "email"){ %>
					            <div class="error-message"><%= TempData["error"]%></div>
					        <% }else{ %>
					            <p>
						            Você também pode receber todas as informações a respeito das nossas modalidades de consórcio via e-mail. Basta solicitar o contato com um dos nossos vendedores através do formulário abaixo.
						        </p>
					        <%} %>
						    
						    <% using (Html.BeginRouteForm("Default", new { action = "SendContactRequeset" }, FormMethod.Post, null)) {%>
	                            
						        <label>Seu nome:</label>
                                <%= Html.TextBox("name", null, new{Class = "text-field name"}) %>
                                
                                <label>Seu e-mail:</label>
                                <%= Html.TextBox("email", null, new{Class = "text-field email"}) %>
    						    
						        <label>Mensagem:</label>
						        <%= Html.TextArea("message", null, new{Class = "text-field message"}) %>
    						    
                                <%= Html.Hidden("valorBem", Session["valorBem"])%>
                                <%= Html.Hidden("prazo", Session["prazo"])%>
                                <%= Html.Hidden("type", "email") %>
    						    
						        <button type="submit" class="submit">Enviar</button>
						    <% } %>
						</div>
						<script type="text/javascript">
						    $(function() {
						        var state = $("#select-state");
						        var city = $("#select-city");

						        city.attr("disabled", true);

						        state.change(function(obj) {
						            state.attr("disabled", true);
						            city.empty().append("<option value=''>Aguarde...</option>").attr("disabled", true);
						            city.load("findCities", { id: state.val() }, function() {
						                state.find('option[value=""]').remove();
						                city.attr("disabled", false);
						                state.attr("disabled", false);
						            });
						        });

						        $("#solicitar-visita").click(function() {
						            $("#visita").show();
						            $("#contato-email").hide();
						            $("#contato").addClass("off");
						            $(this).removeClass("off");
						        });
						        $("#contato").click(function() {
						            $("#visita").hide();
						            $("#contato-email").show();
						            $("#solicitar-visita").addClass("off");
						            $(this).removeClass("off");
						        });
						        <% if (!string.IsNullOrEmpty((string)ViewData["type"]) && ViewData["type"] == "email"){ %>
					                $("#visita").hide();
					                $("#solicitar-visita").addClass("off");
					                $("#contato").removeClass("off");
					                $("#contato-email").show();
					                
					            <%} %>
						    });
						</script>
					</div>
					<!-- end:primary -->
</asp:Content>