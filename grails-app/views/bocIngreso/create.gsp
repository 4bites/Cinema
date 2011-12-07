

<%@ page import="cinema.BocIngreso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bocIngreso.label', default: 'BocIngreso')}" />
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

                    $("#fechaAlta").datepicker({dateFormat: 'dd/mm/yy'});
            });
        </script>
	
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.${bocIngresoInstance?.id?'edit':'create'}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bocIngresoInstance}">
            <div class="errors">
                <g:renderErrors bean="${bocIngresoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
				<g:if test="${bocIngresoInstance?.id}">
                    <g:hiddenField name="id" value="${bocIngresoInstance?.id}" />
                    <g:hiddenField name="version" value="${bocIngresoInstance?.version}" />
                </g:if>

                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="desde"><g:message code="bocIngreso.desde.label" default="Desde numero" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocIngresoInstance, field: 'desde', 'errors')}">
                                    <g:textField name="desde" value="${bocIngresoInstance?.desde}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hasta"><g:message code="bocIngreso.hasta.label" default="Hasta numero" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocIngresoInstance, field: 'hasta', 'errors')}">
                                    <g:textField name="hasta" value="${bocIngresoInstance?.hasta}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serie"><g:message code="bocIngreso.serie.label" default="Serie" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocIngresoInstance, field: 'serie', 'errors')}">
									<g:select name="serie" id="serie" noSelection="${['0':'Seleccionar...']}"
                                              from="${['A','B','C', 'D', 'E', 'Z']}" 
                                              value="${bocIngresoInstance?.serie}"
                                              />

                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exhibidor"><g:message code="bocIngreso.exhibidor.label" default="Exhibidor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocIngresoInstance, field: 'exhibidor', 'errors')}">
                                    <g:textField name="exhibidor" value="${bocIngresoInstance?.exhibidor?.desc()}"  />
									<input type="hidden" name="exhibidor.id" id="exhibidor.id" value="${bocIngresoInstance?.exhibidor?.id}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaAlta"><g:message code="bocIngreso.fechaAlta.label" default="Fecha Alta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocIngresoInstance, field: 'fechaAlta', 'errors')}">
                                    <g:textField name="fechaAlta" value="${formatDate(format:'dd/MM/yyyy', date:bocIngresoInstance?.fechaAlta)}"  />
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
