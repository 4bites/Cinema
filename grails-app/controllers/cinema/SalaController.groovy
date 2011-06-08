package cinema

class SalaController {
    def scaffold = true
/*	static navigation = [
		group:'menu', 
		order:8, 
		action:'create',
		subItems: [
			[action:'create',order:1, title:'Alta'],
			[action:'update',order:2, title:'Modificar'],
			[action:'list',order:3, title:'Listar']
		]
	]*/
    def index = { }

	def save = {
		def sala	
		if(params.id){
            sala = Sala.get(params.id)
			sala.properties = params.findAll{it.key != "exhibidor"}
		} else {
            sala = new Sala(params.findAll{it.key != "exhibidor"})
        }
		if(params["exhibidor.id"]){
			sala.exhibidor = Exhibidor.get(params["exhibidor.id"])
		}
		if(sala.validate()) {
			def dias = []
			params.diasExhibicion.each{
				print "dia:$it"
				dias << Dia.byId(it)
				//sala.addToDiasExhibicion(Dia.byId(it))
			}
			sala.diasExhibicion = dias
			try{ 
				sala.save()
			}catch(Exception e){
				e.printStackTrace()
			}
			redirect action:"show", id: sala.id
		} else{
			render view:"create", model:[salaInstance: sala]
		}
	}

	 def update = {
        save()
    }

    def edit = {
        def sala = Sala.get(params.id)
        render view:"create", model:[salaInstance:sala]
    }


}
