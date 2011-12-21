

<%@ page import="cinema.Boc" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'boc.label', default: 'Boc')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
		<style>
			.ui-button { margin-left: -1px; }
			.ui-button-icon-only .ui-button-text { padding: 0.35em; } 
			.ui-autocomplete-input { margin: 0; padding: 0.48em 0 0.47em 0.45em; }
		</style>
        <link rel="stylesheet" href="${resource(dir:'css',file:'boc_styles.css')}" />

		<g:javascript library="jquery/jquery.ui.autocomplete" />
      
		<script type="text/javascript" charset="utf-8">
             $.expr[':'].textEquals = function (a, i, m) {
                return $(a).text().match("^" + m[3] + "$");
            };

            $(document).ready(function() {
                    $('#exhibidor').autocomplete({
                        source: function(request, response) {
                            $.ajax({
                                url: "${createLink(controller:'empresa', action:'autocomplete', params:[dom:'Exhibidor'])}",
                                dataType: "json",
                                data: {
                                    term: request.term
                                },
                                success: function(data) {
                                    response($.map(data, function(item) {
                                        return {
											label: (item.nombre?item.nombre+" "+item.apellido:item.razonSocial)+", Codigo: "+item.codigo,
                                            value: (item.nombre?item.nombre+" "+item.apellido:item.razonSocial)+", Codigo: "+item.codigo,

                                            //label: (item.nombre?item.nombre+" "+item.apellido+" cuit:"+item.cuit:item.razonSocial+" cuit:"+item.cuit),
                                            //value: (item.nombre?item.nombre+" "+item.apellido+" cuit:"+item.cuit:item.razonSocial+" cuit:"+item.cuit),
                                            title: item.id
                                        }
                                    }))
                                }
                            })
                        },
                        minLength: 1,
                        change: function(event, ui) {
                            if ($(".ui-autocomplete li:textEquals('" + $(this).val() + "')").size() == 0){
                                $(this).val('');
								$('#exhibidor\\.id').val('');
                            }
                        },
                        select: function(event, ui) {
                            $('#exhibidor\\.id').val(ui.item.title);
							if($("#accion").val()=='entrega'||$("#accion").val()=='devolucion')
								populateDesde();
                        }


                    });
					$("#exhibidor").blur(function(){
						if($(this).val() == ''){
							$("#exhibidor\\.id").val('');
							populateDesde();
  						}
					});

	                    $("#accion").change( function(event, ui) {
							if($(this).val() == 'entrega' || $(this).val() == 'devolucion'){
	                            $("label[for='exhibidor']").html("Exhibidor*");
							}else{
                                $("label[for='exhibidor']").html("Exhibidor");
 							}
							$("#exhibidor").val('');
							$("#desde").val('');
							$("#hasta").val('');

							if($(this).val() == ''){
								$("#serie").attr('disabled', 'disabled');
							}else{
								$("#serie").removeAttr('disabled');
							}
							if($(this).val() == 'alta' || $(this).val() == 'baja' || $(this).val() == ''){
								$("#exhibidor").attr('disabled', 'disabled');
							}else{
								$("#exhibidor").removeAttr('disabled');
							}
							populateDesde();
							$("#desde").trigger('change');
                        });

					$('#accion').trigger('blur');


					$("#serie").change ( function(event, ui){
						populateDesde();
						if($(this).val() == ''){
                            $("#desde").attr('disabled', 'disabled');
							$("#hasta").attr('disabled', 'disabled');
							$("#exhibidor").attr('disabled', 'disabled');
                        }else{
                            $("#desde").removeAttr('disabled');
							$("#hasta").removeAttr('disabled');
							if($("#accion").val() == 'entrega' || $("#accion").val() == 'devolucion')	
								$("#exhibidor").removeAttr('disabled');
                       }
					});
					
					$("#serie").trigger('change');

					function populateDesde(){
						$.getJSON("${createLink(controller:'boc', action:'lookFor')}",
								{serie: $("#serie").val(), exhibidor: $("#exhibidor\\.id").val(), accion: $("#accion").val()}, function(j){
							var options;
							if($("#accion").val()=='alta'){
                            	options = '<li class="sb_filter"><label for="hasta_title">Intervalos existentes. (El valor no debe pertenecer a ninguno)</label></li>';
							}else{
                            	options = '<li class="sb_filter"><label for="hasta_title">Intervalos disponibles. (El valor debe pertenecer a alguno)</label></li>';
 							}
                            for (var i = 0; i < j.length; i++) {
                                options += '<li><label for="'+ j[i].desde + '..' + j[i].hasta +'">' + j[i].desde + '..'+ j[i].hasta + '</label></li>';
                            }
                            $("#desde_c").html(options);
                        });
					}	

		            $(function() {

						var $ui 		= $('#ui_element');

				/**
				* on focus and on click display the dropdown, 
				* and change the arrow image
				*/
				$ui.find('#desde').bind('focus click',function(){
					pos   = $(this).offset();
    				width = $(this).width();
   					$ui.find('.sb_down')
					   .addClass('sb_up')
					   .removeClass('sb_down')
					   .andSelf()
					   .find('.sb_dropdown')
					   .css({ "left": (pos.left + width) + "px", "top":pos.top + "px" })
					   .show();
				});
               $ui.find('#hasta').bind('focus click',function(){
                    pos   = $(this).offset();
                    width = $(this).width();
                    $ui.find('.sb_down2')
                       .addClass('sb_up2')
                       .removeClass('sb_down2')
                       .andSelf()
                       .find('.sb_dropdown2')
                       .css({ "left": (pos.left + width) + "px", "top":pos.top + "px" })
                       .show();
                });


				/**
				* on mouse leave hide the dropdown, 
				* and change the arrow image
				*/
				$ui.bind('mouseleave',function(){
					$ui.find('.sb_up')
					   .addClass('sb_down')
					   .removeClass('sb_up')
					   .andSelf()
					   .find('.sb_dropdown')
					   .hide();
				});
               $ui.bind('mouseleave',function(){
                    $ui.find('.sb_up2')
                       .addClass('sb_down2')
                       .removeClass('sb_up2')
                       .andSelf()
                       .find('.sb_dropdown2')
                       .hide();
                });


				$("#desde").bind('blur', function(){
					valid = $("#accion").val() != 'alta'?false:true;
					value = $(this).val();
					var i=0;
					var desde_arr = new Array();
					$ui.find('.sb_dropdown').children( "li" ).each(function() {
						if(i>0) {
                        	var desde = $(this).children("label:first-child").html().split("..")[0];
							var hasta = $(this).children("label:first-child").html().split("..")[1];	
							if($("#accion").val() != 'alta'){
								if ( !isNaN(parseInt(value)) && parseInt(desde) <= parseInt(value)  && parseInt(value) <= parseInt(hasta)){
									valid = true;
									var title = '<li class="sb_filter"><label for="hasta_title">El valor debe pertenecer al siguiente intervalo.</label></li>';
                            		$("#hasta_c").html(title+'<li><label for="'+ value + '..' + hasta +'">' + value + '..'+ hasta + '</label></li>');		
								}	
							}else{
								desde_arr[i-1] = parseInt(desde);
	                           	if ( !isNaN(parseInt(value)) && parseInt(desde) < parseInt(value)  && parseInt(value) < parseInt(hasta) ){
        	                        valid = false;
									return false;
            	                }   
							}
                    	}
						i++;
					});
					if ( !valid ) {
                     	$( this ).val( "" );
                      	return false;
                    }else{
                    	if($("#accion").val() == 'alta'){
							var max = 0;
							for(i=0;i<desde_arr.length && desde_arr[i]<value; i++){
								max=desde_arr[i]
							}
                            var title = '<li class="sb_filter"><label for="hasta_title">El valor debe pertenecer al siguiente intervalo.</label></li>';
                            if( i == desde_arr.length){
                                $("#hasta_c").html(title+'<li><label for="'+ value + '..">Mayor o igual a ' + value + '</label></li>');
                            }else{
                                $("#hasta_c").html(title+'<li><label for="'+ value + '..' + max +'">' + value + '..'+ (desde_arr[i]-1) + '</label></li>');
                            }
                        }
					}
					if(value==''){
						$("#hasta_c").html('<li class="sb_filter"><label for="hasta_title">El valor debe pertenecer al siguiente intervalo.</label></li>');
					}
				});

               $("#hasta").bind('blur', function(){
                    var valid = false;
                    var value = $(this).val();
					var i = 0;
                    $ui.find('.sb_dropdown2').children( "li" ).each(function() {
						if(i>0){
						if($(this).children("label:first-child").html().indexOf("Mayor") != -1){
							var desde = $(this).children("label:first-child").html().split("Mayor o igual a ")[1];
							if ( !isNaN(parseInt(value)) && parseInt(desde) <= parseInt(value)){
								valid = true;
							}
						}else{
                        	var desde = $(this).children("label:first-child").html().split("..")[0];
                        	var hasta = $(this).children("label:first-child").html().split("..")[1];    
                        	if ( !isNaN(parseInt(value)) && parseInt(desde) <= parseInt(value)  && parseInt(value) <= parseInt(hasta)){
                            	valid = true;
                        	}
						}  
						}
						i++; 
                    });
                    if ( !valid ) {
                        $( this ).val( "" );
                        return false;
                    }
                });
	
            });

            });
        </script>
	
    </head>
    <body>
		<bean:errorClass>errors</bean:errorClass> 		
        <div class="body">
            <h1><g:message code="default.${bocInstance?.id?'edit':'create'}.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bocInstance}">
            <div class="errors">
                <g:renderErrors bean="${bocInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="get">
				<g:if test="${bocInstance?.id}">
                    <g:hiddenField name="id" value="${bocInstance?.id}" />
                    <g:hiddenField name="version" value="${bocInstance?.version}" />
                </g:if>

                <div class="dialog">
                    <table id="ui_element">
                        <tbody>
						 <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accion"><g:message code="boc.accion.label" default="Accion*" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocInstance, field: 'accion', 'errors')}">
                                    <g:select name="accion" id="accion" noSelection="${['':'Seleccionar...']}"
                                              from="${['alta','baja','entrega', 'devolucion']}" 
                                              value="${bocInstance?.accion}"
                                              />

                                </td>
                            </tr>
							<bean:select beanName="bocInstance" property="serie" noSelection="${['':'Seleccionar...']}"
                                              from="${['A','B','C', 'D', 'E', 'Z']}"  disabled="true"/>
                        <tr class="prop" style="height:35px">
                                <td valign="top" class="name">
                                    <label for="desde"><g:message code="boc.desde.label" default="Desde*" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocInstance, field: 'desde', 'errors')}">
                                    <div class="sb_wrapper">
                                    <g:textField name="desde" class="sb_input"  value="${bocInstance?.desde}" disabled="true"/><span class="sb_down"></span>
                                    <ul class="sb_dropdown" style="display:none;" id="desde_c">
                                        <li class="sb_filter"><span for="desde_title">Intervalos disponibles</span></li>
                                    </ul>
                                    </div>
                                </td>
                            </tr>
                           <tr class="prop" style="height:35px">
                                <td valign="top" class="name">
                                    <label for="hasta"><g:message code="boc.hasta.label" default="Hasta*" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocInstance, field: 'hasta', 'errors')}">
                                    <div class="sb_wrapper2">
                                    <g:textField name="hasta" class="sb_input"  value="${bocInstance?.hasta}" disabled="true"/><span class="sb_down2"></span>
                                    <ul class="sb_dropdown2" style="display:none;" id="hasta_c">
                                        <li class="sb_filter">Elija campo "Desde" primero</li>
                                    </ul>
                                    </div>
                                </td>
                            </tr>
 
						<bean:withBean beanName="bocInstance">
                            <!--bean:input property="desde" maxLength="9" /-->
                            <!--bean:input property="hasta" maxLength="9" /-->
                            <!--bean:select property="serie" noSelection="${['':'Seleccionar...']}"
                                              from="${['A','B','C', 'D', 'E', 'Z']}"  /-->
                            <!--bean:input property="exhibidor" size="40" value="${bocInstance&&bocInstance.exhibidor?bocInstance.exhibidor.desc():''}"/-->
							<!--input type="hidden" name="exhibidor.id" id="exhibidor.id" value="${bocInstance?.exhibidor?.id}"/-->
                        </bean:withBean>
							
                            <tr class="prop" style="height:30px">
                                <td valign="top" class="name">
                                    <label for="exhibidor"><g:message code="boc.exhibidor.label" default="Exhibidor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bocInstance, field: 'exhibidor', 'errors')}">
                                    <g:textField name="exhibidor" value="${bocInstance?.exhibidor?.desc()}"  size="40" disabled="true"/>
									<input type="hidden" name="exhibidor.id" id="exhibidor.id" value="${bocInstance?.exhibidor?.id}"/>
                                </td>
                            </tr>
                        
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
