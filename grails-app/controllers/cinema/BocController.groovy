package cinema
import grails.converters.*

class BocController {
	def scaffold = true
	def index = { }

    def save = {
        def boc
        if(params.id){
            boc = Boc.get(params.id)
        } else {
            boc = new Boc()
        }
        boc.properties = params.findAll{ it.key != 'exhibidor'}
        boc.fechaAlta = new Date()
//		boc.exhibidor = Exhibidor.get(params.int('exhibidor.id'))
		boc.exhibidor = params["exhibidor.id"]?Exhibidor.get(params["exhibidor.id"]):null
        if(boc.validate() && boc."${params.accion}"()){
			flash.message="${params.accion} de boc satisfactoria"
            redirect action:(boc.id?"show":"list"), id: boc.id
        } else {
            render view:"create", model:[bocInstance: boc]
        }
    }

	def entrega = {
		def boc = Boc.get(params.id)
		boc.accion = 'entrega'
		render view:"create", model:[bocInstance: boc]	
	} 
	def baja = {
		def boc = Boc.get(params.id)
		boc.baja()
		list()
	}

	def devolucion = {
		def boc = Boc.get(params.id)
		boc.devolucion()
		render view:"show", model:[bocInstance: boc]
	}

    def update = {
        save()
    }

    def edit = {
        def boc = Boc.get(params.id)
        render view:"create", model:[bocInstance: boc]
    }
	
	def lookFor = {
		def bocs
		if(params.accion == 'alta'){
			bocs = Boc.findAllBySerie(params.serie, [sort:"desde"])
		} else if(params.accion == 'devolucion'){
			if(params.exhibidor){
                def exhibidor = Exhibidor.get(params.exhibidor)
                bocs = Boc.findAllBySerieAndExhibidor(params.serie, exhibidor, [sort:"desde"])
            }else{
				bocs = []
			}
		}else if(params.accion in ['baja','entrega']){
			bocs = Boc.findAllBySerieAndExhibidorIsNull(params.serie, [sort:"desde"])
		}else{	
			bocs = []
		}
		render bocs as JSON
	}

    def search = {
        searcher(params)
    }
}
