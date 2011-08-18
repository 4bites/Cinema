
<%@ page import="cinema.BocIngreso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bocIngreso.label', default: 'BocIngreso')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocIngreso.desde.label" default="Desde número" /></td>
                            
                            <td valign="top" class="value">${bocIngresoInstance?.desde}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocIngreso.hasta.label" default="Hasta número" /></td>
                            
                            <td valign="top" class="value">${bocIngresoInstance?.hasta}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocIngreso.serie.label" default="Serie" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bocIngresoInstance, field: "serie")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocIngreso.cantidad.label" default="Cantidad" /></td>
                            
                            <td valign="top" class="value">${bocIngresoInstance?.cantidad}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocIngreso.exhibidor.label" default="Exhibidor" /></td>
                            
                            <td valign="top" class="value"><g:link mapping="empresa" params="[dom:'Exhibidor']" action="show" id="${bocIngresoInstance?.exhibidor?.id}">${bocIngresoInstance?.exhibidor?.desc()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocIngreso.fechaAlta.label" default="Fecha Alta" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${bocIngresoInstance?.fechaAlta}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form action="edit">
                    <g:hiddenField name="id" value="${bocIngresoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
