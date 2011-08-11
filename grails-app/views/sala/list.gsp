
<%@ page import="cinema.Sala" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sala.label', default: 'Sala')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript" charset="utf-8">

		 $(document).ready(function() {
            $('#results').dataTable( {
                "bProcessing": true,
                "bServerSide": false,
                "sAjaxSource": "/sala/search",
                "aoColumns": [
                    { "mDataProp": "codigo" , "sTitle":"${message(code: 'sala.codigo.label', default: 'Codigo')}"},
                    { "mDataProp": "nombre" , "sTitle": "${message(code: 'sala.nombre.label', default: 'Nombre')}"},
                    { "mDataProp": "codigoPostal", "sTitle": "${message(code: 'sala.codigoPostal.label', default: 'Codigo Postal')}" },
					{ "mDataProp": "tipo", "sTitle": "${message(code: 'sala.tipo.label', default: 'Tipo')}" },
					{ "mDataProp": "exhibidor.codigo", "sTitle": "${message(code: 'sala.exhibidor.label', default: 'Exhibidor')}" }
                ],
                fnRowCallback: function(nRow, aData, iDisplayIndex) {
                    $(nRow).click(function(){
                        location.href = "/sala/show/"+aData["id"];
                    });
                    return nRow;
                }
            }).columnFilter({"aoColumns":[{type:"text"},{type:"text"},{type:"text"},
							{type: "select", values: ['Comercial','No Comercial','Ambulante Comercial', 'Ambulante No Comercial'] },{type:"text"} ]});
        });

		</script>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table id="results">
                    <thead>
                    </thead>
                    <tbody>
                    </tbody>
					<tfoot>
						<tr>
 	                        <td>${message(code: 'sala.codigo.label', default: 'Codigo')}</td>
                            <td>${message(code: 'sala.nombre.label', default: 'Nombre')}</td>
                            <td>${message(code: 'sala.codigoPostal.label', default: 'Codigo Postal')}</td>
							<td>${message(code: 'sala.tipo.label', default: 'Tipo')}</td>
							<td>${message(code: 'sala.exhibidor.label', default: 'Exhibidor')}</td>
						</tr>
					<tfoot>	
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${salaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
