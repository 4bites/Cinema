<%@ page import="cinema.Empresa"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'empresa.label', default: params.dom)}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Reválida de empresas</h1>
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
                "sAjaxSource": "${createLink(mapping:mapping, params:[dom:params.dom], action:'revalidas')}",
                "aoColumns": [ <%=Empresa.show_columns().collect{"{\"mDataProp\":\"empresa.$it\",\"sDefaultContent\":\"-\"}"}.join(",") %>, {"mDataProp":"revalida_status","sDefaultContent":"-"}]
            });
		
			$("#load_callback").click(function(){  
    			$("#result")  
        			.html("enviando...")  
        			.load("${createLink(mapping:mapping, params:[dom:params.dom], action:'sendRevalidasByMail')}", null, function(responseText){  
	            		this.html(responseText);  
        			});  
			});  	
        });
        </script>
				<input type="button" id="load_callback" value="Enviar mail ahora" /><span id="result"></span>
                <table id="results">
                    <thead>
                        <tr>
                            <g:each in='${Empresa.show_columns()}' var=" field" >
                            <td>${field.tokenize(".")[0].humanField()}</td>
                            </g:each>
							<td>Status de reválida</td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
