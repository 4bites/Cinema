
<%@ page import="cinema.Empresa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'empresa.label', default: params.dom)}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Control de Pagos</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">

		<script type="text/javascript" charset="utf-8">

        $(document).ready(function() {
            var oTable = $('#results').dataTable( {
				"oLanguage": {
                    "sUrl": "/js/jquery/dataTables.spanish.txt"
                },
                "bProcessing": true,
                "bDeferRender": true,
                "bServerSide": false,
                "bAutoWidth": true,
                "sAjaxSource": "${createLink(mapping:mapping, params:[dom:params.dom], action:'controlPagos')}?desde=&hasta=",
                "aoColumns": [ <%=["periodo","empresa","codigo", "impuestoTotal","impuestoDeclarado", "diferencia"].collect{"{\"mDataProp\":\"$it\",\"sDefaultContent\":\"-\"}"}.join(",") %>
                ]
            });
			
			function refreshTable(urlData){
		      //Retrieve the new data with $.getJSON. You could use it ajax too
		      $.getJSON(urlData, null, function( json ){
			      	oSettings = oTable.fnSettings();
        			oTable.fnClearTable(this);

			        for (var i=0; i<json.aaData.length; i++){
			        	oTable.oApi._fnAddData(oSettings, json.aaData[i]);
        			}

			        oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
        			oTable.fnDraw();
      			});
    		}
			$('#buscar').click(function(){
				refreshTable("${createLink(mapping:mapping, params:[dom:params.dom], action:'controlPagos')}?desde="+$('#desde').val()+"&hasta="+$('#hasta').val());
			});

        });
        </script>
				desde<input type="text" name="desde" id="desde">hasta<input type="text" name="hasta" id="hasta"><input type="button" value="buscar" name="buscar" id="buscar">

                <table id="results">
                    <thead>
                        <tr>
                            <g:each in='${["periodo","cuit","codigo", "impuestoTotal","impuestoDeclarado", "diferencia"]}' var=" field" >
                            <td>${field.tokenize(".")[0].humanField()}</td>
                            </g:each>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
