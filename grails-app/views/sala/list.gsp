
<%@ page import="cinema.Sala" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sala.label', default: 'Sala')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'sala.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="codigo" title="${message(code: 'sala.codigo.label', default: 'Codigo')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'sala.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="domicilio" title="${message(code: 'sala.domicilio.label', default: 'Domicilio')}" />
                        
                            <g:sortableColumn property="codigoPostal" title="${message(code: 'sala.codigoPostal.label', default: 'Codigo Postal')}" />
                        
                            <g:sortableColumn property="provincia" title="${message(code: 'sala.provincia.label', default: 'Provincia')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${salaInstanceList}" status="i" var="salaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${salaInstance.id}">${fieldValue(bean: salaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: salaInstance, field: "codigo")}</td>
                        
                            <td>${fieldValue(bean: salaInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: salaInstance, field: "domicilio")}</td>
                        
                            <td>${fieldValue(bean: salaInstance, field: "codigoPostal")}</td>
                        
                            <td>${fieldValue(bean: salaInstance, field: "provincia")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${salaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
