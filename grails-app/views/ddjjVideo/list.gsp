
<%@ page import="cinema.DdjjVideo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ddjjVideo.label', default: 'DdjjVideo')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'ddjjVideo.id.label', default: 'Id')}" />
                        
                            <th><g:message code="ddjjVideo.videoClub.label" default="Video Club" /></th>
                        
                            <g:sortableColumn property="periodo" title="${message(code: 'ddjjVideo.periodo.label', default: 'Periodo')}" />
                        
                            <g:sortableColumn property="cantidadTotalVenta" title="${message(code: 'ddjjVideo.cantidadTotalVenta.label', default: 'Cantidad Total Venta')}" />
                        
                            <g:sortableColumn property="precioTotalVenta" title="${message(code: 'ddjjVideo.precioTotalVenta.label', default: 'Precio Total Venta')}" />
                        
                            <g:sortableColumn property="gravamenTotalVenta" title="${message(code: 'ddjjVideo.gravamenTotalVenta.label', default: 'Gravamen Total Venta')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ddjjVideoInstanceList}" status="i" var="ddjjVideoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ddjjVideoInstance.id}">${fieldValue(bean: ddjjVideoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ddjjVideoInstance, field: "videoClub")}</td>
                        
                            <td>${ddjjVideoInstance.periodo}</td>
                        
                            <td>${fieldValue(bean: ddjjVideoInstance, field: "cantidadTotalVenta")}</td>
                        
                            <td>${fieldValue(bean: ddjjVideoInstance, field: "precioTotalVenta")}</td>
                        
                            <td>${fieldValue(bean: ddjjVideoInstance, field: "gravamenTotalVenta")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ddjjVideoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
