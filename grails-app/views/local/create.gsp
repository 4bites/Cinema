

<%@ page import="cinema.Local" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'local.label', default: 'Local')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
		
		<script type="text/javascript" charset="utf-8">
			<g:render template="/js/prov-loc.js"/>
			 $.expr[':'].textEquals = function (a, i, m) {
                return $(a).text().match("^" + m[3] + "$");
            };

            $(document).ready(function() {
                    $('#video').autocomplete({
                        source: function(request, response) {
                            $.ajax({
                                url: "${createLink(controller:'empresa', action:'autocomplete', params:[dom:'VideoClub'])}",
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
                        minLength: 2,
                        change: function(event, ui) {
                            if ($(".ui-autocomplete li:textEquals('" + $(this).val() + "')").size() == 0){
                                $(this).val('');
                            }
                        },
						select: function(event, ui) {
                            $('#video\\.id').val(ui.item.title);
                        }
 

                    });

					$("#fechaApertura").datepicker({dateFormat: 'dd/mm/yy',
	                    onClose: function(){
    	                    try{
        	                    $.datepicker.parseDate('dd/mm/yy', $(this).val());
            	            } catch(e){
                	            $(this).val('');
                    	    }
                    	}
					});
			});
		</script>    
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.${localInstance?.id?'edit':'create'}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${localInstance}">
            <div class="errors">
                <g:renderErrors bean="${localInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
				<g:if test="${localInstance?.id}">
                    <g:hiddenField name="id" value="${localInstance?.id}" />
                    <g:hiddenField name="version" value="${localInstance?.version}" />
               </g:if>

                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo"><g:message code="local.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${localInstance?.codigo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigoPostal"><g:message code="local.codigoPostal.label" default="Codigo Postal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'codigoPostal', 'errors')}">
                                    <g:textField name="codigoPostal" value="${localInstance?.codigoPostal}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="domicilio"><g:message code="local.domicilio.label" default="Domicilio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'domicilio', 'errors')}">
                                    <g:textField name="domicilio" value="${localInstance?.domicilio}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="local.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${localInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaApertura"><g:message code="local.fechaApertura.label" default="Fecha Apertura" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'fechaApertura', 'errors')}">
                                    <g:textField name="fechaApertura" value="${formatDate(format:'dd/MM/yyyy', date:localInstance?.fechaApertura)}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="local.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${localInstance?.nombre}" />
                                </td>
                            </tr>
                        
	                       <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="provincia"><g:message code="local.provincia.label" default="Provincia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'provincia', 'errors')}">
                                    <g:select name="provincia.id" id="provincia.id" from="${cinema.Provincia.list()}" 
                                        optionKey="id" value="${localInstance?.provincia?.id}"  
                                        noSelection="${['0':'Seleccionar...']}" optionValue="name"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="localidad"><g:message code="local.localidad.label" default="Localidad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'localidad', 'errors')}">
                                    <g:select name="localidad.id" id="localidad.id" optionKey="id" optionValue="name" 
                                        value="${localInstance?.localidad?.id}" from="${localInstance?.provincia?.localidades}" 
                                        noSelection="${['0':'Seleccionar...']}"/>
                                </td>
                            </tr>
 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefono"><g:message code="local.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${localInstance?.telefono}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="video"><g:message code="local.video.label" default="Video" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: localInstance, field: 'video', 'errors')}">
                                    <g:textField name="video" value="${localInstance?.video?.desc()}"  />
									<input type="hidden" name="video.id" id="video.id" value="${localInstance?.video?.id}" />
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
