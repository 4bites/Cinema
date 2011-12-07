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
		/*
		def multi = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2]
		def numDoc = params.documento.replaceAll("\\.","")
		def sexNum = (params.sexo=='MASCULINO'?'20':'27')
		def doc = (sexNum+numDoc).toList()
		doc.eachWithIndex { obj,i -> 
			multi[i] = Integer.valueOf(obj)*multi[i]
		}
		def resto = multi.sum()%11
		def verif
		if(resto == 0){
			verif = 0
		} else if(resto == 1){
			verif = (sexNum == '27' ? 4 : 9)
			sexNum = '23'
		} else {
			verif = 11- multi.sum()%11 
		}
		def c = [cuit: "$sexNum-$params.documento-$verif"]
		*/
		def c = [cuit:PersonaFisica.calculateCuit(params.sexo, params.documento)]
		render c as JSON
	}

	def autocomplete = {
		def p = PersonaFisica.createCriteria()
		def pFisicas = p.list {
            ilike('nombre', params.name_startsWith + '%')
        }
		if(params.empresa){
			pFisicas = pFisicas.findAll{ grailsApplication.getDomainClass("cinema.$params.empresa").clazz.countByPersonaFisica(it) == 0 } 
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
		render view:"create", model:[personaFisicaInstance:person]
	}
	
	def delete = {
		def person = PersonaFisica.get(params.id)
		if (Empresa.findByPersonaFisica(person) || PFisicaPJuridica.findByPersonaFisica(person)){
			flash.message = "No se pudo eliminar la Persona Fisica por pertenecer a alguna empresa o persona juridica."
			render view:"show", model:[personaFisicaInstance:person]
		} else {
			person.delete()
			flash.message = "Persona Fisica eliminada"	
			redirect action:"list"
		}
	}

	def search = {
		searcher(params)
	}

}
