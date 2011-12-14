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
			ddjj.save()
			flash.message = "Ddjj de video club guardada satisfactoriamente"
			redirect action:"show", id: ddjj.id
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
		searcher(params)
	}	
}
