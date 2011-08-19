

<%@ page import="cinema.BocEgreso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bocEgreso.label', default: 'BocEgreso')}" />
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
                                            label: (item.nombre?item.nombre+" "+item.apellido+" cuit:"+item.cuit:item.razonSocial+" cuit:"+item.cuit),
                                            value: (item.nombre?item.nombre+" "+item.apellido+" cuit:"+item.cuit:item.razonSocial+" cuit:"+item.cuit),
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
                            }
                        },
                        select: function(event, ui) {
                            $('#exhibidor\\.id').val(ui.item.title);
                        }


                    });

                    $("#fecha").datepicker({dateFormat: 'dd/mm/yy'});
            });
        </script>
	
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.${bocEgresoInstance?.id?'edit':'create'}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bocEgresoInstance}">
            <div class="errors">
                <g:renderErrors bean="${bocEgresoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
				<g:if test="${bocEgresoInstance?.id}">
                    <g:hiddenField name="id" value="${bocEgresoInstance?.id}" />
                    <g:hiddenField name="version" value="${bocEgresoInstance?.version}" />
                </g:if>

                <div class="dialog">
                    <table>
                        <tbody>
                       <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serie"><g:message code="bocEgreso.tipo.label" default="Tipo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocEgresoInstance, field: 'tipo', 'errors')}">
                                    <g:select name="tipo" id="tipo" noSelection="${['':'Seleccionar...']}"
                                              from="${['ENTREGA', 'DEVOLUCION']}" 
                                              value="${bocEgresoInstance?.tipo}"
                                              />

                                </td>
                            </tr>
 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="desde"><g:message code="bocEgreso.desde.label" default="Desde número" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocEgresoInstance, field: 'desde', 'errors')}">
                                    <g:textField name="desde" value="${bocEgresoInstance?.desde}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hasta"><g:message code="bocEgreso.hasta.label" default="Hasta número" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocEgresoInstance, field: 'hasta', 'errors')}">
                                    <g:textField name="hasta" value="${bocEgresoInstance?.hasta}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serie"><g:message code="bocEgreso.serie.label" default="Serie" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocEgresoInstance, field: 'serie', 'errors')}">
									<g:select name="serie" id="serie" noSelection="${['0':'Seleccionar...']}"
                                              from="${['A','B','C', 'D', 'E', 'Z']}" 
                                              value="${bocEgresoInstance?.serie}"
                                              />

                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exhibidor"><g:message code="bocEgreso.exhibidor.label" default="Exhibidor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocEgresoInstance, field: 'exhibidor', 'errors')}">
                                    <g:textField name="exhibidor" value="${bocEgresoInstance?.exhibidor?.desc()}"  />
									<input type="hidden" name="exhibidor.id" id="exhibidor.id" value="${bocEgresoInstance?.exhibidor?.id}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fecha"><g:message code="bocEgreso.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocEgresoInstance, field: 'fecha', 'errors')}">
                                    <g:textField name="fecha" value="${formatDate(format:'dd/MM/yyyy', date:bocEgresoInstance?.fecha)}"  />
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
