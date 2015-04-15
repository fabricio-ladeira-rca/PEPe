<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_racon_v1.Helpers" %>
<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Randon Consórcios - Login
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <a href="#" id="client"><img src="<%= Html.RootUrl() %>Content/imgs/manager/logos/randon.gif" alt="WK" /></a>
    <a href="#" id="w3"><img src="<%= Html.RootUrl() %>Content/imgs/manager/logos/w3haus.gif" alt="W3haus" /></a>
    <br class="clear" />
    <div id="login-form">
        <ul class="breadcrumb"> 
            <li>Acesso Restrito&raquo;</li>
            <li class="active">Logar</li>
        </ul>
        <% using (Html.BeginForm("create", "userSession"))
		   { %>
			<%= Html.Hidden("returnTo", Request["returnTo"]) %>
            <label for="login_email">E-mail:</label>
            <input type="text" class="text-field" name="email" />
            <label for="login_password">Senha:</label>                        
            <input type="password" class="text-field" name="password" />
            <input type="submit" value="Entrar" class="submit"/>
            <br class="clear"/>
		<% } %>
    </div>
</asp:Content>