
<%@ page import="cinema.Sala" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sala.label', default: 'Sala')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
		<script type="text/javascript" charset="utf-8">
            <g:render template="/js/prov-loc.js"/>
             $.expr[':'].textEquals = function (a, i, m) {
	             return $(a).text().match("^" + m[3] + "$");
             };
		
			$(document).ready(function(){ 
				$("#exhibidor").autocomplete({ source: function(request, response) {
                            $.ajax({
                                url: "${createLink(mapping:'empresa', params:[dom:'Exhibidor'], action:'autocomplete')}",
                                dataType: "json",
                                data: {
                                    term: request.term
                                },
                                success: function(data) {
                                    response($.map(data, function(item) {
                                        return {
                                            label: (item.nombre?item.nombre+" "+item.apellido+" cuit:"+item.cuit:item.razonSocial+" cuit:"+item.cuit),
											value: (item.nombre?item.nombre+" "+item.apellido+" cuit:"+item.cuit:item.razonSocial+" cuit:"+item.cuit),
											title: item.id
                                        }
                                    }))
                                }
                            })
                        },
                        minLength:1,
						select: function(event, ui) {
                            $('#exhibidor\\.id').val(ui.item.title);
                        },
						change: function(event, ui) {
                            if ($(".ui-autocomplete li:textEquals('" + $(this).val() + "')").size() == 0){
                                $(this).val('');
                            }
                        }
	
                    });

	                $("#complejo").autocomplete({ source: function(request, response) {
                            $.ajax({
                                url: "${createLink(controller:'complejo', action:'autocomplete')}",
                                dataType: "json",
                                data: {
                                    term: request.term
                                },
                                success: function(data) {
                                    response($.map(data, function(item) {
                                        return {
                                            label: item.denominacion,
                                            value: item.denominacion,
                                            title: item.id
                                        }
                                    }))
                                }
                            })
                        },
                        minLength:2,
                        select: function(event, ui) {
                            $('#complejo\\.id').val(ui.item.title);
                        },
                        change: function(event, ui) {
                            if ($(".ui-autocomplete li:textEquals('" + $(this).val() + "')").size() == 0){
                                $(this).val('');
                            }
                        }

                    });

				$("#fechaInicioActividad").datepicker({dateFormat: 'dd/mm/yy'});
				$("#fechaRenovacion").datepicker({dateFormat: 'dd/mm/yy'});

				})	
		</script>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.${salaInstance?.id?'edit':'create'}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${salaInstance}">
            <div class="errors">
                <g:renderErrors bean="${salaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="get" >
               <g:if test="${salaInstance?.id}">
                    <g:hiddenField name="id" value="${salaInstance?.id}" />
                    <g:hiddenField name="version" value="${salaInstance?.version}" />
               </g:if>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo"><g:message code="sala.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${salaInstance?.codigo}" size="11" maxLenght="11" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="sala.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${salaInstance?.nombre}" size="80"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="domicilio"><g:message code="sala.domicilio.label" default="Domicilio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'domicilio', 'errors')}">
                                    <g:textField name="domicilio" value="${salaInstance?.domicilio}" size="80"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="complejo"><g:message code="sala.complejo.label" default="Complejo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'complejo', 'errors')}">
                                    <g:textField name="complejo" value="${salaInstance?.complejo?.denominacion}" size="20" />
									<input type="hidden" id="complejo.id" name="complejo.id" value="${salaInstance?.complejo?.id}">
                                </td>
                            </tr>
 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigoPostal"><g:message code="sala.codigoPostal.label" default="Codigo Postal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'codigoPostal', 'errors')}">
                                    <g:textField name="codigoPostal" value="${salaInstance?.codigoPostal}" size="8" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="provincia"><g:message code="sala.provincia.label" default="Provincia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'provincia', 'errors')}">
                                    
                                      <g:select name="provincia.id" id="provincia.id" noSelection="${['0':'Seleccionar...']}"
                                              from="${cinema.Provincia.list()}" 
                                              value="${salaInstance?.provincia?.id}"
                                              optionValue="name" optionKey="id"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="localidad"><g:message code="sala.localidad.label" default="Localidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'localidad', 'errors')}">
                                    <g:select name="localidad.id" id="localidad.id" value="${salaInstance?.localidad?.id}" noSelection="${['0':'Seleccionar...']}"
											optionValue="name" optionKey="id" from="${salaInstance?.provincia?.localidades}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="sala.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${salaInstance?.email}" size="60"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaInicioActividad"><g:message code="sala.fechaInicioActividad.label" default="Fecha Inicio Actividad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'fechaInicioActividad', 'errors')}">
                                    <g:textField name="fechaInicioActividad" value="${formatDate(format:'dd/MM/yyyy', date:salaInstance?.fechaInicioActividad)}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipo"><g:message code="sala.tipo.label" default="Tipo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'tipo', 'errors')}">
                                    <g:select name="tipo" id="tipo" noSelection="${['0':'Seleccionar...']}"
                                              from="${['Comercial','No Comercial','Ambulante Comercial', 'Ambulante No Comercial']}" 
                                              value="${salaInstance?.tipo}"
                                              />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="frecuencia"><g:message code="sala.frecuencia.label" default="Frecuencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'frecuencia', 'errors')}">
                                    <g:select name="frecuencia" id="frecuencia" noSelection="${['0':'Seleccionar...']}"
                                              from="${['Anual',' Fines de semana','Verano e invierno', 'Ocasional']}" 
                                              value="${salaInstance?.frecuencia}"
                                              />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaRenovacion"><g:message code="sala.fechaRenovacion.label" default="Fecha de Renovacion de Certificado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'fechaRenovacion', 'errors')}">
                                    <g:textField name="fechaRenovacion" value="${formatDate(format:'dd/MM/yyyy', date:salaInstance?.fechaRenovacion)}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sistemaProyeccion"><g:message code="sala.sistemaProyeccion.label" default="Sistema Proyeccion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'sistemaProyeccion', 'errors')}">
                                    <g:select name="sistemaProyeccion" id="sistemaProyeccion" noSelection="${['0':'Seleccionar...']}"
                                              from="${['35 mm','Digital','Digital 3D', 'DVD']}" 
                                              value="${salaInstance?.sistemaProyeccion}"
                                              />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="capacidad"><g:message code="sala.capacidad.label" default="Capacidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'capacidad', 'errors')}">
                                    <g:textField name="capacidad" value="${fieldValue(bean: salaInstance, field: 'capacidad')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exhibidor"><g:message code="sala.exhibidor.label" default="Exhibidor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'exhibidor', 'errors')}">
                                    <g:textField name="exhibidor" value="${salaInstance?.exhibidor?.desc()}"  />
									<input type="hidden" id="exhibidor.id" name="exhibidor.id" value="${salaInstance?.exhibidor?.id}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diasExhibicion"><g:message code="sala.diasExhibicion.label" default="Dias Exhibicion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salaInstance, field: 'diasExhibicion', 'errors')}">
								    <g:each in="${cinema.Dia.values()}">
                                        <g:checkBox name="diasExhibicion" value="${it.getKey()}" checked="${salaInstance?.diasExhibicion?.contains(cinema.Dia.byId(it.getKey()))}"/>${it.value} 
                                    </g:each>
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
