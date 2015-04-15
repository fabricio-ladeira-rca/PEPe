<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Cons�rcio Nacional - Simulador de cons�rcios
</asp:Content>

<asp:Content ID="institutionalContent" ContentPlaceHolderID="MainContent" runat="server">
                    <span class="breadcrumb"><%= Html.ActionLink("Home", "Index", "Index")%> | <span class="active">Simulador de Cons�rcios</span></span>
					
					<!-- primary -->
					<div id="primary">

						<h2 class="title">Simulador de cons�rcios</h2>
						<% if(TempData["error"] == null && TempData["message"] == null) {%>
						    <p>
						        Fa�a agora mesmo a simula��o do seu cons�rcio e veja como � f�cil adquirir um mini�nibus Volare. Com a simula��o, voc� pode visualizar o valor das parcelas e os prazos do cons�rcio que deseja adquirir.
						    </p>
						    <% using (Html.BeginRouteForm("Default", new { action = "Result" }, FormMethod.Post, null)) {%>
						        <div class="valor-parcela clearfix">
						            <p>
						                <input type="radio" name="valor" checked="checked"/> Valor da parcela
						            </p>
						            <label for="start">De:</label>
						            <input type="text" class="text-field" name="valorParcelaDe" value="0" alt="decimal"/>
						            <label for="end">At�:</label>
						            <input type="text" class="text-field" name="valorParcelaAte" value="0" alt="decimal"/>
						        </div>
						        <div class="valor-bem clearfix">
						            <p>
						                <input type="radio" name="valor" /> Valor do Bem
						            </p>
						            <label for="start">De:</label>
						            <input type="text" class="text-field" name="valorBemDe" value="0" alt="decimal"/>
						            <label for="end">At�:</label>
						            <input type="text" class="text-field" name="valorBemAte" value="0" alt="decimal"/>
						        </div>
						        <button type="submit" class="submit">Simular</button>
						        
						        <script type="text/javascript" src="<%= Html.RootUrl() %>Content/js/jquery.meio.mask.min.js" charset="utf-8" ></script>
						        <script type="text/javascript">
						            $(function() {
						                $("input.text-field").setMask();
						            })
						        </script>
						        
						    <% } %>
						<% }else{%>
						    <%= Html.Messages(TempData["message"], TempData["error"]) %>
						    <br />
						    <%= Html.LinkTo("Voltar", "Default", "index", "simulator", null, new { Class = "back" })%>
						<%} %>
					</div>
					<!-- end:primary -->
</asp:Content>
