

<%@ page import="cinema.DdjjVideo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ddjjVideo.label', default: 'DdjjVideo')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
		<script>
		$(document).ready(function() {
			$('#periodo').datepicker( {
       			changeMonth: true,
        		changeYear: true,
        		showButtonPanel: true,
        		dateFormat: 'yymm',
        		onClose: function(dateText, inst) { 
            		var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            		var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            		$(this).datepicker('setDate', new Date(year, month, 1));
        		},
				beforeShow : function(input, inst) {
            	    if ((datestr = $(this).val()).length > 0) {
//                	    year = datestr.substring(datestr.length-4, datestr.length);
						year = datestr.substring(0,4);
//						month = datestr.substring(0,datestr.length-5);
						month = datestr.substring(datestr.length -2, datestr.length);
//                    	month = jQuery.inArray(datestr.substring(0, datestr.length-5), $(this).datepicker('option', 'monthNames'));
                    	$(this).datepicker('option', 'defaultDate', new Date(year, month-1, 1));
                    	$(this).datepicker('setDate', new Date(year, month-1, 1));
                	}
            	}
    		});
		
			$("#videoClub").autocomplete({ source: function(request, response) {
                            $.ajax({
                                url: "${createLink(mapping:'empresa', params:[dom:'VideoClub'], action:'autocomplete')}",
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
                            $('#videoClub\\.id').val(ui.item.title);
                        },
                        change: function(event, ui) {
                            if ($(".ui-autocomplete li:textEquals('" + $(this).val() + "')").size() == 0){
                                $(this).val('');
                            }
                        }

                    });
		
		});	
		</script>
		<style>
			.ui-datepicker-calendar {
    			display: none;
    		}
		</style>
    </head>
    <body>
		<bean:errorClass>errors</bean:errorClass>	
        <div class="body">
            <h1><g:message code="default.${ddjjVideoInstance?.id?'edit':'create'}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ddjjVideoInstance}">
            <div class="errors">
                <g:renderErrors bean="${ddjjVideoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
		 		<g:if test="${ddjjVideoInstance?.id}">
                    <g:hiddenField name="id" value="${ddjjVideoInstance?.id}" />
                    <g:hiddenField name="version" value="${ddjjVideoInstance?.version}" />
               </g:if>
	
                <div class="dialog">
                    <table>
						<bean:withBean beanName="ddjjVideoInstance">
                        	<bean:input property="videoClub" size="40" value="${ddjjVideoInstance && ddjjVideoInstance.videoClub?ddjjVideoInstance.videoClub.desc():''}"/>
							<input type="hidden" name="videoClub.id" id="videoClub.id" value="${ddjjVideoInstance?.videoClub?.id}"
							<bean:field property="periodo" />
							<bean:field property="cantidadTotalVenta" maxLength="9"/>
							<!--bean:field property="precioTotalVenta" maxLength="9"/-->
						 	<!--bean:field property="cantidadTotalAlquiler" maxLength="9"/-->
                            <!--bean:field property="precioTotalAlquiler" maxLength="9"/-->
						</bean:withBean>	
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="precioTotalVenta"><g:message code="ddjjVideo.precioTotalVenta.label" default="Precio Total Venta" /></label>
                                </td>
                                <td valign="bottom" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'precioTotalVenta', 'errors')}">
                                    $ <g:textField name="precioTotalVenta" value="${ddjjVideoInstance?.precioTotalVenta}" maxLength="9" />
                                </td>
                            </tr>
                        <bean:field property="cantidadTotalAlquiler" maxLength="9" beanName="ddjjVideoInstance"/>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="precioTotalAlquiler"><g:message code="ddjjVideo.precioTotalAlquiler.label" default="Precio Total Alquiler" /></label>
                                </td>
                                <td valign="bottom" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'precioTotalAlquiler', 'errors')}">
                                    $ <g:textField name="precioTotalAlquiler" value="${ddjjVideoInstance?.precioTotalAlquiler}" maxLength="9"/>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Guardar')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
