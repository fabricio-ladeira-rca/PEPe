<%@ Import namespace = "randon_consorcios_volare_v1.Models" %>
<%@ Import namespace = "randon_consorcios_volare_v1.Helpers" %>
<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" ContentType="application/xml" %><?xml version="1.0" encoding="UTF-8"?>
<root>
<% foreach(Highlight highlight in (Highlight[])ViewData["highlights"]) { %>
    <highlights>upload/highlight/<%= highlight.FileUrl %></highlights>
<%}%>
</root>