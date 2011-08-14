
<%@ page import="cinema.Empresa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'empresa.label', default: params.dom)}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
				<g:render template="/shared/list" model='[mapping:"empresa", domain:grailsApplication.classLoader.loadClass("cinema.${params.dom}")]' />
                
            </div>
            <div class="paginateButtons">
                <g:paginate total="${empresaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
