
<%@ page import="cinema.Pago" %>
<%@ page import="cinema.PagoRegistry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pago.label', default: 'Pagos')}" />
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
                            <td valign="top" class="name"><g:message code="pago.fecha.label" default="Fecha" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${pagoInstance?.fecha}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="pago.file.label" default="File" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: pagoInstance, field: "file")}</td>
                            
                        </tr>
                    
                    	<tr>
							<td valign="top" class="name" colspan="2">
								<table cellpadding="0" cellspacing="0" border="0" id="ddjjRegs">
								<thead>
									<tr>
									<g:each in="${PagoRegistry.show_columns()}" var="field">
										<th>${field.tokenize(".")[0].humanField()}</th>
									</g:each>
									</tr>
								</thead>
								<tbody>
								<g:each in="${pagoInstance?.pagoRegs}" var="reg">
									<tr>
                                    <g:each in="${PagoRegistry.show_columns()}" var="field">
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
        </div>
    </body>
</html>
