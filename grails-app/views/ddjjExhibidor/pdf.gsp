
<%@ page import="cinema.DdjjExhibidor" %>
<%@ page import="cinema.DdjjExhibidorRegistry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ddjjExhibidor.label', default: 'DdjjExhibidor')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
		<script>
			$(document).ready(function() {
				$('#results').dataTable( {
                	"bProcessing": false,
					"bSort":false,
					"bPaginate": false,
                	"bDeferRender": true,
                	"bAutoWidth": true,
					"sDom": 'T<"clear">lfrtip',
					"oTableTools": {
						"sSwfPath": "/js/copy_cvs_xls_pdf.swf",
						"aButtons": [
							{
								"sExtends": "pdf",
								"sPdfOrientation": "landscape",
								"sPdfMessage": "Cod. Empresa:${ddjjExhibidorInstance?.exhibidora?.codigo}, Cuit:${ddjjExhibidorInstance?.exhibidora?.cuit()}"
							},
							"copy",
							"print"
						]
					}

            	});
			});

		</script>		
    </head>
    <body>
        <div class="body">
            <h1>Ddjj Exhibidor ${ddjjExhibidorInstance.exhibidora.denominacion()}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                    	<tr>
							<td valign="top" class="name" colspan="2">
								<table cellpadding="0" cellspacing="0" border="0" id="results">
								<thead>
									<tr>	
										<th>Cod. Empresa:</th><th>${ddjjExhibidorInstance?.exhibidora?.codigo}</th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th>Cuit:</th><th>${ddjjExhibidorInstance?.exhibidora?.cuit()}</th>
									</tr>
									<tr>
										<th>Hora</th><th>Cod. Película</th><th>Titulo</th><th>Cod. Distribuidor</th><th>Tipo</th><th>Serie</th><th>Nro: Boc</th><th>Precio Básico</th><th>10% Impuesto</th><th>Precio Venta</th><th>Entr. Vendidas</th><th>Total Impuesto</th>
									</tr>
								</thead>
								<tbody>
								<g:each in="${ddjjExhibidorInstance?.groupAndSubtotal()}" var="dias">
									<% try { %>
									<tr>
										<td style="font-weight:bold">Fecha:</td><td style="font-weight:bold"><%= "${dias.key[0]}/${dias.key[1]}/${dias.key[2]}" %></td>
										<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
									</tr>
									<g:each in="${dias.value}" var="salas" >
									<% try { 
										if(salas.key instanceof cinema.Sala){%>	
									 <tr>
                                        <td style="font-weight:bold">Sala:</td><td style="font-weight:bold"><%= "${salas.key.codigo} / ${salas.key.nombre}" %></td>
										<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                                    </tr>
									<%  } %>
                                    <g:each in="${salas.value.registry}" var="reg">
									<% try { %>
                                     <tr>
										<td>${reg.hora}</td><td>${reg.pelicula.codigo}</td><td>${reg.pelicula.titulo}</td><td>${reg.distribuidor.codigo}</td>
										<td>${reg.tipoFuncion}</td><td>${reg.serieBOC}</td><td>${reg.numeroInicialBOC}</td><td>${reg.precioBasico}</td>
										<td>${reg.impuesto}</td><td>${reg.precioVenta}</td><td>${reg.cantidadEntradas}</td>
										<td>${reg.impuestoTotal}</td>
									</tr>
									<% } catch(Exception e){} %>	
                                    </g:each>
									<tr>
										<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
										<td style="font-weight:bold">Total de la Sala:</td><td style="font-weight:bold">${salas.value.entradas}</td>
										<td style="font-weight:bold">${salas.value.totalImpuestos}</td>
									</tr>
									<% } catch(Exception e){} %>
									</g:each>
                                    <tr>
                                        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                                        <td style="font-weight:bold">Total del Dia:</td><td style="font-weight:bold">${dias.value.entradas}</td>
										<td style="font-weight:bold">${dias.value.totalImpuestos}</td>
                                    </tr>
								<% } catch(Exception e){} %>
                                </g:each>
								</tbody>	
								<tfoot>
										<tr><td colspan="12"><img src="${createLink(action:'barcode', params:[id:ddjjExhibidorInstance.exhibidora.codigo])}"></td></tr>
								</tfoot>	
								</table>
							</td>
						</tr>
						<tr><td><!--img src="${createLink(action:'barcode')}"--></td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
