package cinema
import cinema.*
import grails.converters.*

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
		empresa.fechaInicioActividad = (params.fechaInicioActividad != '' ? Empresa.dateFormat.parse(params.fechaInicioActividad):null)
		empresa.fechaFinActividad = (params.fechaFinActividad != '' ? Empresa.dateFormat.parse(params.fechaFinActividad):null)
		empresa.fechaUltimaRevalida = (params.fechaUltimaRevalida != '' ? Empresa.dateFormat.parse(params.fechaUltimaRevalida):null)
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

	def autocomplete = {
		def empresa = grailsApplication.getDomainClass("cinema.$params.dom").clazz
		def empresas
		if(params.term == "*"){
			empresas = empresa.list()
		} else {
			def c = empresa.createCriteria()
			empresas = c.list {
  				or{
    				personaFisica{
        				ilike("nombre", params.term+"%")
    				}
    				personaJuridica{
        				ilike("razonSocial", params.term+"%")
    				}
  				}
			}
		}
		def json = []
		empresas.each {
			def map = ["id":it.id]
			if(it.personaFisica){
				map << ["nombre":it.personaFisica.nombre, "apellido":it.personaFisica.apellido, "cuit":it.personaFisica.cuit]
			}else {
				map << ["razonSocial":it.personaJuridica.razonSocial, "cuit":it.personaJuridica.cuit]
			}
			json << map
		}
		render json as JSON	
	}

	def search = {
		searcher(params)
	}	
}
