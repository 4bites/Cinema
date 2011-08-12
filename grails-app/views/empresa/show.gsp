
<%@ page import="cinema.Empresa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'empresa.label', default: params.dom)}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empresa.codigo.label" default="Codigo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empresaInstance, field: "codigo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empresa.fechaInicioActividad.label" default="Fecha Inicio Actividad" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${empresaInstance?.fechaInicioActividad}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empresa.fechaFinActividad.label" default="Fecha Fin Actividad" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${empresaInstance?.fechaFinActividad}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empresa.fechaUltimaRevalida.label" default="Fecha Ultima Revalida" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${empresaInstance?.fechaUltimaRevalida}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empresa.personaFisica.label" default="Persona Fisica" /></td>
                            
                            <td valign="top" class="value"><g:link controller="personaFisica" action="show" id="${empresaInstance?.personaFisica?.id}">${empresaInstance?.personaFisica?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empresa.personaJuridica.label" default="Persona Juridica" /></td>
                            
                            <td valign="top" class="value"><g:link controller="personaJuridica" action="show" id="${empresaInstance?.personaJuridica?.id}">${empresaInstance?.personaJuridica?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form mapping="empresa" params="[dom:entityName]" action="edit">
                    <g:hiddenField name="id" value="${empresaInstance?.id}" />
                    <span class="button"><g:submitButton class="edit" name="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
