
<%@ page import="cinema.Pelicula" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pelicula.label', default: 'Pelicula')}" />
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
                            <td valign="top" class="name"><g:message code="pelicula.codigo.label" default="Codigo" /></td>
                            
                            <td valign="top" class="value">${peliculaInstance?.codigo}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pelicula.titulo.label" default="Titulo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: peliculaInstance, field: "titulo")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pelicula.fechaEstreno.label" default="Fecha de Estreno" /></td>

                            <td valign="top" class="value">${formatDate(date: peliculaInstance.fechaEstreno, format:'dd/MM/yyyy')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pelicula.distribuidor.label" default="Distribuidor" /></td>
                            
                            <td valign="top" class="value"><g:link mapping="empresa" params="[dom:'Distribuidor']" action="show" id="${peliculaInstance?.distribuidor?.id}">${peliculaInstance?.distribuidor?.desc()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pelicula.productor.label" default="Productor" /></td>
                            
                            <td valign="top" class="value"><g:link mapping="empresa" params="[dom:'Productor']" action="show" id="${peliculaInstance?.productor?.id}">${peliculaInstance?.productor?.desc()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${peliculaInstance?.id}" />
                    <span class="button"><g:link action="edit" id="${peliculaInstance?.id}">${message(code: 'default.button.edit.label', default: 'Edit')}</g:link></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
