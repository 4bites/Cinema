      var localidades = function(){
                if($("#provincia\\.id").val()=='0'){
                     $("#localidad\\.id").html("<option value='0'>Seleccionar...</option>");
                }else{
                $.getJSON("${createLink(controller:'localidad', action:'options')}",{id: $("#provincia\\.id").val()}, function(j){
                    var options = "<option value='0'>Seleccionar...</option>";
                    for (var i = 0; i < j.length; i++) {
                        options += '<option value="' + j[i].id + '">' + j[i].name + '</option>';
                    }
                    $("#localidad\\.id").html(options);
                })
                }
            }
        $(function(){
            $("#provincia\\.id").change(localidades);
            //$(document).ready(localidades);
        })
 

 
