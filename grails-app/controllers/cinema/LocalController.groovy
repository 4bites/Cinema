package cinema

class LocalController {
	def scaffold = true

    def index = { }

	def save = {
		def local
		if(params.id){
			local = Local.get(params.id)
		} else {
			local = new Local()
		}
		local.properties = params.findAll{it.key != "video"}
		if(local.validate()){
			local.save()
			flash.message = "Local guardado satisfactoriamente"
			redirect action:"show", id: local.id
		} else {
			render view:"create", model:[localInstance: local]
		} 
	}

	def edit = {
		def local = Local.get(params.id)
		render view:"create", model:[localInstance: local]
	}

    def update = {
        save()
    }
	
	 def search = {
        searcher(params, session.restrictions["local"])
	}
}
