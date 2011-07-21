

<%@ page import="cinema.Empresa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'empresa', default: params.dom)}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
		<script type="text/javascript" charset="utf-8">
			$.expr[':'].textEquals = function (a, i, m) {
            	return $(a).text().match("^" + m[3] + "$");
            };	
			$(document).ready(function() {
				 	autocomplete= {
                        source: function(request, response) {
                            $.ajax({
                                url: "${createLink(controller:'personaFisica', action:'autocomplete')}",
                                dataType: "json",
                                data: {
                                    name_startsWith: request.term
                                },
                                success: function(data) {
                                    response($.map(data, function(item) {
                                        return {
                                            label: item.nombre+" "+item.apellido+" cuit:"+item.cuit,
                                            value: item.nombre+" "+item.apellido+" cuit:"+item.cuit,
                                            title: item.cuit
                                        }
                                    }))
                                }
                            })
                        },
                        minLength: 2,
                        change: function(event, ui) {
							if ($(".ui-autocomplete li:textEquals('" + $(this).val() + "')").size() == 0){
                                $(this).val('');
							}
                        },
						select: function(event, ui) {
                            $('#personaJuridica').val('');
                        }
 
                    };
                    $("#personaFisica").autocomplete(autocomplete).live('keydown', function (e) {
                        var keyCode = e.keyCode || e.which;
                        if((keyCode == 9 || keyCode == 13) && ($(".ui-autocomplete li:textEquals('" + $(this).val() + "')").size() == 0)) {
                            $(this).val($(".ui-autocomplete li:visible:first").text());
                        }
                    });
					$("#personaJuridica").autocomplete({ source: function(request, response) {
                            $.ajax({
								url: "${createLink(controller:'personaJuridica', action:'autocomplete')}", 
								dataType: "json",
								data: {
                                    term: request.term
                                },
								success: function(data) {
                                    response($.map(data, function(item) {
                                        return {
                                            label: item.razonSocial+" cuit:"+item.cuit,
                                            value: item.razonSocial+" cuit:"+item.cuit,
                                            title: item.cuit
                                        }
                                    }))
                                }
							})
						},	
						minLength:2,
						select: function(event, ui) {
                	    	$('#personaFisica').val('');
                		}
					});

				$("#fechaInicioActividad").datepicker({dateFormat: 'dd/mm/yy'});
				$("#fechaFinActividad").datepicker({dateFormat: 'dd/mm/yy'});
				$("#fechaUltimaRevalida").datepicker({dateFormat: 'dd/mm/yy'});


			});
		</script>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.${params.action}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${empresaInstance}">
            <div class="errors">
                <g:renderErrors bean="${empresaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" mapping="empresa" params="[dom:entityName]">
				<g:if test="${empresaInstance?.id}">
                    <g:hiddenField name="id" value="${empresaInstance?.id}" />
                    <g:hiddenField name="version" value="${empresaInstance?.version}" />
                </g:if>

                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo"><g:message code="empresa.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${empresaInstance?.codigo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaInicioActividad"><g:message code="empresa.fechaInicioActividad.label" default="Fecha Inicio Actividad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'fechaInicioActividad', 'errors')}">
                                    <g:textField name="fechaInicioActividad" value="${formatDate(date:empresaInstance?.fechaInicioActividad, format:'dd/MM/yyyy')}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaFinActividad"><g:message code="empresa.fechaFinActividad.label" default="Fecha Fin Actividad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'fechaFinActividad', 'errors')}">
                                    <g:textField name="fechaFinActividad" value="${formatDate(date:empresaInstance?.fechaFinActividad, format:'dd/MM/yyyy')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaUltimaRevalida"><g:message code="empresa.fechaUltimaRevalida.label" default="Fecha Ultima Revalida" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'fechaUltimaRevalida', 'errors')}">
                                    <g:textField name="fechaUltimaRevalida" value="${formatDate(date:empresaInstance?.fechaUltimaRevalida, format:'dd/MM/yyyy')}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="personaFisica"><g:message code="empresa.personaFisica.label" default="Persona Fisica" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'personaFisica', 'errors')}">
                                    <g:textField name="personaFisica" value="${empresaInstance !=null && empresaInstance.personaFisica != null? empresaInstance.personaFisica.nombre+' '+empresaInstance.personaFisica.apellido+' cuit:'+empresaInstance.personaFisica.cuit:''}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="personaJuridica"><g:message code="empresa.personaJuridica.label" default="Persona Juridica" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'personaJuridica', 'errors')}">
                                    <g:textField name="personaJuridica" value="${empresaInstance !=null && empresaInstance.personaJuridica != null? empresaInstance?.personaJuridica?.razonSocial+' cuit:'+empresaInstance?.personaJuridica?.cuit:''}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Guardar')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
