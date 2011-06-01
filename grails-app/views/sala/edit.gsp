
<%@ page import="cinema.Sala" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sala.label', default: 'Sala')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${salaInstance}">
            <div class="errors">
                <g:renderErrors bean="${salaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${salaInstance?.id}" />
                <g:hiddenField name="version" value="${salaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigo"><g:message code="sala.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${fieldValue(bean: salaInstance, field: 'codigo')}" size="11"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="sala.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${salaInstance?.nombre}" size="80"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="domicilio"><g:message code="sala.domicilio.label" default="Domicilio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'domicilio', 'errors')}">
                                    <g:textField name="domicilio" value="${salaInstance?.domicilio}" size="80"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigoPostal"><g:message code="sala.codigoPostal.label" default="Codigo Postal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'codigoPostal', 'errors')}">
                                    <g:textField name="codigoPostal" value="${salaInstance?.codigoPostal}" size="8"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="provincia"><g:message code="sala.provincia.label" default="Provincia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'provincia', 'errors')}">
                                   <g:select name="provincia.id" id="provincia.id" noSelection="${['0':'Seleccionar...']}"
                                              from="${cinema.Provincia.list()}" 
                                              value="${salaInstance?.provincia?.id}"
                                              optionValue="name" optionKey="id"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="localidad"><g:message code="sala.localidad.label" default="Localidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'localidad', 'errors')}">
                                    <g:select name="localidad.id" id="localidad.id" value="${salaInstance?.localidad?.id}" noSelection="${['0':'Seleccionar...']}"
											optionValue="name" optionKey="id" from="${salaInstance?.provincia?.localidades}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="sala.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${salaInstance?.email}" size="60"/>
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
                                    <g:select name="tipo" id="tipo" noSelection="${['0':'Seleccionar...']}"
                                              from="${['Comercial','No Comercial','Ambulante Comercial', 'Ambulante No Comercial']}" 
                                              value="${salaInstance?.tipo}"
                                              />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="frecuencia"><g:message code="sala.frecuencia.label" default="Frecuencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'frecuencia', 'errors')}">
                                   <g:select name="frecuencia" id="frecuencia" noSelection="${['0':'Seleccionar...']}"
                                              from="${['Anual',' Fines de semana','Verano e invierno', 'Ocasional']}" 
                                              value="${salaInstance?.frecuencia}"
                                              />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaRenovacion"><g:message code="sala.fechaRenovacion.label" default="Fecha de Renovacion de Certificado" /></label>
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
                                    <g:select name="sistemaProyeccion" id="sistemaProyeccion" noSelection="${['0':'Seleccionar...']}"
                                              from="${['35 mm','Digital','Digital 3D', 'DVD']}" 
                                              value="${salaInstance?.sistemaProyeccion}"
                                              />
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
                                  <label for="diasExhibicion"><g:message code="sala.diasExhibicion.label" default="Dias Exhibicion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'diasExhibicion', 'errors')}">
                                    
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
