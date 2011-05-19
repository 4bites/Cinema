

<%@ page import="cinema.PersonaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaJuridica.label', default: 'PersonaJuridica')}" />
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
            <g:hasErrors bean="${personaJuridicaInstance}">
            <div class="errors">
                <g:renderErrors bean="${personaJuridicaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${personaJuridicaInstance?.id}" />
                <g:hiddenField name="version" value="${personaJuridicaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cuit"><g:message code="personaJuridica.cuit.label" default="Cuit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'cuit', 'errors')}">
                                    <g:textField name="cuit" value="${personaJuridicaInstance?.cuit}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="razonSocial"><g:message code="personaJuridica.razonSocial.label" default="Razon Social" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'razonSocial', 'errors')}">
                                    <g:textField name="razonSocial" value="${personaJuridicaInstance?.razonSocial}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoSociedad"><g:message code="personaJuridica.tipoSociedad.label" default="Tipo Sociedad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'tipoSociedad', 'errors')}">
                                    <g:textField name="tipoSociedad" value="${personaJuridicaInstance?.tipoSociedad}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="domicilio"><g:message code="personaJuridica.domicilio.label" default="Domicilio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'domicilio', 'errors')}">
                                    <g:textField name="domicilio" value="${personaJuridicaInstance?.domicilio}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigoPostal"><g:message code="personaJuridica.codigoPostal.label" default="Codigo Postal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'codigoPostal', 'errors')}">
                                    <g:textField name="codigoPostal" value="${personaJuridicaInstance?.codigoPostal}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="provincia"><g:message code="personaJuridica.provincia.label" default="Provincia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'provincia', 'errors')}">
                                    <g:select name="provincia.id" from="${cinema.Provincia.list()}" optionKey="id" value="${personaJuridicaInstance?.provincia?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="localidad"><g:message code="personaJuridica.localidad.label" default="Localidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'localidad', 'errors')}">
                                    <g:select name="localidad.id" from="${cinema.Localidad.list()}" optionKey="id" value="${personaJuridicaInstance?.localidad?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefono"><g:message code="personaJuridica.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${personaJuridicaInstance?.telefono}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="personaJuridica.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${personaJuridicaInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="condicionIVA"><g:message code="personaJuridica.condicionIVA.label" default="Condicion IVA" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'condicionIVA', 'errors')}">
                                    <g:textField name="condicionIVA" value="${personaJuridicaInstance?.condicionIVA}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personas"><g:message code="personaJuridica.personas.label" default="Personas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'personas', 'errors')}">
                                    
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
