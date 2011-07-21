

<%@ page import="cinema.Pelicula" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pelicula.label', default: 'Pelicula')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${peliculaInstance}">
            <div class="errors">
                <g:renderErrors bean="${peliculaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${peliculaInstance?.id}" />
                <g:hiddenField name="version" value="${peliculaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigo"><g:message code="pelicula.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: peliculaInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${fieldValue(bean: peliculaInstance, field: 'codigo')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="titulo"><g:message code="pelicula.titulo.label" default="Titulo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: peliculaInstance, field: 'titulo', 'errors')}">
                                    <g:textField name="titulo" value="${peliculaInstance?.titulo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="distribuidor"><g:message code="pelicula.distribuidor.label" default="Distribuidor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: peliculaInstance, field: 'distribuidor', 'errors')}">
                                    <g:select name="distribuidor.id" from="${cinema.Distribuidor.list()}" optionKey="id" value="${peliculaInstance?.distribuidor?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="productor"><g:message code="pelicula.productor.label" default="Productor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: peliculaInstance, field: 'productor', 'errors')}">
                                    <g:select name="productor.id" from="${cinema.Productor.list()}" optionKey="id" value="${peliculaInstance?.productor?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
