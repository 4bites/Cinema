
<%@ page import="cinema.Sala" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sala.label', default: 'Sala')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
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
                            <td valign="top" class="name"><g:message code="sala.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.codigo.label" default="Codigo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "codigo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.domicilio.label" default="Domicilio" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "domicilio")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.codigoPostal.label" default="Codigo Postal" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "codigoPostal")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.provincia.label" default="Provincia" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "provincia")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.localidad.label" default="Localidad" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "localidad")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.fechaInicioActividad.label" default="Fecha Inicio Actividad" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${salaInstance?.fechaInicioActividad}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.tipo.label" default="Tipo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "tipo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.frecuencia.label" default="Frecuencia" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "frecuencia")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.fechaRenovacion.label" default="Fecha de Renovacion de Certificado" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${salaInstance?.fechaRenovacion}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.sistemaProyeccion.label" default="Sistema Proyeccion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "sistemaProyeccion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.capacidad.label" default="Capacidad" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: salaInstance, field: "capacidad")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.diasExhibicion.label" default="Dias Exhibicion" /></td>
                            
                            <td valign="top" class="value">${salaInstance.diasExhibicion}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sala.exhibidor.label" default="Exhibidor" /></td>
                            
                            <td valign="top" class="value"><g:link controller="exhibidor" action="show" id="${salaInstance?.exhibidor?.id}">${salaInstance?.exhibidor?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${salaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
