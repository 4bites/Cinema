
<%@ page import="cinema.PersonaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaJuridica.label', default: 'PersonaJuridica')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript" charset="utf-8">
            <g:render template="/js/prov-loc.js"/>

		$(document).ready(function() {
			$('#results').dataTable( {
				"bProcessing": true,
				"bDeferRender": true,
				//"bServerSide": true,
				"sAjaxSource": "/personaJuridica/search",
				"aoColumns": [
					{ "mDataProp": "cuit" },
					{ "mDataProp": "razonSocial" },
					{ "mDataProp": "codigoPostal" },
					{ "mDataProp": "telefono" },
					{ "mDataProp": "tipoSociedad.name"},
					{ "mDataProp": "provincia.name"}
				],
				fnRowCallback: function(nRow, aData, iDisplayIndex) {
					$(nRow).click(function(){
						location.href = "/personaJuridica/show/"+aData["id"];
					});
					return nRow;
				}	
			}).columnFilter({"aoColumns":[{type:"text"},{type:"text"},{type:"text"},{type:"text"},{type: "select", values: [${cinema.SocietyType.select()}] }, {type: "select", values: [${cinema.Provincia.select()}] } ]});
		});
		</script>
    </head>
    <body>
        <div class="nav">
            <!--  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span> -->
            <span class="menuButton"><g:link class="create" action="create">Crear Persona Juridica</g:link></span>
        </div>
        <div class="body">
            <h1>Listado de Personas Juridicas</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table id="results">
                    <thead>
                        <tr>
                            <td>${message(code: 'personaJuridica.cuit.label', default: 'Cuit')}</td>
                            <td>${message(code: 'personaJuridica.razonSocial.label', default: 'Razon Social')}</td>
                            <td>${message(code: 'personaJuridica.codigoPostal.label', default: 'Codigo Postal')}</td>
                        	<td>${message(code: 'personaJuridica.telefono.label', default: 'Telefono')}</td>
							<td>${message(code: 'personaJuridica.tipoSociedad.label', default: 'Tipo Sociedad')}</td>
							<td>${message(code: 'personaJuridica.provincia.label', default: 'Provincia')}</td>
							<!--td>${message(code: 'personaFisica.label', default: 'Persona Fisica')}</td-->
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
					<tfoot>
						<tr>
							<th>${message(code: 'personaJuridica.cuit.label', default: 'Cuit')}</th>
							<th>${message(code: 'personaJuridica.razonSocial.label', default: 'Razon Social')}</th>
							<th>${message(code: 'personaJuridica.codigoPostal.label', default: 'Codigo Postal')}</th>
							<th>${message(code: 'personaJuridica.telefono.label', default: 'Telefono')}</th>
							<th>${message(code: 'personaJuridica.tipoSociedad.label', default: 'Tipo Sociedad')}</th>
							<th>${message(code: 'personaJuridica.provincia.label', default: 'Provincia')}</th>
							<!--th>${message(code: 'personaFisica.label', default: 'Persona Fisica')}</th-->
						</tr>
					</tfoot>

                </table>
            </div>
        </div>
    </body>
</html>
