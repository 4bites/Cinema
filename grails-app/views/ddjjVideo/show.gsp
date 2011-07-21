
<%@ page import="cinema.DdjjVideo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ddjjVideo.label', default: 'DdjjVideo')}" />
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
                            <td valign="top" class="name"><g:message code="ddjjVideo.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ddjjVideoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjVideo.videoClub.label" default="Video Club" /></td>
                            
                            <td valign="top" class="value"><g:link controller="videoClub" action="show" id="${ddjjVideoInstance?.videoClub?.id}">${ddjjVideoInstance?.videoClub?.desc()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjVideo.periodo.label" default="Periodo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:ddjjVideoInstance, field:"periodo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjVideo.cantidadTotalVenta.label" default="Cantidad Total Venta" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ddjjVideoInstance, field: "cantidadTotalVenta")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjVideo.precioTotalVenta.label" default="Precio Total Venta" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ddjjVideoInstance, field: "precioTotalVenta")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjVideo.gravamenTotalVenta.label" default="Gravamen Total Venta" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ddjjVideoInstance, field: "gravamenTotalVenta")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjVideo.cantidadTotalAlquiler.label" default="Cantidad Total Alquiler" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ddjjVideoInstance, field: "cantidadTotalAlquiler")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjVideo.precioTotalAlquiler.label" default="Precio Total Alquiler" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ddjjVideoInstance, field: "precioTotalAlquiler")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjVideo.gravamenTotalAlquiler.label" default="Gravamen Total Alquiler" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ddjjVideoInstance, field: "gravamenTotalAlquiler")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjVideo.peliculas.label" default="Peliculas" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${ddjjVideoInstance.peliculas}" var="p">
                                    <li><g:link controller="pelicula" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${ddjjVideoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
