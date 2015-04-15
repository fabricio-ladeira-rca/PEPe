<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">

	<script type="text/javascript">
		$(function() {
			$('#flashContent').appendTo('#volare');
		});
	</script>

	<div id="flashContent" style="display:block;position:absolute;width:1010px;height:585px;left:50%;margin-left:-505px;top:33px;z-index:200;">
          <div style="color:#024694;border:1px solid #024694;position:relative;width:50px;float:right;right:5px;cursor:pointer" onclick="javascript:document.getElementById('flashContent').style.display='none';">Fechar|X</div>
          <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	      <tr>
		<td align="center" valign="middle">
 			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="1000" height="565" id="base_volare" align="middle">
			      <param name="movie" value="<%= Html.RootUrl() %>Content/swf/base_volare.swf" />
			      <param name="base" value="<%= Html.RootUrl() %>Content/swf/" />
			      <param name="quality" value="high" />
			      <param name="bgcolor" value="#ffffff" />
			      <param name="play" value="true" />
			      <param name="loop" value="true" />
			      <param name="wmode" value="window" />
			      <param name="scale" value="showall" />
			      <param name="menu" value="true" />
			      <param name="devicefont" value="false" />
			      <param name="salign" value="" />
			      <param name="allowScriptAccess" value="sameDomain" />
			      <!--[if !IE]>-->
			      <object type="application/x-shockwave-flash" data="<%= Html.RootUrl() %>Content/swf/base_volare.swf" width="1000" height="565">
			        <param name="movie" value="<%= Html.RootUrl() %>Content/swf/base_volare.swf" />
			        <param name="base" value="<%= Html.RootUrl() %>Content/swf/" />
			        <param name="quality" value="high" />
			        <param name="bgcolor" value="#ffffff" />
			        <param name="play" value="true" />
			        <param name="loop" value="true" />
			        <param name="wmode" value="window" />
			        <param name="scale" value="showall" />
			        <param name="menu" value="true" />
			        <param name="devicefont" value="false" />
			        <param name="salign" value="" />
			        <param name="allowScriptAccess" value="sameDomain" />
			        <!--<![endif]-->
			        <a href="http://www.adobe.com/go/getflash"> <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /> </a>
			        <!--[if !IE]>-->
		          </object>
			      <!--<![endif]-->
	          	</object>
                 </td>
	       </tr>
	  </table>
    </div>

                    <!-- flash -->
					<div id="highlight"></div>
					<script type="text/javascript">
					    var flashvars = { root_url: rootUrl, xml: "index/highLight", interval: '15000', bgColor: '#0065B3' };
					    var params;
					    swfobject.embedSWF(rootUrl + "Content/swf/player.swf?c=1", "highlight", "585", "240", "9.0.0", "swf/expressInstall.swf", flashvars, params);
					</script>
					<!-- end:flash -->
					
					<!-- primary -->
					<div id="primary">
						<!-- box-news -->
						<div id="box-news" class="clearfix">
							<h2 class="hide-text">Notícias</h2>
							
							<div class="box">
							    <% if (ViewData["lastNews"] != null){%>
								    <span class="data"><%= ((News)ViewData["lastNews"]).PostedAt.ToShortDateString() %></span>
								    <%if (!string.IsNullOrEmpty(((News)ViewData["lastNews"]).FirstImage)){%>
								        <img src="<%= Html.RootUrl() %>upload/news/thumb/<%=((News)ViewData["lastNews"]).FirstImage%>" width="184" />
								    <%}%>
								    <p><%= Html.LinkTo(((News)ViewData["lastNews"]).Title, "Default", "view", "news", new { id = ((News)ViewData["lastNews"]).Id }, null)%></p>
								    <%= Html.LinkTo("Continue lendo", "Default", "view", "news", new { id = ((News)ViewData["lastNews"]).Id }, new { Class = "hide-text continuar-lendo", title="Continue lendo esta notícia"})%>
							    <%}else{%>
							        <p>Nenhuma notícia encontrada</p>
							    <%}%>
								
							</div>
							<% if (ViewData["otherNews"] != null) { %>
							    <ul>
	                                <% foreach(News news in (News[])ViewData["otherNews"]) { %>
								        <li>
									        <span class="data"><%= news.PostedAt.ToShortDateString()%></span>
									        <p><%= Html.LinkTo(news.Title,"Default", "view", "news", new {id = news.Id})%></p>
								        </li>
								    <%}%>
							    </ul>
							<%}%>
						</div>
						<!-- end:box-news -->
						
						<!-- box-simulador -->
						<div id="box-simulador">
							<h2 class="hide-text">Simulador de Consórcios</h2>
							<p>Faça uma simulação e veja como é possível realizar o seu sonho.</p>
							<%= Html.LinkTo("Acessar", "Default", "index", "simulator", null, new { Class = "hide-text acessar"})%>
						</div>
						<!-- end:box-simulador -->
						
						<!-- box-btns -->
						<div id="box-btns">
							<p class="hide-text web-tv" title="Consórcio WEBTV">Consórcio WEBTV</p>
							<div class="links">  
							    <a href="http://www.abac.org.br/" class="hide-text abac" title="Link para o site da ABAC" rel="external">ABAC</a>
							    <a href="http://www.bcb.gov.br/" class="hide-text bc" title="Link para o site do Banco Central do Brasil" rel="external">Banco Central do Brasil</a>
							</div>
							
						</div>
						<!-- end:box-btns -->
						
					</div>
					<!-- end:primary -->
					
					<!-- secondary -->
					<div id="secondary">
					    <% if (ViewData["assembly"] != null){ %>
						<!-- box-assembleias -->
						<div id="box-assembleias" class="box">
							<h3 class="hide-text">Próxima Assembléia</h3>
							<span class="data"><%= ((Assembly)ViewData["assembly"]).Date.ToString("dd.MM.yyyy") %></span>
							<span class="hora">às <%= ((Assembly)ViewData["assembly"]).Date.ToShortTimeString() %></span>
							<p><%= Html.LinkTo("Veja o histórico das Assembleias on-line.", "Default", "index", "assemblies", null)%></p>
						</div>
						<!-- end:box-assembleias -->
						<% } %>
						
						<div class="box">
						    <a href="<%= ConfigurationManager.AppSettings["www.estarcomvoce.com.br"] %>" rel="external">
					            <img src="<%= Html.RootUrl() %>Content/imgs/others/programa-estar-com-voce.jpg" alt="Programa de Relacionamento Estar com Você." />
					        </a>
						</div>
						<div style="float:left;margin-top:20px;display:block;width:180px; height:135px; background: url(<%= Html.RootUrl() %>Content/imgs/others/GuiaDoConsorciado.jpg) no-repeat; text-indent:-999em; outline:none;cursor:pointer;" onclick="javascript:window.scrollTo(0,0);document.getElementById('flashContent').style.display='block';" ></div>

						<% if (ViewData["poll"] != null){%>
						<!-- box-enquete -->
						<div id="box-enquete">
							<h3 class="hide-text">Enquete</h3>
						    <% using (Html.BeginRouteForm("Default", new { controller = "poll", action = "result" }, FormMethod.Post, new { id = "form-enquete"})) { %>
						        <p><b><%=((Poll)ViewData["poll"]).Question%></b></p>
						        <input type="hidden" name="pollId" value="<%=((Poll)ViewData["poll"]).Id %>" />
						        <ul>
						            <% foreach (PollAnswer answer in ((Poll)ViewData["poll"]).Answers) {%>
							        <li><input type="radio" name="answerId"  value="<%= answer.Id %>" /> <%= answer.Description%></li>
							        <%}%>
						        </ul>
						        <button type="submit" class="hide-text votar">Votar</button>
						        <p><%= Html.LinkTo("Ver todas", "Default", "index", "poll", null)%>  as <b>enquetes</b></p>   
						    <%}%>
						</div>
						<!-- end:box-enquete -->
						<%}%>			
					</div>
					<!-- end:secondary -->
</asp:Content>