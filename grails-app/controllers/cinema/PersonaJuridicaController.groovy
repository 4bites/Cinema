package cinema

class PersonaJuridicaController {
    def scaffold = true
	static navigation = [
		group:'menu', 
		order:3, 
		action:'create',
		subItems: [
			[action:'create',order:1, title:'Alta'],
			[action:'update',order:2, title:'Modificar'],
			[action:'list',order:3, title:'Listar']
		]
	]
    def index = { }
}
