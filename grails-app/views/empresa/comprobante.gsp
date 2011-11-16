
<%@ page import="cinema.Empresa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" ></meta>
        <g:set var="entityName" value="${message(code: 'empresa.label', default: params.dom)}" />
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
                            <td valign="top" class="name"><g:message code="empresa.codigo.label" default="Codigo" /></td>
                            
                            <td valign="top" class="value">${empresaInstance?.codigo}</td>
                            
                        </tr>
 
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empresa.fechaInicioActividad.label" default="Fecha Inicio Actividad" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${empresaInstance?.fechaInicioActividad}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empresa.fechaFinActividad.label" default="Fecha Fin Actividad" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${empresaInstance?.fechaFinActividad}" /></td>
                            
                        </tr>
                    
						<g:if test="${empresaInstance?.personaJuridica}" >
                    	<tr>
							<td colspan=2>
								<g:applyLayout name="empty">
									<g:include action="show_mini" controller="personaJuridica" id="${empresaInstance?.personaJuridica?.id}" />
								</g:applyLayout>	
							</td>
						</tr>
						</g:if>
						<g:else>	
                        <tr class="prop">
				
                            <td valign="top" class="name"><g:message code="empresa.personaFisica.label" default="Persona Fisica" /></td>
                            
                            <td valign="top" class="value"><g:link controller="personaFisica" action="show" id="${empresaInstance?.personaFisica?.id}">${empresaInstance?.personaFisica?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    	</g:else>
                   
						 <tr class="prop">
                            <td valign="top" class="name"><g:message code="empresa.fechaUltimaRevalida.label" default="Fecha Ultima Revalida" /></td>

                            <td valign="top" class="value"><g:formatDate date="${empresaInstance?.fechaUltimaRevalida}" /></td>

                        </tr>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
