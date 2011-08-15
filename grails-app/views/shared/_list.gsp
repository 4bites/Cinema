 <script type="text/javascript" charset="utf-8">

        $(document).ready(function() {
            $('#results').dataTable( {
                "bProcessing": true,
                "bDeferRender": true,
                //"bServerSide": true,
				"bAutoWidth": true,
				"sAjaxSource": "${createLink(mapping:mapping, params:[dom:params.dom], action:'search')}",	
                "aoColumns": [ <%=domain.show_columns().collect{"{\"mDataProp\":\"$it\",\"sDefaultContent\":\"-\"}"}.join(",") %>
                ],
                fnRowCallback: function(nRow, aData, iDisplayIndex) {
                    $(nRow).click(function(){
//                        location.href = "/${domain.simpleName.decapitalize()}/show/"+aData["id"];
						location.href = "${createLink(mapping:mapping, params:[dom:params.dom,_dummy:''], action:'show')}&id="+aData["id"];
                    });
                    return nRow;
                }   
            }).columnFilter({"aoColumns":[ ${domain.filter()} ]});
        });
        </script>


				<table id="results">
                    <thead>
                        <tr>
                            <g:each in="${domain.show_columns()}" var=" field" >
                            <td>${field.tokenize(".")[0].humanField()}</td>
                            </g:each>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <g:each in="${domain.show_columns()}" var=" field" >
                            <th>${field.tokenize(".")[0].humanField()}</th>
                            </g:each>
                        </tr>
                    </tfoot>

                </table>

