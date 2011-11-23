
<%@ page import="cinema.Complejo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="complejo.list" default="Complejo List" /></title>
		<g:set var="entityName" value="${message(code: 'complejo.label', default: 'Complejo')}" />
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <g:render template="/shared/list" model="[domain:Complejo]" />
            </div>
        </div>
    </body>
</html>
