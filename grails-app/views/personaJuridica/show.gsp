
<%@ page import="cinema.PersonaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaJuridica.label', default: 'PersonaJuridica')}" />
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
                            <td valign="top" class="name"><g:message code="personaJuridica.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.cuit.label" default="Cuit" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "cuit")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.razonSocial.label" default="Razon Social" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "razonSocial")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.tipoSociedad.label" default="Tipo Sociedad" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "tipoSociedad")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.domicilio.label" default="Domicilio" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "domicilio")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.codigoPostal.label" default="Codigo Postal" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "codigoPostal")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.provincia.label" default="Provincia" /></td>
                            
                            <td valign="top" class="value"><g:link controller="provincia" action="show" id="${personaJuridicaInstance?.provincia?.id}">${personaJuridicaInstance?.provincia?.name}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.localidad.label" default="Localidad" /></td>
                            
                            <td valign="top" class="value"><g:link controller="localidad" action="show" id="${personaJuridicaInstance?.localidad?.id}">${personaJuridicaInstance?.localidad?.name}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.telefono.label" default="Telefono" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "telefono")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.condicionIVA.label" default="Condicion IVA" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "condicionIVA")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.personas.label" default="Personas" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${personaJuridicaInstance.pJuridicaPFisicas}" var="p">
                                    <li><g:link controller="personaFisica" action="show" id="${p.personaFisica.id}">${p.personaFisica} ${p.cargo}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form action="edit">
                    <g:hiddenField name="id" value="${personaJuridicaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
