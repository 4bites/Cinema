package cinema

class BocIngresoController {
	def scaffold = true

    def index = { }

	def save = {
		def boc
		if(params.id){
			boc = BocIngreso.get(params.id)
		} else {
			boc = new BocIngreso()
		}
		boc.properties = params.findAll{ it.key != 'exhibidor'}
		if(boc.validate()){
			boc.save()
			redirect action:"show", id: boc.id
		} else {
			render view:"create", model:[bocIngresoInstance: boc]
		}
	}
	
	def update = {
		save()
	}

	def edit = {
        def boc = BocIngreso.get(params.id)
        render view:"create", model:[bocIngresoInstance: boc]
    }

	def search = {
		searcher(params)
	}	
}
