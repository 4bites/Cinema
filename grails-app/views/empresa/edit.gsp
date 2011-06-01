

<%@ page import="cinema.Empresa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
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
            <g:hasErrors bean="${empresaInstance}">
            <div class="errors">
                <g:renderErrors bean="${empresaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${empresaInstance?.id}" />
                <g:hiddenField name="version" value="${empresaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigo"><g:message code="empresa.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${fieldValue(bean: empresaInstance, field: 'codigo')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaInicioActividad"><g:message code="empresa.fechaInicioActividad.label" default="Fecha Inicio Actividad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'fechaInicioActividad', 'errors')}">
                                    <g:datePicker name="fechaInicioActividad" precision="day" value="${empresaInstance?.fechaInicioActividad}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaFinActividad"><g:message code="empresa.fechaFinActividad.label" default="Fecha Fin Actividad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'fechaFinActividad', 'errors')}">
                                    <g:datePicker name="fechaFinActividad" precision="day" value="${empresaInstance?.fechaFinActividad}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaUltimaRevalida"><g:message code="empresa.fechaUltimaRevalida.label" default="Fecha Ultima Revalida" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'fechaUltimaRevalida', 'errors')}">
                                    <g:datePicker name="fechaUltimaRevalida" precision="day" value="${empresaInstance?.fechaUltimaRevalida}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personaFisica"><g:message code="empresa.personaFisica.label" default="Persona Fisica" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'personaFisica', 'errors')}">
                                    <g:select name="personaFisica.id" from="${cinema.PersonaFisica.list()}" optionKey="id" value="${empresaInstance?.personaFisica?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personaJuridica"><g:message code="empresa.personaJuridica.label" default="Persona Juridica" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'personaJuridica', 'errors')}">
                                    <g:select name="personaJuridica.id" from="${cinema.PersonaJuridica.list()}" optionKey="id" value="${empresaInstance?.personaJuridica?.id}"  />
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
