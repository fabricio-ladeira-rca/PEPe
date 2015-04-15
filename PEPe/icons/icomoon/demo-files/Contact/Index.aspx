<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional - Contato
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Contato</span></span>
					
					<!-- primary -->
					<div id="primary">
						<div class="central">
							<h2 class="title">Central de Relacionamento</h2>
							<p>
								<strong class="phone">0800 644 2724</strong>                                Entre em contato conosco através do "Fale Conosco" ou pelo telefone 0800 644 2724 (De segunda a sexta-feira, das 8h às 18h). 
							</p>
						</div>
						<div class="contact">
							<h2 class="title">Fale Conosco</h2>
							<p>    
							    <%= Html.LinkTo("Ainda não sou cliente","Default", "noClientForm", "contact",null,  new {Class="no-client"})%>
								<%= Html.LinkTo("Já sou cliente","Default", "clientForm", "contact",null,  new {Class="client"})%>
							</p>
						</div>
					</div>
					<!-- end:primary -->
					
					<!-- secondary -->
					<div id="secondary">
						<div class="faq">
							<h2 class="title">FAQ</h2>
							<p>
							    <%= Html.LinkTo("Você tem alguma dúvida sobre os nossos serviços? Aqui você encontra as respostas às perguntas mais frequentes recebidas por nossa Central de Relacionamento.", "Default", "index", "faq", null, null)%>								
							</p>	
						</div>
						<div class="ouvidoria">
							<h2 class="title">Ouvidoria</h2>
							<p>
							    <%= Html.LinkTo("Contamos com uma equipe qualificada e preparada para auxiliá-lo sempre que necessário e com o compromisso de atender as suas necessidades.", "Default", "contactUs", "contact", null) %>
							</p>
						</div>
					</div>
					
					<!-- end:secondary -->
</asp:Content>
