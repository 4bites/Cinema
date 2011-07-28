
<%@ page import="cinema.PersonaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaJuridica.label', default: 'PersonaJuridica')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<script>
		$(document).ready(function() {
			$('#results').dataTable( {
				"bProcessing": true,
				"bServerSide": true,
				"sAjaxSource": "/personaJuridica/search",
				"aoColumns": [
					{ "mDataProp": "cuit" },
					{ "mDataProp": "razonSocial" },
					{ "mDataProp": "domicilio" },
					{ "mDataProp": "codigoPostal" },
					{ "mDataProp": "telefono" },
					{ "mDataProp": "tipoSociedad.name"}
				],
				fnRowCallback: function(nRow, aData, iDisplayIndex) {
					$(nRow).click(function(){
						location.href = "/personaJuridica/show/"+aData["id"];
					});
					return nRow;
				}	
			}).columnFilter({"aoColumns":[{type:"text"},{type:"text"},{type:"text"},{type:"text"},{type:"text"},{type: "select", values: [ 'A', 'B', 'C' ]}]});
		});
		</script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table id="results">
                    <thead>
                        <tr>
                        
                            <td>${message(code: 'personaJuridica.cuit.label', default: 'Cuit')}</td>
                            <td>${message(code: 'personaJuridica.razonSocial.label', default: 'Razon Social')}</td>
                            <td>${message(code: 'personaJuridica.domicilio.label', default: 'Domicilio')}</td>
                            <td>${message(code: 'personaJuridica.codigoPostal.label', default: 'Codigo Postal')}</td>
                        	<td>${message(code: 'personaJuridica.telefono.label', default: 'Telefono')}</td>
							<td>${message(code: 'personaJuridica.tipoSociedad.label', default: 'Tipo Sociedad')}</td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
					<tfoot>
						<tr>
							<th>${message(code: 'personaJuridica.cuit.label', default: 'Cuit')}</th>
							<th>${message(code: 'personaJuridica.razonSocial.label', default: 'Razon Social')}</th>
							<th>${message(code: 'personaJuridica.domicilio.label', default: 'Domicilio')}</th>
							<th>${message(code: 'personaJuridica.codigoPostal.label', default: 'Codigo Postal')}</th>
							<th>${message(code: 'personaJuridica.telefono.label', default: 'Telefono')}</th>
							<th>${message(code: 'personaJuridica.tipoSociedad.label', default: 'Tipo Sociedad')}</th>
						</tr>
					</tfoot>

                </table>
            </div>
        </div>
    </body>
</html>
