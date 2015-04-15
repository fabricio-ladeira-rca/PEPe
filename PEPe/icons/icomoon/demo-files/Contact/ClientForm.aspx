<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Contato
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <%= Html.LinkTo("Contato", "Default", "index", "contact", null)%> | <span class="active">Já Sou Cliente</span></span>
					
					<!-- primary -->
					<div id="primary">
					    
						<h2 class="title">Fale Conosco</h2>
						
						<% if (ViewContext.TempData["notice"] != null){%>
						    <div class="notice-message"><%= ViewContext.TempData["notice"]%></div>
				        <%}else{ %>
				            <p>
							    Preencha os dados solicitados abaixo.
						    </p>
					        <% using (Html.BeginRouteForm("Default", new { action = "SendEmailToClientForm" }, FormMethod.Post, null)){ %>
                                <% if (ViewContext.TempData["error"] != null)
                                   { %>
					                <div class="error-message"><%= ViewContext.TempData["error"]%></div>
					            <% } %>
						     
						        <label>Tipo de atendimento:</label>
                                <select name="tipo-cliente" id="tipo-cliente" class="select-field">
			                        <option>Selecione...</option>
			                        <option value="contato-pf" <% if (ViewData["tipo-cliente"] != null && ViewData["tipo-cliente"].ToString() == "contato-pf") { %> selected="selected" <% } %>>Pessoa física</option>
			                        <option value="contato-pj" <% if (ViewData["tipo-cliente"] != null && ViewData["tipo-cliente"].ToString() == "contato-pj") { %> selected="selected" <% } %>>Pessoa jurídica</option>  
		                        </select>
		                        <script type="text/javascript">
		                            $(function() {
		                                if(!$("input[name='birthdate']").val()){
		                                    $("input[name='birthdate']").mask("99/99/9999");
		                                }
		                                $("#contato-pf, #contato-pj").hide().find("input, textarea").attr("disabled", true);
		                                <% if (ViewData["tipo-cliente"] != null) { %>
		                                    $("#<%= ViewData["tipo-cliente"]  %>").show().find("input:disabled, textarea:disabled").removeAttr("disabled");
		                                <% } %>
		                                $("#tipo-cliente").change(function() {
		                                    if ($(this).val()) {
		                                        $("#contato-pf, #contato-pj").hide().find("input, textarea").attr("disabled", true);
		                                        $("#" + $(this).val()).show().find("input:disabled, textarea:disabled").removeAttr("disabled");
		                                    }
		                                });
		                            });
		                        </script>
		                        <div id="contato-pf">
						            <p class="field-group">
							            <label for="group">*Número do Grupo:</label>
							            <%= Html.TextBox("group", null, new{Class = "text-field"}) %>
    							        
						            </p>
            						
						            <p class="field-group">
							            <label for="quota">*Número da Cota:</label>
							            <%= Html.TextBox("quota", null, new{Class="text-field"}) %>
						            </p>
        						    
    						        <p class="field-group nome">
							            <label for="cpf">*Nome completo:</label>
							            <%= Html.TextBox("name", null, new{Class = "text-field"}) %>
						            </p>
						            
						            <p class="field-group nome">
							            <label for="cpf">*E-mail:</label>
							            <%= Html.TextBox("email", null, new{Class = "text-field"}) %>
						            </p>
        						    
						            <p class="field-group cpf-cnpj">
							            <label for="cpf">*CPF:</label>
							            <%= Html.TextBox("cpf-cnpj", null, new{Class = "text-field"}) %>
						            </p>
						            
						            <p class="rg">
							            <label for="rg">*RG:</label>
							            <%= Html.TextBox("rg", null, new{Class = "text-field"}) %>
						            </p>
						            
						            <p class="rg">
							            <label for="birthdate">*Data de Nascimento:</label>
							            <%= Html.TextBox("birthdate", null, new { Class = "text-field" })%>
						            </p>
						            
						            <p class="assunto">
						                <label for="subject">*Assunto</label>
						                <%= Html.TextBox("subject", null, new{Class = "text-field"}) %>
						            </p>
						            <p class="mensagem">
						                <label for="message">*Mensagem</label>
						                <%= Html.TextArea("message", null, new{Class = "text-field message"}) %>
						            </p>
						            <button class="submit" type="submit">Enviar</button>
						        </div>
						        <div id="contato-pj">
						            <p class="field-group">
							            <label for="group">*Número do Grupo:</label>
							            <%= Html.TextBox("group", null, new{Class = "text-field"}) %>
    							        
						            </p>
            						
						            <p class="field-group">
							            <label for="quota">*Número da Cota:</label>
							            <%= Html.TextBox("quota", null, new{Class="text-field"}) %>
						            </p>
        						    
    						        <p class="field-group nome">
							            <label for="cpf">*Nome completo:</label>
							            <%= Html.TextBox("name", null, new{Class = "text-field"}) %>
						            </p>
        						    
						            <p class="field-group cpf-cnpj">
							            <label for="cpf">*CNPJ:</label>
							            <%= Html.TextBox("cpf-cnpj", null, new{Class = "text-field"}) %>
						            </p>
            						
						            <p class="assunto">
						                <label for="subject">*Assunto</label>
						                <%= Html.TextBox("subject", null, new{Class = "text-field"}) %>
						            </p>
						            <p class="mensagem">
						                <label for="message">*Mensagem</label>
						                <%= Html.TextArea("message", null, new{Class = "text-field message"}) %>
						            </p>
						            <button class="submit" type="submit">Enviar</button>
						        </div>
				            <%} %>
				        <%} %>
				        
					</div>
					<!-- end:primary -->
					
					<!-- secondary -->
					<div id="secondary">
						
						<!-- end:box-assembleias -->
						<div class="box">
					         <a href="<%= ConfigurationManager.AppSettings["www.estarcomvoce.com.br"] %>" rel="external">
						        <img src="<%= Html.RootUrl() %>Content/imgs/others/programa-estar-com-voce.jpg" alt="Programa de Relacionamento Estar com Você." />
						    </a>
						</div>
						
						<div class="box news">
							<h3 class="title">Notícias</h3>
							<% if(ViewData["latestNews"] != null) { %>
							<ul>
							<% foreach (News news in (News[])ViewData["latestNews"]) { %>
								<li>
									<span class="date"><%= news.PostedAt.ToShortDateString() %></span>
								<h5><%= Html.LinkTo(news.Title,"Default", "view", "news", new {id = news.Id})%></h5>
								<p><%= Html.LinkTo(Html.Truncate(news.Body, 130, "..."),"Default", "view", "news", new {id = news.Id})%></p>
								</li>
							<%} %>
							</ul>
							<%} %>
						</div>
					</div>
					<!-- end:secondary -->
</asp:Content>
