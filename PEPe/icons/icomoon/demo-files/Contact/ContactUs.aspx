<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Contato
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Contato</span></span>
					
					<!-- primary -->
					<div id="primary">
						<h2 class="title">Ouvidoria</h2>
						<% if (ViewContext.TempData["notice"] == null && ViewContext.TempData["error"] == null){%>
						    <p>
						        A Ouvidoria do <strong>Consórcio Nacional Volare</strong> é mais um canal de atendimento que colocamos à disposição dos nossos clientes. Através dela, recebemos e encaminhamos de forma adequada as reclamações dos consorciados que não ficaram satisfeitos com as soluções apresentadas pela Central de Relacionamento ou por nossa rede de vendas. 
						    </p>
						    <p>
						        Nossa Ouvidoria é mais uma ferramenta de comunicação focada na busca pela melhoria na prestação de serviços e no alinhamento com as necessidades e demandas dos nossos clientes, porém não substitui os demais canais de comunicação do Consórcio Nacional Volare. 
						    </p>						    <div class="box notice">						        <strong>IMPORTANTE</strong>						        <p>						            Para fazer contato com a Ouvidoria, é necessário ter em mãos o número do protocolo de atendimento da Central de Relacionamento. Se a reclamação não tiver sido registrada na Central de Relacionamento, será encaminhada primeiramente para esta área, que empreenderá todos os esforços na busca pela solução adequada. A Ouvidoria é a instância final para a resolução de problemas.						        </p>						    </div>						    <p>						        <a href="javascript:void(0)" id="ouvidoria">Entrar em contato com a Ouvidoria do Consórcio Nacional Volare</a>						    </p>
						<% } %>
						<div id="contact-options" style="display:none;">
						    <p>
						        <strong>1. Mensagem por e-mail</strong>
						    </p>		
    						
						    <% if (ViewContext.TempData["notice"] != null){%>
						        <div class="notice-message"><%= ViewContext.TempData["notice"]%></div>
				            <%}else{ %>
					        <% using (Html.BeginRouteForm("Default", new { action = "SendEmailToContactUs" }, FormMethod.Post, null)) {%>
					                <% if (ViewContext.TempData["error"] != null){ %>
					                    <div class="error-message"><%= ViewContext.TempData["error"]%></div>
					                <% } %>
						            <p class="nome">
						                <label for="name">*Nome:</label>
						                <%= Html.TextBox("name", null, new{Class = "text-field"}) %>
					                </p>
        						    
					                <p class="email">
						                <label for="email">*E-mail:</label>
						                <%= Html.TextBox("email", null, new{Class = "text-field"}) %>
					                </p>
        						    
					                <p class="protocolo">
						                <label for="protocol-number">*Número de protocolo:</label>
						                <%= Html.TextBox("protocol", null, new{Class = "text-field"}) %>
					                </p>
        						    
        						    
						            <p class="mensagem">
						                <label for="message">*Mensagem:</label>
						                <%= Html.TextArea("message", null, new{Class="text-field"}) %>
					                </p>
    						   
						        <button class="submit enviar" type="submit">Enviar</button>
				            <% } %>
				            <% } %>
				            <br class="clear"/>
                           <p>
                                <strong>2. Por correspondência impressa, enviada por fax (54-3209.2722) ou para o endereço abaixo:</strong>
                           </p>
                           <p>
                                Consórcio Nacional Volare <br />
                                Rua Atílio Andreazza, 3480<br />
                                Bairro Interlagos<br />
                                Caxias do Sul - RS<br />
                                CEP 95052-070 
                           </p>
                           <p>
                                <strong>3. Pelo telefone:</strong> 0800 703 0404                            </p>                           <p>                                O atendimento funciona nos dias úteis, de segunda a sexta-feira, em horário comercial. O prazo máximo para o retorno de sua solicitação é de até 15 dias.
                           </p>
                       </div>
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
							<% foreach(News news in (News[])ViewData["latestNews"]) { %>
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
