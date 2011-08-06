
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
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'empresa.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="codigo" title="${message(code: 'empresa.codigo.label', default: 'Codigo')}" />
                        
                            <g:sortableColumn property="fechaInicioActividad" title="${message(code: 'empresa.fechaInicioActividad.label', default: 'Fecha Inicio Actividad')}" />
                        
                            <g:sortableColumn property="fechaFinActividad" title="${message(code: 'empresa.fechaFinActividad.label', default: 'Fecha Fin Actividad')}" />
                        
                            <g:sortableColumn property="fechaUltimaRevalida" title="${message(code: 'empresa.fechaUltimaRevalida.label', default: 'Fecha Ultima Revalida')}" />
                        
                            <th><g:message code="empresa.personaFisica.label" default="Persona Fisica" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${empresaInstanceList}" status="i" var="empresaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${empresaInstance.id}" mapping="empresa" params="[dom:params.dom]">${fieldValue(bean: empresaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: empresaInstance, field: "codigo")}</td>
                        
                            <td><g:formatDate date="${empresaInstance.fechaInicioActividad}" /></td>
                        
                            <td><g:formatDate date="${empresaInstance.fechaFinActividad}" /></td>
                        
                            <td><g:formatDate date="${empresaInstance.fechaUltimaRevalida}" /></td>
                        
                            <td>${fieldValue(bean: empresaInstance, field: "personaFisica")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${empresaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
