

<%@ page import="cinema.BocIngreso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bocIngreso.label', default: 'BocIngreso')}" />
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
            <g:hasErrors bean="${bocIngresoInstance}">
            <div class="errors">
                <g:renderErrors bean="${bocIngresoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${bocIngresoInstance?.id}" />
                <g:hiddenField name="version" value="${bocIngresoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="desde"><g:message code="bocIngreso.desde.label" default="Desde" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocIngresoInstance, field: 'desde', 'errors')}">
                                    <g:textField name="desde" value="${fieldValue(bean: bocIngresoInstance, field: 'desde')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="hasta"><g:message code="bocIngreso.hasta.label" default="Hasta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocIngresoInstance, field: 'hasta', 'errors')}">
                                    <g:textField name="hasta" value="${fieldValue(bean: bocIngresoInstance, field: 'hasta')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="serie"><g:message code="bocIngreso.serie.label" default="Serie" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocIngresoInstance, field: 'serie', 'errors')}">
                                    <g:textField name="serie" value="${bocIngresoInstance?.serie}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cantidad"><g:message code="bocIngreso.cantidad.label" default="Cantidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocIngresoInstance, field: 'cantidad', 'errors')}">
                                    <g:textField name="cantidad" value="${fieldValue(bean: bocIngresoInstance, field: 'cantidad')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="exhibidor"><g:message code="bocIngreso.exhibidor.label" default="Exhibidor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocIngresoInstance, field: 'exhibidor', 'errors')}">
                                    <g:select name="exhibidor.id" from="${cinema.Exhibidor.list()}" optionKey="id" value="${bocIngresoInstance?.exhibidor?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaAlta"><g:message code="bocIngreso.fechaAlta.label" default="Fecha Alta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocIngresoInstance, field: 'fechaAlta', 'errors')}">
                                    <g:datePicker name="fechaAlta" precision="day" value="${bocIngresoInstance?.fechaAlta}"  />
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
