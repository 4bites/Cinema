

<%@ page import="cinema.Local" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'local.label', default: 'Local')}" />
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
            <g:hasErrors bean="${localInstance}">
            <div class="errors">
                <g:renderErrors bean="${localInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${localInstance?.id}" />
                <g:hiddenField name="version" value="${localInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigo"><g:message code="local.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${localInstance?.codigo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigoPostal"><g:message code="local.codigoPostal.label" default="Codigo Postal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'codigoPostal', 'errors')}">
                                    <g:textField name="codigoPostal" value="${localInstance?.codigoPostal}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="domicilio"><g:message code="local.domicilio.label" default="Domicilio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'domicilio', 'errors')}">
                                    <g:textField name="domicilio" value="${localInstance?.domicilio}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="local.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${localInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaApertura"><g:message code="local.fechaApertura.label" default="Fecha Apertura" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'fechaApertura', 'errors')}">
                                    <g:datePicker name="fechaApertura" precision="day" value="${localInstance?.fechaApertura}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="localidad"><g:message code="local.localidad.label" default="Localidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'localidad', 'errors')}">
                                    <g:select name="localidad.id" from="${cinema.Localidad.list()}" optionKey="id" value="${localInstance?.localidad?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="local.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${localInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="provincia"><g:message code="local.provincia.label" default="Provincia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'provincia', 'errors')}">
                                    <g:select name="provincia.id" from="${cinema.Provincia.list()}" optionKey="id" value="${localInstance?.provincia?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefono"><g:message code="local.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${localInstance?.telefono}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="video"><g:message code="local.video.label" default="Video" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'video', 'errors')}">
                                    <g:select name="video.id" from="${cinema.VideoClub.list()}" optionKey="id" value="${localInstance?.video?.id}"  />
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
