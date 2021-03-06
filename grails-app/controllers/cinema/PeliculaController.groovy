package cinema
import cinema.*

class PeliculaController {
    def scaffold = true
/*	static navigation = [
		group:'menu', 
		order:4, 
		action:'create',
		subItems: [
			[action:'create',order:1, title:'Alta'],
			[action:'update',order:2, title:'Modificar'],
			[action:'list',order:3, title:'Listar']
		]
	]*/
    def index = { }

	def save = {
		Pelicula pelicula
		if(params.id){
			pelicula = Pelicula.get(params.id)
	        pelicula.properties = params.findAll{it.key != "distribuidor" && it.key != "productor"}
		}else{
			pelicula = new Pelicula(params.findAll{it.key != "distribuidor" && it.key != "productor"})
		}
		pelicula.distribuidor = Distribuidor.get(params["distribuidor.id"])
		pelicula.productor = Productor.get(params["productor.id"])
		pelicula.fechaEstreno = (params.fechaEstreno != '' ? Empresa.dateFormat.parse(params.fechaEstreno):null)
		try{
			if(pelicula.save()){
				flash.message = "Pelicula guardada satisfactoriamente."
				redirect action:"show", id: pelicula.id
	        } else{
    	        render view:"create", model:[peliculaInstance: pelicula]
        	}
		}catch(Exception e){
			pelicula.errors.reject("pelicula.denied",null,
                 "Los datos ingresados no matchean con los permisos [ ${session.restrictions['pelicula'].collect{'('+it.replaceAll('it\\.','')+')'}.join(' and ')} ]")	
			render(view:"create", model:[peliculaInstance: pelicula])
		}		
	}

    def update = {
        save()
    }

    def edit = {
        def pelicula = Pelicula.get(params.id)
        render view:"create", model:[peliculaInstance:pelicula]
    }
	
	def search = {
		searcher(params, session.restrictions["pelicula"])
	}
}
