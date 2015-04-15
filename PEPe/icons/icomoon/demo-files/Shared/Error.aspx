<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare - Consórcio Nacional
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <strong>Ocorreu um erro na aplicação.</strong>
    </p>
	<p>
		Tente novamente mais tarde ou entre em contato com o administrador.
	</p>
</asp:Content>
