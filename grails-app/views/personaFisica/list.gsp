
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
<!--                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="cuit" title="${message(code: 'personaFisica.cuit.label', default: 'Cuit')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'personaFisica.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="apellido" title="${message(code: 'personaFisica.apellido.label', default: 'Apellido')}" />
                        
                            <g:sortableColumn property="tipoDocumento" title="${message(code: 'personaFisica.tipoDocumento.label', default: 'Tipo Documento')}" />
                        
                            <g:sortableColumn property="numeroDocumento" title="${message(code: 'personaFisica.numeroDocumento.label', default: 'Numero Documento')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personaFisicaInstanceList}" status="i" var="personaFisicaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personaFisicaInstance.id}">${fieldValue(bean: personaFisicaInstance, field: "cuit")}</g:link></td>
                        
                            <td>${fieldValue(bean: personaFisicaInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: personaFisicaInstance, field: "apellido")}</td>
                        
                            <td>${fieldValue(bean: personaFisicaInstance, field: "tipoDocumento")}</td>
                        
                            <td>${fieldValue(bean: personaFisicaInstance, field: "numeroDocumento")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>-->
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personaFisicaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
