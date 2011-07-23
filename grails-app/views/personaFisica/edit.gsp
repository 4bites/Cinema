

<%@ page import="cinema.PersonaFisica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaFisica.label', default: 'PersonaFisica')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        
        <script type="text/javascript" charset="utf-8">
            <g:render template="/js/prov-loc.js"/>

		var cuit = 	function(){
						$.getJSON("${createLink(controller:'personaFisica', action:'cuit')}",{sexo: $("select#sexo").val(), documento: $("#numeroDocumento").val()}, 
                    		function(j){
                        	$("#cuit").val(j.cuit)
                    		})
            	   	}

		$(function() {
			$("#cuitbot").click(cuit)
		})
		$("#create").click(cuit)
		
		
		</script>
		
    </head>
    <body>
        <div class="nav">
            <!--  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>-->
            <span class="menuButton"><g:link class="list" action="list">Listado de personas</g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="Crear nueva Persona Fisica" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Editar Persona Fisica: ${fieldValue(bean:personaFisicaInstance, field:'apellido' )} ,  ${fieldValue(bean:personaFisicaInstance, field:'nombre' )}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personaFisicaInstance}">
            <div class="errors">
                <g:renderErrors bean="${personaFisicaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${personaFisicaInstance?.id}" />
                <g:hiddenField name="version" value="${personaFisicaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cuit"><g:message code="personaFisica.cuit.label" default="Cuit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'cuit', 'errors')}">
                                    <g:textField name="cuit" value="${personaFisicaInstance?.cuit}" />
                                	<input type="button" id="cuitbot" value="Calcular" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="personaFisica.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${personaFisicaInstance?.nombre}" size="40"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="apellido"><g:message code="personaFisica.apellido.label" default="Apellido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'apellido', 'errors')}">
                                    <g:textField name="apellido" value="${personaFisicaInstance?.apellido}" size="40" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoDocumento"><g:message code="personaFisica.tipoDocumento.label" default="Tipo Documento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'tipoDocumento', 'errors')}">
                                    <g:select name="tipoDocumento" id="tipoDocumento"
							                       from="${cinema.DocumentType.list()}" 
                       								value="${personaFisicaInstance?.tipoDocumento}" 
                       							optionValue="name"/>
                                    <!--  <g:textField name="tipoDocumento" value="${personaFisicaInstance?.tipoDocumento}" /> -->
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="numeroDocumento"><g:message code="personaFisica.numeroDocumento.label" default="Numero Documento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'numeroDocumento', 'errors')}">
                                    <g:textField name="numeroDocumento" value="${fieldValue(bean: personaFisicaInstance, field: 'numeroDocumento')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sexo"><g:message code="personaFisica.sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'sexo', 'errors')}">
                                   <g:select name="sexo" from="${cinema.Gender.values()}" optionValue="name" value="${personaFisicaInstance?.sexo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="domicilio"><g:message code="personaFisica.domicilio.label" default="Domicilio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'domicilio', 'errors')}">
                                    <g:textField name="domicilio" value="${personaFisicaInstance?.domicilio}" size="80"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigoPostal"><g:message code="personaFisica.codigoPostal.label" default="Codigo Postal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'codigoPostal', 'errors')}">
                                    <g:textField name="codigoPostal" value="${personaFisicaInstance?.codigoPostal}"  size="8"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="provincia"><g:message code="personaFisica.provincia.label" default="Provincia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'provincia', 'errors')}">
                                    <g:select name="provincia.id" id="provincia.id" noSelection="${['0':'Seleccionar...']}"
                                              from="${cinema.Provincia.list()}" 
                                              value="${personaFisicaInstance?.provincia?.id}"
                                              optionValue="name" optionKey="id"/>
                                               </td>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="localidad"><g:message code="personaFisica.localidad.label" default="Localidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'localidad', 'errors')}">
                                    <g:select name="localidad.id" id="localidad.id" value="${personaFisicaInstance?.localidad?.id}" noSelection="${['0':'Seleccionar...']}"
											optionValue="name" optionKey="id" from="${personaFisicaInstance?.provincia?.localidades}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefono"><g:message code="personaFisica.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${personaFisicaInstance?.telefono}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="personaFisica.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${personaFisicaInstance?.email}" size="60"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="condicionIVA"><g:message code="personaFisica.condicionIVA.label" default="Condicion IVA" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'condicionIVA', 'errors')}">
                                    <g:select name="condicionIVA" id="condicionIVA" noSelection="${['0':'Seleccionar...']}"
                                              from="${['Inscripto','No Inscripto','Excento', 'Monotributo']}" 
                                              value="${personaFisicaInstance?.condicionIVA}"
                                              />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personasJuridicas"><g:message code="personaFisica.personasJuridicas.label" default="Personas Juridicas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'pFisicaPJuridicas', 'errors')}">
                                    <g:select name="personasJuridicas" from="${cinema.PersonaJuridica.list()}" multiple="yes" optionKey="id" size="5" value="${personaFisicaInstance?.pFisicaPJuridicas*.personaJuridica.id}" />
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
