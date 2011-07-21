

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
        		dateFormat: 'mm/yy',
        		onClose: function(dateText, inst) { 
            		var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            		var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            		$(this).datepicker('setDate', new Date(year, month, 1));
        		},
				beforeShow : function(input, inst) {
            	    if ((datestr = $(this).val()).length > 0) {
                	    year = datestr.substring(datestr.length-4, datestr.length);
						month = datestr.substring(0,datestr.length-5);
//                    	month = jQuery.inArray(datestr.substring(0, datestr.length-5), $(this).datepicker('option', 'monthNames'));
                    	$(this).datepicker('option', 'defaultDate', new Date(year, month-1, 1));
                    	$(this).datepicker('setDate', new Date(year, month-1, 1));
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
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ddjjVideoInstance}">
            <div class="errors">
                <g:renderErrors bean="${ddjjVideoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
		 		<g:if test="${salaInstance?.id}">
                    <g:hiddenField name="id" value="${ddjjVideoInstance?.id}" />
                    <g:hiddenField name="version" value="${ddjjVideoInstance?.version}" />
               </g:if>
	
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="videoClub"><g:message code="ddjjVideo.videoClub.label" default="Video Club" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'videoClub', 'errors')}">
                                    <g:select name="videoClub.id" from="${cinema.VideoClub.list()}" optionKey="id" value="${ddjjVideoInstance?.videoClub?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="periodo"><g:message code="ddjjVideo.periodo.label" default="Periodo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'periodo', 'errors')}">
                                    <g:textField name="periodo" value="${ddjjVideoInstance?.periodo}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cantidadTotalVenta"><g:message code="ddjjVideo.cantidadTotalVenta.label" default="Cantidad Total Venta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'cantidadTotalVenta', 'errors')}">
                                    <g:textField name="cantidadTotalVenta" value="${fieldValue(bean: ddjjVideoInstance, field: 'cantidadTotalVenta')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="precioTotalVenta"><g:message code="ddjjVideo.precioTotalVenta.label" default="Precio Total Venta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'precioTotalVenta', 'errors')}">
                                    <g:textField name="precioTotalVenta" value="${fieldValue(bean: ddjjVideoInstance, field: 'precioTotalVenta')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gravamenTotalVenta"><g:message code="ddjjVideo.gravamenTotalVenta.label" default="Gravamen Total Venta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'gravamenTotalVenta', 'errors')}">
                                    <g:textField name="gravamenTotalVenta" value="${fieldValue(bean: ddjjVideoInstance, field: 'gravamenTotalVenta')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cantidadTotalAlquiler"><g:message code="ddjjVideo.cantidadTotalAlquiler.label" default="Cantidad Total Alquiler" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'cantidadTotalAlquiler', 'errors')}">
                                    <g:textField name="cantidadTotalAlquiler" value="${fieldValue(bean: ddjjVideoInstance, field: 'cantidadTotalAlquiler')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="precioTotalAlquiler"><g:message code="ddjjVideo.precioTotalAlquiler.label" default="Precio Total Alquiler" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'precioTotalAlquiler', 'errors')}">
                                    <g:textField name="precioTotalAlquiler" value="${fieldValue(bean: ddjjVideoInstance, field: 'precioTotalAlquiler')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gravamenTotalAlquiler"><g:message code="ddjjVideo.gravamenTotalAlquiler.label" default="Gravamen Total Alquiler" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjVideoInstance, field: 'gravamenTotalAlquiler', 'errors')}">
                                    <g:textField name="gravamenTotalAlquiler" value="${fieldValue(bean: ddjjVideoInstance, field: 'gravamenTotalAlquiler')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>