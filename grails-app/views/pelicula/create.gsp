

<%@ page import="cinema.Pelicula" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pelicula.label', default: 'Pelicula')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
		<script type="text/javascript" charset="utf-8">
            $.expr[':'].textEquals = function (a, i, m) {
                return $(a).text().match("^" + m[3] + "$");
            };
            $(document).ready(function() {
				$("#productor").autocomplete({ source: function(request, response) {
                            $.ajax({
                                url: "${createLink(mapping:'empresa', params:[dom:'Productor'], action:'autocomplete')}",
                                dataType: "json",
                                data: {
                                    term: request.term
                                },
                                success: function(data) {
                                    response($.map(data, function(item) {
                                        return {
											label: (item.nombre?item.nombre+" "+item.apellido:item.razonSocial)+", Código: "+item.codigo,
                                            value: (item.nombre?item.nombre+" "+item.apellido:item.razonSocial)+", Código: "+item.codigo,
                                            
											//label: (item.nombre?item.nombre+" "+item.apellido+" cuit:"+item.cuit:item.razonSocial+" cuit:"+item.cuit),
                                            //value: (item.nombre?item.nombre+" "+item.apellido+" cuit:"+item.cuit:item.razonSocial+" cuit:"+item.cuit),
                                            title: item.id
                                        }
                                    }))
                                }
                            })
                        },
                        minLength:1,
						select: function(event, ui) {
                            $('#productor\\.id').val(ui.item.title);
                        },
						change: function(event, ui) {
                            if ($(".ui-autocomplete li:textEquals('" + $(this).val() + "')").size() == 0){
                                $(this).val('');
								$('#productor\\.id').val('');	
                            }
                        }
                    });

					$("#distribuidor").autocomplete({ source: function(request, response) {
                            $.ajax({
                                url: "${createLink(mapping:'empresa', params:[dom:'Distribuidor'], action:'autocomplete')}",
                                dataType: "json",
                                data: {
                                    term: request.term
                                },
                                success: function(data) {
                                    response($.map(data, function(item) {
                                        return {
                                           label: (item.nombre?item.nombre+" "+item.apellido:item.razonSocial)+", Código: "+item.codigo,
                                            value: (item.nombre?item.nombre+" "+item.apellido:item.razonSocial)+", Código: "+item.codigo,

                                           // label: (item.nombre?item.nombre+" "+item.apellido+" cuit:"+item.cuit:item.razonSocial+" cuit:"+item.cuit),
                                           // value: (item.nombre?item.nombre+" "+item.apellido+" cuit:"+item.cuit:item.razonSocial+" cuit:"+item.cuit),
                                            title: item.id
                                        }
                                    }))
                                }
                            })
                        },
                        minLength:2,
						select: function(event, ui) {
                            $('#distribuidor\\.id').val(ui.item.title);
                        },
						change: function(event, ui) {
                            if ($(".ui-autocomplete li:textEquals('" + $(this).val() + "')").size() == 0){
                                $(this).val('');
								$('#distribuidor\\.id').val('');
                            }
                        }

                    });
					
	                $("#fechaEstreno").datepicker({dateFormat: 'dd/mm/yy',
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
            <h1><g:message code="default.${peliculaInstance?.id?'edit':'create'}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${peliculaInstance}">
            <div class="errors">
                <g:renderErrors bean="${peliculaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save">
                <g:if test="${peliculaInstance?.id}">
                    <g:hiddenField name="id" value="${peliculaInstance?.id}" />
                    <g:hiddenField name="version" value="${peliculaInstance?.version}" />
                </g:if>

                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo"><g:message code="pelicula.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: peliculaInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${peliculaInstance?.codigo}" size="15"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="titulo"><g:message code="pelicula.titulo.label" default="Titulo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: peliculaInstance, field: 'titulo', 'errors')}">
                                    <g:textField name="titulo" value="${peliculaInstance?.titulo}" size="70"/>
                                </td>
                            </tr>
                       
							 <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="titulo"><g:message code="pelicula.fechaEstreno.label" default="Fecha de Estreno" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: peliculaInstance, field: 'fechaEstreno', 'errors')}">
                                    <g:textField name="fechaEstreno" value="${formatDate(format:'dd/MM/yyyy', date:peliculaInstance?.fechaEstreno)}" />
                                </td>
                            </tr>

 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distribuidor"><g:message code="pelicula.distribuidor.label" default="Distribuidor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: peliculaInstance, field: 'distribuidor', 'errors')}">
                                    <g:textField name="distribuidor" value="${peliculaInstance?.distribuidor?.desc()}"  />
									<input type="hidden" value="${peliculaInstance?.distribuidor?.id}" name="distribuidor.id" id="distribuidor.id"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="productor"><g:message code="pelicula.productor.label" default="Productor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: peliculaInstance, field: 'productor', 'errors')}">
                                    <g:textField name="productor" value="${peliculaInstance?.productor?.desc()}"  />
									<input type="hidden" value="${peliculaInstance?.productor?.id}" name="productor.id" id="productor.id"/>
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
