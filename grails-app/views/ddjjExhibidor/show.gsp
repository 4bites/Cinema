
<%@ page import="cinema.DdjjExhibidor" %>
<%@ page import="cinema.DdjjExhibidorRegistry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ddjjExhibidor.label', default: 'DdjjExhibidor')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
		<script>
			$(document).ready(function() {
			//	$('#results').dataTable({ });
			});

		</script>		
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table id="results">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjExhibidor.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${ddjjExhibidorInstance?.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjExhibidor.fecha.label" default="Fecha" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${ddjjExhibidorInstance?.fecha}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjExhibidor.file.label" default="File" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ddjjExhibidorInstance, field: "file")}</td>
                            
                        </tr>
                    
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ddjjExhibidor.exhibidora.label" default="Exhibidora" /></td>
                            
                            <td valign="top" class="value"><g:link controller="exhibidor" action="show" id="${ddjjExhibidorInstance?.exhibidora?.id}">${ddjjExhibidorInstance?.exhibidora?.desc()}</g:link></td>
                            
                        </tr>
                    	<tr>
							<td valign="top" class="name" colspan="2">
								<table cellpadding="0" cellspacing="0" border="0" id="ddjjRegs">
								<thead>
									<tr>
									<g:each in="${DdjjExhibidorRegistry.show_columns()}" var="field">
										<th>${field.tokenize(".")[0].humanField()}</th>
									</g:each>
									</tr>
								</thead>
								<tbody>
								<g:each in="${ddjjExhibidorInstance?.ddjjExhibidorRegs}" var="reg">
									<tr>
                                    <g:each in="${DdjjExhibidorRegistry.show_columns()}" var="field">
                                        <td>${reg.getValueFrom(field)}</td>
                                    </g:each>
									</tr>
                                </g:each>
									
								</tbody>		
								</table>
							</td>
						</tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form action="edit">
                    <g:hiddenField name="id" value="${ddjjExhibidorInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
