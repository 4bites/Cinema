package cinema
import cinema.*

class EmpresaController {
    def scaffold = true
    def index = { }

//	def create = {
//		render (view:"/cinema/empresa/$params.action" )
//		redirect(controller:"exhibidor", action:"create")
//	}

	def edit = {
        def empresa = grailsApplication.getDomainClass("cinema.$params.dom").clazz.get(params.id)
		println "empresa edit:${empresa.personaFisica?.nombre}"	
		render(view:"create", model:[empresaInstance:empresa])		
	}

	def save = {
		def empresa
		if(params.id){
			empresa = grailsApplication.getDomainClass("cinema.$params.dom").clazz.get(params.id)
		} else {
			empresa = grailsApplication.getDomainClass("cinema.$params.dom").newInstance()
		}	
		empresa.properties = params.findAll{ it.key != "personaFisica" && it.key != "personaJuridica" }
		if(params.personaFisica){
			def cuit = params.personaFisica.split(" cuit:")[1]
        	def pFisica = PersonaFisica.findByCuit(cuit)
			empresa.personaFisica = pFisica
			empresa.personaJuridica = null	
		} else if(params.personaJuridica){
			def cuit = params.personaJuridica.split(" cuit:")[1]
        	def pJuridica = PersonaJuridica.findByCuit(cuit)
			empresa.personaJuridica = pJuridica
			empresa.personaFisica = null
		}
		if(empresa.save()){
			println "empresa.id:$empresa.id"	
			redirect(uri:"/empresas/$params.dom/show?id=$empresa.id")
		} else {
			render(view:"create", model: [empresaInstance:empresa])	
		}
	}

	def update = {
		save()
	}

	def list = {
		def empresas = grailsApplication.getDomainClass("cinema.$params.dom").clazz.findAll()
		[empresaInstanceList: empresas, empresaInstanceTotal: empresas?.size]	
	}

	def show = {
		def empresa = grailsApplication.getDomainClass("cinema.$params.dom").clazz.get(params.id)
		[empresaInstance:empresa]
	}
}
