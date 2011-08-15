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
			pelicula = Pelicula.get(id)
	        pelicula.properties = params.findAll{it.key != "distribuidor" && it.key != "productor"}
		}else{
			pelicula = new Pelicula(params.findAll{it.key != "distribuidor" && it.key != "productor"})
		}
		pelicula.distribuidor = Distribuidor.get(params["distribuidor.id"])
		pelicula.productor = Productor.get(params["productor.id"])
		if(pelicula.save()){
			redirect action:"show", id: pelicula.id
        } else{
            render view:"create", model:[peliculaInstance: pelicula]
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
		searcher(params)
	}
}
