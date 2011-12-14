package cinema
import grails.converters.*

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
			sala.properties = params.findAll{it.key != "exhibidor" && it.key != "complejo"}
		} else {
            sala = new Sala(params.findAll{it.key != "exhibidor" && it.key != "complejo"})
        }
		sala.fechaInicioActividad = (params.fechaInicioActividad != '' ? Empresa.dateFormat.parse(params.fechaInicioActividad):null)
        sala.fechaRenovacion = (params.fechaRenovacion != '' ? Empresa.dateFormat.parse(params.fechaRenovacion):null)
       
		if(params["exhibidor.id"]){
			sala.exhibidor = Exhibidor.get(params["exhibidor.id"])
		}
		if(params["complejo.id"]){
			sala.complejo = Complejo.get(params["complejo.id"])
		}
		def dias = []
	    params.list("diasExhibicion").each{
	    	print "dia:$it"
            dias << Dia.byId(it)
        }
		sala.diasExhibicion = dias	
		if(sala.validate()) {
/*			def dias = []
			params.diasExhibicion.each{
				print "dia:$it"
				dias << Dia.byId(it)
				//sala.addToDiasExhibicion(Dia.byId(it))
			}
			sala.diasExhibicion = dias*/
			try{ 
				sala.save()
				flash.message = "Sala guardada satisfactoriamente."
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

	def search = {
		searcher(params)
	}
}
