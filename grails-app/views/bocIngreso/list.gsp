
<%@ page import="cinema.BocIngreso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bocIngreso.label', default: 'BocIngreso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'bocIngreso.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="desde" title="${message(code: 'bocIngreso.desde.label', default: 'Desde')}" />
                        
                            <g:sortableColumn property="hasta" title="${message(code: 'bocIngreso.hasta.label', default: 'Hasta')}" />
                        
                            <g:sortableColumn property="serie" title="${message(code: 'bocIngreso.serie.label', default: 'Serie')}" />
                        
                            <g:sortableColumn property="cantidad" title="${message(code: 'bocIngreso.cantidad.label', default: 'Cantidad')}" />
                        
                            <th><g:message code="bocIngreso.exhibidor.label" default="Exhibidor" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bocIngresoInstanceList}" status="i" var="bocIngresoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bocIngresoInstance.id}">${fieldValue(bean: bocIngresoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bocIngresoInstance, field: "desde")}</td>
                        
                            <td>${fieldValue(bean: bocIngresoInstance, field: "hasta")}</td>
                        
                            <td>${fieldValue(bean: bocIngresoInstance, field: "serie")}</td>
                        
                            <td>${fieldValue(bean: bocIngresoInstance, field: "cantidad")}</td>
                        
                            <td>${fieldValue(bean: bocIngresoInstance, field: "exhibidor")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bocIngresoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
