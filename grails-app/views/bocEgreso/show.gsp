
<%@ page import="cinema.BocEgreso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bocEgreso.label', default: 'BocEgreso')}" />
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
                            <td valign="top" class="name"><g:message code="bocEgreso.tipo.label" default="Tipo" /></td>

                            <td valign="top" class="value">${bocEgresoInstance?.tipo}</td>

                        </tr>

 
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocEgreso.desde.label" default="Desde numero" /></td>
                            
                            <td valign="top" class="value">${bocEgresoInstance?.desde}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocEgreso.hasta.label" default="Hasta numero" /></td>
                            
                            <td valign="top" class="value">${bocEgresoInstance?.hasta}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocEgreso.serie.label" default="Serie" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bocEgresoInstance, field: "serie")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocEgreso.cantidad.label" default="Cantidad" /></td>
                            
                            <td valign="top" class="value">${bocEgresoInstance?.cantidad}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocEgreso.exhibidor.label" default="Exhibidor" /></td>
                            
                            <td valign="top" class="value"><g:link mapping="empresa" params="[dom:'Exhibidor']" action="show" id="${bocEgresoInstance?.exhibidor?.id}">${bocEgresoInstance?.exhibidor?.desc()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bocEgreso.fecha.label" default="Fecha " /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${bocEgresoInstance?.fecha}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form action="edit">
                    <g:hiddenField name="id" value="${bocEgresoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
