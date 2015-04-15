<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
        Randon Consórcios - Manager - Revendas - (cadastro de currículos)
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%= Html.ValidationSummary() %>


<% using (Html.BeginRouteForm("ManagerDefault", new { action = ViewData["actionPost"] }, FormMethod.Post, new { enctype = "multipart/form-data", Id = "news_form" })) { %>

    <%if (((Reseller)ViewData["reseller"]) != null){ %>
        <%= Html.Hidden("reseller.id")%>
    <%} %>
    
    
    <p>
        <label>Nome da Revenda:</label>
        <%= Html.TextBox("reseller.name", null, new { Class = "text-field" })%>
    </p>
    
    <p>
        <label>Email</label>
        <%= Html.TextBox("reseller.email", null, new { Class = "text-field" })%>
    </p>
    
    
    
    <label for="state">Estado</label>
    
    <select class="select-field" name="state.id" id="select-state">
        <option>Selecione...</option>
        <% foreach(State state in (State[])ViewData["states"]) { %>      
            <%if (((Reseller)ViewData["reseller"]) != null && ((Reseller)ViewData["reseller"]).City.State.Id == state.Id) { %>
                <option value="<%= state.Id %>" selected="select"><%= state.Name %></option>                
            <%} %>
            <option value="<%= state.Id %>"><%= state.Name %></option>
        <%} %>
    </select>
    
    
    <label for="city">Cidade</label>
    <select class="select-field" name="city.id" id="select-city">
        <option>&nbsp;</option>       
    </select>
    
    <input type="submit" class="submit" value="Salvar" />     
    
<% } %>

<script type="text/javascript">
    $(function() {
        var state = $("#select-state");
        var city = $("#select-city");

        city.attr("disabled", true);

        state.change(function(obj) {
            getCities();
        });
        
        
        function getCities(cityId) {
        state.attr("disabled", true);
        city.empty().append("<option value=''>Aguarde...</option>").attr("disabled", true);
        city.load(rootUrl + "manager/reseller/findCities", { id: state.val() }, function() {
            city.attr("disabled", false);
            state.attr("disabled", false);
            if (typeof (cityId) != undefined) {               
                $('#select-city option[value="'+ cityId+'"]')[0].setAttribute('selected',true);
            }

            });
        }
        <% if ((Reseller)ViewData["reseller"] != null) { %>
            getCities(<%= ((Reseller)ViewData["reseller"]).City.Id %>)
        <% } %>
        
    });
   
</script>
</asp:Content>