

<%@ page import="cinema.PersonaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaJuridica.label', default: 'PersonaJuridica')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
		<script type="text/javascript" charset="utf-8">
			<g:render template="/js/prov-loc.js"/>
				$.expr[':'].textEquals = function (a, i, m) {
  		  			return $(a).text().match("^" + m[3] + "$");
				};

			    $(document).ready(function() {
					var i = 1+${personaJuridicaInstance && personaJuridicaInstance.pJuridicaPFisicas?personaJuridicaInstance.pJuridicaPFisicas.size():'0'};
        		
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
            			} 
        		    };
					$("#pJuridicaPFisicas\\.personaFisica").autocomplete(autocomplete).live('keydown', function (e) {
				        var keyCode = e.keyCode || e.which;
        				if((keyCode == 9 || keyCode == 13) && ($(".ui-autocomplete li:textEquals('" + $(this).val() + "')").size() == 0)) {
            				$(this).val($(".ui-autocomplete li:visible:first").text());
        				}
    				});

					
                    $("#add").click(function() {
						var persona = '<p id="pf'+i+'"><label>Persona Fisica</label><input name="pJuridicaPFisicas.personaFisica" size="50"/>\
										<label>Cargo</label><input name="pJuridicaPFisicas.cargo" /><span class="button" id="remove'+i+'">\
										<input type="button" class="save" value="Remover" /></span></p>';
						$("#pfs").append( persona );
                        //newPf = $("#pfs > p:first-child").clone().attr('id', 'pf'+i).insertBefore("#pfs > p:last-child");
						$("#pf"+i+" input:first").autocomplete(autocomplete);
						$("#pf"+i+" input[type!='button']").val('');
						$("#remove"+i).click(function() {
                        	$(this).parent().remove();
                    	});
						i++;
                        return false;
                    });

					for(j=1;j<i;j++){
					  $("#remove"+j).click(function() {
                            $(this).parent().remove();
                      });
					  j++;
					}


				});

       </script> 
    </head>
    <body>
    
        <div class="body">
            <h1><g:message code="default.${personaJuridicaInstance?.id?'edit':'create'}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personaJuridicaInstance}">
				<div class="errors">
                <g:renderErrors bean="${personaJuridicaInstance}" as="list" />
				</div>
            </g:hasErrors>
			<g:if test="${personaJuridicaInstance.pJuridicaPFisicas.any{it.hasErrors()}}">
				<div class="errors">	
			<g:each in="${personaJuridicaInstance.pJuridicaPFisicas.findAll{it.hasErrors()}}" var="err">
				<g:renderErrors bean="${err}" as="list" />
			</g:each>	
				</div>	
			</g:if>
            <g:form action="save" method=get>
               <g:if test="${personaJuridicaInstance?.id}">
                    <g:hiddenField name="id" value="${personaJuridicaInstance?.id}" />
                    <g:hiddenField name="version" value="${personaJuridicaInstance?.version}" />
                </g:if>
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
                                    <g:textField name="razonSocial" value="${personaJuridicaInstance?.razonSocial}" size="80"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoSociedad"><g:message code="personaJuridica.tipoSociedad.label" default="Tipo Sociedad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'tipoSociedad', 'errors')}">
									<g:select name="tipoSociedad" id="tipoSociedad"
                                                   from="${cinema.SocietyType.values()}" 
                                                    value="${personaJuridicaInstance?.tipoSociedad}" 
                                                optionValue="name"/>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="domicilio"><g:message code="personaJuridica.domicilio.label" default="Domicilio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'domicilio', 'errors')}">
                                    <g:textField name="domicilio" value="${personaJuridicaInstance?.domicilio}" size="80"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigoPostal"><g:message code="personaJuridica.codigoPostal.label" default="Codigo Postal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'codigoPostal', 'errors')}">
                                    <g:textField name="codigoPostal" value="${personaJuridicaInstance?.codigoPostal}" size="8"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="provincia"><g:message code="personaJuridica.provincia.label" default="Provincia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'provincia', 'errors')}">
                                    <g:select name="provincia.id" id="provincia.id" from="${cinema.Provincia.list()}" 
										optionKey="id" value="${personaJuridicaInstance?.provincia?.id}"  
										noSelection="${['0':'Seleccionar...']}" optionValue="name"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="localidad"><g:message code="personaJuridica.localidad.label" default="Localidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'localidad', 'errors')}">
                                    <g:select name="localidad.id" id="localidad.id" optionKey="id" optionValue="name" 
										value="${personaJuridicaInstance?.localidad?.id}" from="${personaJuridicaInstance?.provincia?.localidades}" 
										noSelection="${['0':'Seleccionar...']}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefono"><g:message code="personaJuridica.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${personaJuridicaInstance?.telefono}" size="80"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="personaJuridica.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${personaJuridicaInstance?.email}" size="60"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="condicionIVA"><g:message code="personaJuridica.condicionIVA.label" default="Condicion IVA" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'condicionIVA', 'errors')}">
                                    <g:select name="condicionIVA" id="condicionIVA" noSelection="${['0':'Seleccionar...']}"
                                              from="${['Inscripto','No Inscripto','Excento', 'Monotributo']}" 
                                              value="${personaJuridicaInstance?.condicionIVA}"
                                              />
  
                                </td>
                            </tr>
                      		<tr class="prop">
								<td valign="top" class="name" colspan=2>Personas Fisicas</td>
							</tr>  
							<tr class="prop">
                                <td valign="top" class="name" colspan=2 >
									<div id="pfs">
									<!--g:each status="i" in="${personaJuridicaInstance?.pJuridicaPFisicas}" var="p"-->
									<g:each status="i" in="${pfPjs}" var="p">								
										<p id="pf${i+1}">
										<label>Persona Fisica</label><g:textField name="pJuridicaPFisicas.personaFisica" value="${p.personaFisica} cuit:${p.personaFisica.cuit}" size="50"/>
										<label>Cargo</label><g:textField name="pJuridicaPFisicas.cargo" value="${p.cargo}"/>
										<span class="button" id="remove${i+1}"><input type="button" class="save" value="Remover"/></span>
										</p>
									</g:each>
                                        <p>
                                        <label>Persona Fisica</label><g:textField name="pJuridicaPFisicas.personaFisica" size="50"/>
                                        <label>Cargo</label><g:textField name="pJuridicaPFisicas.cargo" />
                                        <span class="button" id="remove"><input type="button" class="save" value="Remover" /></span>
                                        </p>
									</div>
									<p id="addPfs">
										<span class="button" id="add"><input type="button" class="save" value="Agregar Persona Fisica" /></span>
									</p>
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
<!--% status?.setRollbackOnly() %-->
