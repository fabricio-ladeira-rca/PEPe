<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>

<% foreach(City city in (City[])ViewData["cities"]){  %>
    <option value="<%= city.Name %>"><%= city.Name %></option>
<%} %>