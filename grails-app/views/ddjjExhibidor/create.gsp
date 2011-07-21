
<%@ page import="cinema.DdjjExhibidor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ddjjExhibidor.label', default: 'DdjjExhibidor')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
			<jqDT:resources/>
			<script type="text/javascript" charset="utf-8">

            $(document).ready(function() {
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
                        minLength:2,
                        select: function(event, ui) {
                            $('#exhibidor\\.id').val(ui.item.title);
                        }
				});
 
				$("#fecha").datepicker({dateFormat: 'dd/mm/yy'});	

				$('#ddjjRegs').dataTable({
				});

			});
		</script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.${params.action}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ddjjExhibidorInstance}">
            <div class="errors">
                <g:renderErrors bean="${ddjjExhibidorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fecha"><g:message code="ddjjExhibidor.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjExhibidorInstance, field: 'fecha', 'errors')}">
                                    <g:textField name="fecha" value="${formatDate(format:'dd/MM/yyyy', date: ddjjExhibidorInstance?.fecha)}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="file"><g:message code="ddjjExhibidor.file.label" default="File" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjExhibidorInstance, field: 'file', 'errors')}">
                                   <input type="file" name="file" value="${ddjjExhibidorInstance?.file}"/>
									${ddjjExhibidorInstance?.file} 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exhibidora"><g:message code="ddjjExhibidor.exhibidora.label" default="Exhibidora" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ddjjExhibidorInstance, field: 'exhibidora', 'errors')}">
                                    <g:textField name="exhibidor" value="${ddjjExhibidorInstance?.exhibidora?.desc()}"  />
									<input type="hidden" name="exhibidor.id" id="exhibidor.id" value="${ddjjExhibidorInstance?.exhibidora?.id}" />	
                                </td>
                            </tr>
							<g:if test="${ddjjRegs?.size() > 0}">
                        	<tr>
								<td colspan=2>
									<table cellpadding="0" cellspacing="0" border="0" id="ddjjRegs">
    								<thead>
       									<tr>
								        	<th>Periodo Fiscal</th>
									      	<th>Dia</th>
								          	<th>Mes</th>
								          	<th>Año</th>
											<th>Hora</th>
								          	<th>Exhibidor</th>
										  	<th>Sala</th>
											<th>Pelicula</th>
											<th>Distribuidor</th>	
											<th>Tipo Función</th>
											<th>Errores</th>
								       </tr>
								    </thead>
								    <tbody>
										<g:each in="${ddjjRegs}">
											<tr>
												<td>${it.periodoFiscal}</td>
												<td>${it.dia}</td>
												<td>${it.mes}</td>
												<td>${it.anio}</td>
												<td>${it.hora}</td>
												<td>${it.exhibidor?.codigo}</td>
											 	<td>${it.sala?.codigo}</td>
												<td>${it.pelicula?.codigo}</td>
												<td>${it.distribuidor?.codigo}</td>
												<td>${it.tipoFuncion}</td>
												<td><g:renderErrors bean="${it}" as="list" /></td>
											</tr>
										</g:each>			
									</tbody>
									</table>
								</td>
							</tr>
							</g:if>
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
