
<%@ page import="cinema.DdjjExhibidor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ddjjExhibidor.label', default: 'DdjjExhibidor')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'ddjjExhibidor.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="fecha" title="${message(code: 'ddjjExhibidor.fecha.label', default: 'Fecha')}" />
                        
                            <g:sortableColumn property="file" title="${message(code: 'ddjjExhibidor.file.label', default: 'File')}" />
                        
                            <th><g:message code="ddjjExhibidor.exhibidora.label" default="Exhibidora" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ddjjExhibidorInstanceList}" status="i" var="ddjjExhibidorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ddjjExhibidorInstance.id}">${fieldValue(bean: ddjjExhibidorInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${ddjjExhibidorInstance.fecha}" /></td>
                        
                            <td>${fieldValue(bean: ddjjExhibidorInstance, field: "file")}</td>
                        
                            <td>${fieldValue(bean: ddjjExhibidorInstance, field: "exhibidora")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ddjjExhibidorInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
