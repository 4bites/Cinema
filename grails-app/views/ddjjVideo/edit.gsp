

<%@ page import="cinema.DdjjVideo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ddjjVideo.label', default: 'DdjjVideo')}" />
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
            <g:hasErrors bean="${ddjjVideoInstance}">
            <div class="errors">
                <g:renderErrors bean="${ddjjVideoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${ddjjVideoInstance?.id}" />
                <g:hiddenField name="version" value="${ddjjVideoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="videoClub"><g:message code="ddjjVideo.videoClub.label" default="Video Club" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'videoClub', 'errors')}">
                                    <g:select name="videoClub.id" from="${cinema.VideoClub.list()}" optionKey="id" value="${ddjjVideoInstance?.videoClub?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fecha"><g:message code="ddjjVideo.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'fecha', 'errors')}">
                                    <g:datePicker name="fecha" precision="day" value="${ddjjVideoInstance?.fecha}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cantidadTotalVenta"><g:message code="ddjjVideo.cantidadTotalVenta.label" default="Cantidad Total Venta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'cantidadTotalVenta', 'errors')}">
                                    <g:textField name="cantidadTotalVenta" value="${fieldValue(bean: ddjjVideoInstance, field: 'cantidadTotalVenta')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="precioTotalVenta"><g:message code="ddjjVideo.precioTotalVenta.label" default="Precio Total Venta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'precioTotalVenta', 'errors')}">
                                    <g:textField name="precioTotalVenta" value="${fieldValue(bean: ddjjVideoInstance, field: 'precioTotalVenta')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gravamenTotalVenta"><g:message code="ddjjVideo.gravamenTotalVenta.label" default="Gravamen Total Venta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'gravamenTotalVenta', 'errors')}">
                                    <g:textField name="gravamenTotalVenta" value="${fieldValue(bean: ddjjVideoInstance, field: 'gravamenTotalVenta')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cantidadTotalAlquiler"><g:message code="ddjjVideo.cantidadTotalAlquiler.label" default="Cantidad Total Alquiler" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'cantidadTotalAlquiler', 'errors')}">
                                    <g:textField name="cantidadTotalAlquiler" value="${fieldValue(bean: ddjjVideoInstance, field: 'cantidadTotalAlquiler')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="precioTotalAlquiler"><g:message code="ddjjVideo.precioTotalAlquiler.label" default="Precio Total Alquiler" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'precioTotalAlquiler', 'errors')}">
                                    <g:textField name="precioTotalAlquiler" value="${fieldValue(bean: ddjjVideoInstance, field: 'precioTotalAlquiler')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gravamenTotalAlquiler"><g:message code="ddjjVideo.gravamenTotalAlquiler.label" default="Gravamen Total Alquiler" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'gravamenTotalAlquiler', 'errors')}">
                                    <g:textField name="gravamenTotalAlquiler" value="${fieldValue(bean: ddjjVideoInstance, field: 'gravamenTotalAlquiler')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="peliculas"><g:message code="ddjjVideo.peliculas.label" default="Peliculas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'peliculas', 'errors')}">
                                    <g:select name="peliculas" from="${cinema.Pelicula.list()}" multiple="yes" optionKey="id" size="5" value="${ddjjVideoInstance?.peliculas*.id}" />
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
