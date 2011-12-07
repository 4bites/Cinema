

<%@ page import="cinema.Boc" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'boc.label', default: 'Boc')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
		<script type="text/javascript" charset="utf-8">
             $.expr[':'].textEquals = function (a, i, m) {
                return $(a).text().match("^" + m[3] + "$");
            };

            $(document).ready(function() {
                    $('#exhibidor').autocomplete({
                        source: function(request, response) {
                            $.ajax({
                                url: "${createLink(controller:'empresa', action:'autocomplete', params:[dom:'Exhibidor'])}",
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
                        minLength: 1,
                        change: function(event, ui) {
                            if ($(".ui-autocomplete li:textEquals('" + $(this).val() + "')").size() == 0){
                                $(this).val('');
								$('#exhibidor\\.id').val('');
                            }
                        },
                        select: function(event, ui) {
                            $('#exhibidor\\.id').val(ui.item.title);
                        }


                    });

        //            $("#fechaAlta").datepicker({dateFormat: 'dd/mm/yy'});

	                    $("#accion").change( function(event, ui) {
							if($(this).val() == 'entrega' || $(this).val() == 'devolucion'){
	                            $("label[for='exhibidor']").html("Exhibidor*");
							}else{
                                $("label[for='exhibidor']").html("Exhibidor");
 							}
                        });

					$('#accion').trigger('change');

            });
        </script>
	
    </head>
    <body>
		<bean:errorClass>errors</bean:errorClass> 		
        <div class="body">
            <h1><g:message code="default.${bocInstance?.id?'edit':'create'}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bocInstance}">
            <div class="errors">
                <g:renderErrors bean="${bocInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
				<g:if test="${bocInstance?.id}">
                    <g:hiddenField name="id" value="${bocInstance?.id}" />
                    <g:hiddenField name="version" value="${bocInstance?.version}" />
                </g:if>

                <div class="dialog">
                    <table>
                        <tbody>
						 <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serie"><g:message code="boc.accion.label" default="Accion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocInstance, field: 'accion', 'errors')}">
                                    <g:select disabled="disabled" name="accion" id="accion" noSelection="${['':'Seleccionar...']}"
                                              from="${['alta','baja','entrega', 'devolucion']}" 
                                              value="${bocInstance?.accion}"
                                              />

                                </td>
                            </tr>

						<bean:withBean beanName="bocInstance">
                            <bean:input property="desde" maxLength="9" />
                            <bean:input property="hasta" maxLength="9" />
                            <bean:select property="serie" noSelection="${['':'Seleccionar...']}"
                                              from="${['A','B','C', 'D', 'E', 'Z']}"  />
                            <bean:input property="exhibidor" size="40" value="${bocInstance&&bocInstance.exhibidor?bocInstance.exhibidor.desc():''}"/>
							<input type="hidden" name="exhibidor.id" id="exhibidor.id" value="${bocInstance?.exhibidor?.id}"/>
                        </bean:withBean>
						<!--	
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="desde"><g:message code="boc.desde.label" default="Desde numero" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocInstance, field: 'desde', 'errors')}">
                                    <g:textField name="desde" value="${bocInstance?.desde}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hasta"><g:message code="boc.hasta.label" default="Hasta numero" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocInstance, field: 'hasta', 'errors')}">
                                    <g:textField name="hasta" value="${bocInstance?.hasta}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serie"><g:message code="boc.serie.label" default="Serie" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocInstance, field: 'serie', 'errors')}">
									<g:select name="serie" id="serie" noSelection="${['0':'Seleccionar...']}"
                                              from="${['A','B','C', 'D', 'E', 'Z']}" 
                                              value="${bocInstance?.serie}"
                                              />

                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exhibidor"><g:message code="boc.exhibidor.label" default="Exhibidor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocInstance, field: 'exhibidor', 'errors')}">
                                    <g:textField name="exhibidor" value="${bocInstance?.exhibidor?.desc()}"  />
									<input type="hidden" name="exhibidor.id" id="exhibidor.id" value="${bocInstance?.exhibidor?.id}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaAlta"><g:message code="boc.fechaAlta.label" default="Fecha Alta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocInstance, field: 'fechaAlta', 'errors')}">
                                    <g:textField name="fechaAlta" value="${formatDate(format:'dd/MM/yyyy', date:bocInstance?.fechaAlta)}"  />
                                </td>
                            </tr>
                        -->
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
