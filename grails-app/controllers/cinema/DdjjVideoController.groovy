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

    def edit = {
        def ddjj = DdjjVideo.get(params.id)
        render view:"create", model:[ddjjVideoInstance:ddjj]
    }

	
}
