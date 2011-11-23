
<%@ page import="cinema.Boc" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'boc.label', default: 'Boc')}" />
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
                            <td valign="top" class="name"><g:message code="boc.desde.label" default="Desde número" /></td>
                            
                            <td valign="top" class="value">${bocInstance?.desde}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="boc.hasta.label" default="Hasta número" /></td>
                            
                            <td valign="top" class="value">${bocInstance?.hasta}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="boc.serie.label" default="Serie" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bocInstance, field: "serie")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="boc.cantidad.label" default="Cantidad" /></td>
                            
                            <td valign="top" class="value">${bocInstance?.cantidad}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="boc.exhibidor.label" default="Exhibidor" /></td>
                            
                            <td valign="top" class="value"><g:link mapping="empresa" params="[dom:'Exhibidor']" action="show" id="${bocInstance?.exhibidor?.id}">${bocInstance?.exhibidor?.desc()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="boc.fechaAlta.label" default="Fecha Alta" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${bocInstance?.fechaAlta}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
			<!--
            <div class="buttons">
                <g:form action="edit">
                    <g:hiddenField name="id" value="${bocInstance?.id}" />
					<g:if test="${bocInstance.exhibidor == null}">
                    <span class="button"><g:actionSubmit class="edit" action="entrega" value="Entrega" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="baja" value="Baja" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					</g:if>
					<g:else>
					<span class="button"><g:actionSubmit class="edit" action="devolucion" value="Devolucion" /></span>
					</g:else>
                </g:form>
            </div>
			-->
        </div>
    </body>
</html>
