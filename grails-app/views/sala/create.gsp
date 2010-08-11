
<%@ page import="cinema.Sala" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sala.label', default: 'Sala')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${salaInstance}">
            <div class="errors">
                <g:renderErrors bean="${salaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo"><g:message code="sala.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${fieldValue(bean: salaInstance, field: 'codigo')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="sala.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${salaInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="domicilio"><g:message code="sala.domicilio.label" default="Domicilio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'domicilio', 'errors')}">
                                    <g:textField name="domicilio" value="${salaInstance?.domicilio}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigoPostal"><g:message code="sala.codigoPostal.label" default="Codigo Postal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'codigoPostal', 'errors')}">
                                    <g:textField name="codigoPostal" value="${salaInstance?.codigoPostal}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="provincia"><g:message code="sala.provincia.label" default="Provincia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'provincia', 'errors')}">
                                    <g:textField name="provincia" value="${salaInstance?.provincia}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="localidad"><g:message code="sala.localidad.label" default="Localidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'localidad', 'errors')}">
                                    <g:textField name="localidad" value="${salaInstance?.localidad}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="sala.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${salaInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaInicioActividad"><g:message code="sala.fechaInicioActividad.label" default="Fecha Inicio Actividad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'fechaInicioActividad', 'errors')}">
                                    <g:datePicker name="fechaInicioActividad" precision="day" value="${salaInstance?.fechaInicioActividad}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipo"><g:message code="sala.tipo.label" default="Tipo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'tipo', 'errors')}">
                                    <g:textField name="tipo" value="${salaInstance?.tipo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="frecuencia"><g:message code="sala.frecuencia.label" default="Frecuencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'frecuencia', 'errors')}">
                                    <g:textField name="frecuencia" value="${salaInstance?.frecuencia}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaRenovacion"><g:message code="sala.fechaRenovacion.label" default="Fecha Renovacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'fechaRenovacion', 'errors')}">
                                    <g:datePicker name="fechaRenovacion" precision="day" value="${salaInstance?.fechaRenovacion}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sistemaProyeccion"><g:message code="sala.sistemaProyeccion.label" default="Sistema Proyeccion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'sistemaProyeccion', 'errors')}">
                                    <g:textField name="sistemaProyeccion" value="${salaInstance?.sistemaProyeccion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="capacidad"><g:message code="sala.capacidad.label" default="Capacidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'capacidad', 'errors')}">
                                    <g:textField name="capacidad" value="${fieldValue(bean: salaInstance, field: 'capacidad')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exhibidor"><g:message code="sala.exhibidor.label" default="Exhibidor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'exhibidor', 'errors')}">
                                    <g:select name="exhibidor.id" from="${cinema.Exhibidor.list()}" optionKey="id" value="${salaInstance?.exhibidor?.id}"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diasExhibicion"><g:message code="sala.diasExhibicion.label" default="Dias Exhibicion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'diasExhibicion', 'errors')}">
				    <g:each in="${cinema.Dia.values()}">
                                        <g:checkBox name="diasExhibicion.id" value="${salaInstance?.diasExhibicion?.id}"/>${it.value} 
                                    </g:each>
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
