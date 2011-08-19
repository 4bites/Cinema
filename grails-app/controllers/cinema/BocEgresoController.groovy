package cinema
import static cinema.Empresa.dateFormat

class BocEgresoController {
	def scaffold = true

    def index = { }

	def save = {
		def boc
		if(params.id){
			boc = BocEgreso.get(params.id)
		} else {
			boc = new BocEgreso()
		}
		boc.properties = params.findAll{ it.key != 'exhibidor'}
		boc.fecha = (params.fecha ? dateFormat.parse(params.fecha):null)
		if(boc.validate()){
			boc.save()
			redirect action:"show", id: boc.id
		} else {
			render view:"create", model:[bocEgresoInstance: boc]
		}
	}
	
	def update = {
		save()
	}

	def edit = {
        def boc = BocEgreso.get(params.id)
        render view:"create", model:[bocEgresoInstance: boc]
    }

	def search = {
		searcher(params)
	}	
}
