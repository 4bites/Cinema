
<%@ page import="cinema.Pelicula" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pelicula.label', default: 'Pelicula')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'pelicula.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="codigo" title="${message(code: 'pelicula.codigo.label', default: 'Codigo')}" />
                        
                            <g:sortableColumn property="titulo" title="${message(code: 'pelicula.titulo.label', default: 'Titulo')}" />
                        
                            <th><g:message code="pelicula.distribuidor.label" default="Distribuidor" /></th>
                        
                            <th><g:message code="pelicula.productor.label" default="Productor" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${peliculaInstanceList}" status="i" var="peliculaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${peliculaInstance.id}">${fieldValue(bean: peliculaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: peliculaInstance, field: "codigo")}</td>
                        
                            <td>${fieldValue(bean: peliculaInstance, field: "titulo")}</td>
                        
                            <td>${fieldValue(bean: peliculaInstance, field: "distribuidor")}</td>
                        
                            <td>${fieldValue(bean: peliculaInstance, field: "productor")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${peliculaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
