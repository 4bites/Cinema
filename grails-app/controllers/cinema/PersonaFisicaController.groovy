package cinema
import grails.converters.*

class PersonaFisicaController {
    def scaffold = true
/*	static navigation = [
		group:'menu', 
		order:2, 
		action:'create',
		subItems: [
			[action:'create',order:1, title:'Alta'],
			[action:'update',order:2, title:'Modificar'],
			[action:'list',order:3, title:'Listar']
		]
	]*/
    def index = { }
	def cuit = {
		def multi = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2]
		def numDoc = params.documento.replaceAll("\\.","")
		def sexNum = (params.sexo=='MASCULINO'?'20':'27')
		def doc = (sexNum+numDoc).toList()
		doc.eachWithIndex { obj,i -> 
			multi[i] = Integer.valueOf(obj)*multi[i]
		}

		def verif = 11- multi.sum()%11 
		def c = [cuit: "$sexNum-$params.documento-$verif"]
		render c as JSON
	}

	def autocomplete = {
		def p = PersonaFisica.createCriteria()
		def pFisicas = p.list {
            ilike('nombre', params.name_startsWith + '%')
        }
   		render pFisicas as JSON
	}

	def save = {
		def person
		if(params.id){
			person = PersonaFisica.get(params.id)
			person.properties = params
		}else{
			person = new PersonaFisica(params)
		}
		if(person.validate() && person.save()){
			redirect action:"show", id:person.id
		} else {
			render view:"create", model:[personaFisicaInstance:person]
		}
	}

	def update = {
		save()
	}

	def edit = {
		def person = PersonaFisica.get(params.id)
		render view:"edit", model:[personaFisicaInstance:person]
	}

}
