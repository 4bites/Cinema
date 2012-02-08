package cinema

class DdjjVideoController {
/* 	static navigation = [
		group:'menu', 
		order:11, 
		action:'create',
		subItems: [
			[action:'create',order:1, title:'Alta'],
			[action:'update',order:2, title:'Modificar'],
			[action:'list',order:3, title:'Listar']
		]
	]*/
   	def scaffold = true
    def index = { }
	
	def save = {
		def ddjj
		if(params.id){
			ddjj = DdjjVideo.get(params.id)
			ddjj.properties = params.findAll{it.key != "videoClub"}
		} else {
			ddjj = new DdjjVideo(params.findAll{it.key != "videoClub"})
		}	
		if(ddjj.validate()){
			try {
				ddjj.save()
				flash.message = "Ddjj de video club guardada satisfactoriamente"
				redirect action:"show", id: ddjj.id
			}catch (Exception e){
				ddjj.errors.reject("ddjj.denied",null,
                    "Los datos ingresados no matchean con los permisos [ ${session.restrictions['ddjjVideo'].collect{'('+it.replaceAll('it\\.','')+')'}.join(' and ')} ]")
				render view:"create", model:[ddjjVideoInstance: ddjj]
            }
		} else { 
			render view:"create", model:[ddjjVideoInstance: ddjj]
		}
	}

    def edit = {
        def ddjj = DdjjVideo.get(params.id)
        render view:"create", model:[ddjjVideoInstance:ddjj]
    }

	def update = {
		save()
	}
	def search = {
		searcher(params, session.restrictions["ddjjVideo"])
	}	
}
