
<%@ page import="cinema.Complejo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="complejo.list" default="Complejo List" /></title>
    </head>
    <body>
        <div class="nav">
          <gsec:hasBasicPermission action="create" target="complejo" )>
            <span class="menuButton"><gti:link class="create" action="create"><g:message code="complejo.new" default="New Complejo" /></gti:link></span>
          </gsec:hasBasicPermission>
        </div>
        <div class="body">
            <h1><g:message code="complejo.list" default="Complejo List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                         <g:sortableColumn property="id" title="Id" titleKey="complejo.id" />
                        
                         <g:sortableColumn property="codigo" title="Codigo" titleKey="complejo.codigo" />
                        
                         <g:sortableColumn property="denominacion" title="Denominacion" titleKey="complejo.denominacion" />
                        
                         <g:sortableColumn property="fechaApertura" title="Fecha Apertura" titleKey="complejo.fechaApertura" />
                        
                        <th><g:message code="action"/></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${complejoInstanceList}" status="i" var="complejoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><gti:link action="show" id="${complejoInstance.id}">${fieldValue(bean: complejoInstance, field: "id")}</gti:link></td>
                        
                            <td>${fieldValue(bean: complejoInstance, field: "codigo")}</td>
                        
                            <td>${fieldValue(bean: complejoInstance, field: "denominacion")}</td>
                        
                            <td><g:formatDate date="${complejoInstance.fechaApertura}" /></td>
                        
                           <td>
                             <gsec:hasBasicPermission target="complejo" action="show">
                                <gti:link action="show" id="${complejoInstance.id}"><img src="${resource(dir:'images/skin',file:'magnifier_left.png')}" /></gti:link>
                            </gsec:hasBasicPermission>
                            <gsec:hasBasicPermission target="complejo" action="edit">
                                <gti:link action="edit" id="${complejoInstance.id}"><img src="${resource(dir:'images/skin',file:'pencil.png')}" /></gti:link>
                            </gsec:hasBasicPermission>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${complejoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
