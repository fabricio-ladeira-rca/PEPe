<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_volare_v1.Models" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Volare Consórcios - Manager - Assembléias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%= Html.ValidationSummary() %>

<% using (Html.BeginRouteForm("ManagerDefault", new { action = ViewData["actionPost"] }, FormMethod.Post, new { enctype = "multipart/form-data", Id = "assembly_form" })) { %>
    <%if (((Highlight)ViewData["assembly"]) != null)
      { %>
        <%= Html.Hidden("assembly.id")%>
    <%} %>
    
    <label>Data: <em>DD/MM/AAAA</label>
    <%= Html.TextBox("assembly.calendar", null, new { Class = "text-field date", Value = DateTime.Now.ToShortDateString() })%>

    <label>Hora: <em>hh:mm</em><label>
    <%= Html.TextBox("assembly.hour", null, new { Class = "text-field date", Value = DateTime.Now.ToShortTimeString()})%>
    
    
    <label>Vencimento: <em>DD</label>
    <%= Html.TextBox("assembly.DueDate", null, new { Class = "text-field min" })%>
    
    
    <input type="hidden" name="assembly.date" id="assembly_date"/>
    
    <input type="submit" class="submit" value="Salvar" />
<% } %>

<script type="text/javascript" src="<%= Html.RootUrl() %>Content/js/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#assembly_calendar").datepicker({ altField: '#assembly_calendar', altFormat: 'dd/mm/yy', dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'], monthNames: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'] });
        $("#assembly_form").submit(function() {
            $("#assembly_date").attr("value", $("#assembly_calendar").val() + " " + $("#assembly_hour").val());
        });
    });
</script>

</asp:Content>