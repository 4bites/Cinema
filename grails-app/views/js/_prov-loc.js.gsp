      var localidades = function(){
                if($("#provincia").val()==''){
                     $("#localidad").html("<option value=''>Seleccionar...</option>");
                }else{
                $.getJSON("${createLink(controller:'localidad', action:'options')}",{id: $("#provincia").val()}, function(j){
                    var options = "<option value=''>Seleccionar...</option>";
                    for (var i = 0; i < j.length; i++) {
                        options += '<option value="' + j[i].id + '">' + j[i].name + '</option>';
                    }
                    $("#localidad").html(options);
                })
                }
            }
        $(function(){
            $("#provincia").change(localidades);
            //$(document).ready(localidades);
        })
 

 
