
<%@ page import="cinema.PersonaFisica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaFisica.label', default: 'PersonaFisica')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <!-- <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>  -->
            <span class="menuButton"><g:link class="create" action="create">Crear Nueva Persona Fisica</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Listado de Personas Fisicas" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
				<g:render template="/shared/list" model="[domain:PersonaFisica]" />
            </div>
        </div>
    </body>
</html>
