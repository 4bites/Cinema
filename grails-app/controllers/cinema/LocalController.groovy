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
			try{
				local.save()
				flash.message = "Local guardado satisfactoriamente"
				redirect action:"show", id: local.id
			}catch(Exception e){
				local.errors.reject("local.denied",null,
                 "Los datos ingresados no matchean con los permisos [ ${session.restrictions['local'].collect{'('+it.replaceAll('it\\.','')+')'}.join(' and ')} ]")
				render view:"create", model:[localInstance: local]
			}
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
