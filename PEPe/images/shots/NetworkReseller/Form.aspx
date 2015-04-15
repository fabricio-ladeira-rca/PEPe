<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Manager.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Models" %>
<%@ Import Namespace="randon_consorcios_racon_v1.Helpers" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
        Randon Consórcios - Manager - Revendas - (cadastro de currículos)
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%= Html.ValidationSummary() %>


<% using (Html.BeginRouteForm("ManagerDefault", new { action = ViewData["actionPost"] }, FormMethod.Post, new { enctype = "multipart/form-data"})) { %>

    <%if (((NetworkReseller)ViewData["reseller"]) != null){ %>
        <%= Html.Hidden("reseller.id")%>
    <%} %>
    
    <p>
        <label>Nome:</label>
        <%= Html.TextBox("reseller.name", null, new { Class = "text-field" })%>
    </p>
    
    <p>
        <label>E-mails: <em>separados por vírgula</em></label>
        <%= Html.TextArea("reseller.email", null, new { Class = "text-field" })%>
    </p>
    
    <p>
        <label>E-mail para o simulador de consórcios: <em>somente um e-mail</em></label>
        <%= Html.TextBox("reseller.emailSimulator", null, new { Class = "text-field" })%>
    </p>
    
    <p>
        <label>Fone/Fax:</label>
        <%= Html.TextBox("reseller.phoneFax", null, new { Class = "text-field" })%>
    </p>
    
    <p>
        <label>Endereço:</label>
        <%= Html.TextBox("reseller.address", null, new { Class = "text-field" })%>
    </p>
    
    <p>
        <label>Bairro:</label>
        <%= Html.TextBox("reseller.neighborhood", null, new { Class = "text-field" })%>
    </p>
    
    
    <label for="state">Estado</label>
    
    <select class="select-field" name="state.id" id="select-state">
        <option>Selecione...</option>
        <% foreach(State state in (State[])ViewData["states"]) { %>      
            <%if (((NetworkReseller)ViewData["reseller"]) != null && ((NetworkReseller)ViewData["reseller"]).City.State.Id == state.Id) { %>
                <option value="<%= state.Id %>" selected="select"><%= state.Name %></option>                
            <%} %>
            <option value="<%= state.Id %>"><%= state.Name %></option>
        <%} %>
    </select>
    
    
    <label for="city">Cidade</label>
    <select class="select-field" name="city.id" id="select-city">
        <option>&nbsp;</option>       
    </select>
    
    <br />
    
    <label>Foto:</label>
    <input type="file" name="reseller.imageFile" size="50" class="file-field"/>
    <%= Html.Hidden("reseller.imageUrl") %>

    <br /><br />
    <% if (((NetworkReseller)ViewData["reseller"]) != null && !string.IsNullOrEmpty(((NetworkReseller)ViewData["reseller"]).ImageUrl)) { %>
    <img src="<%= Html.RootUrl() %>upload/reseller/<%= ((NetworkReseller)ViewData["reseller"]).ImageUrl %>" />
    <%} %>
    <br class="clear"/>
    
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
        city.load(rootUrl + "manager/networkReseller/findCities", { id: state.val() }, function() {
            city.attr("disabled", false);
            state.attr("disabled", false);
            
            if (cityId && typeof(cityId) != undefined) {
                $('#select-city option[value="'+ cityId+'"]')[0].setAttribute('selected',true);
            }

            });
        }
        <% if ((NetworkReseller)ViewData["reseller"] != null) { %>
            getCities(<%= ((NetworkReseller)ViewData["reseller"]).City.Id %>)
        <% } %>
        
    });
   
</script>
</asp:Content>