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
		println "fechaInicio: $empresa.fechaInicioActividad"
		if(params.personaFisica){
			def cuit = params.personaFisica.split(" cuit:").length==2?params.personaFisica.split(" cuit:")[1]:""
        	def pFisica = PersonaFisica.findByCuit(cuit)
			empresa.personaFisica = pFisica
			empresa.personaJuridica = null	
		} else if(params.personaJuridica){
			def cuit = params.personaJuridica.split(" cuit:").length==2?params.personaJuridica.split(" cuit:")[1]:""
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

	def delete = {
		def empresa = grailsApplication.getDomainClass("cinema.$params.dom").clazz.get(params.id)
		try {
			empresa.delete()
			flash.message = "Empresa eliminada"
            redirect uri:"/empresas/$params.dom/list"
		} catch(Exception e) {
			flash.message = "No se pudo eliminar la empresa por tener pagos, bocs o salas"
            render view:"show", model:[empresaInstance:empresa]
		}
/*        if (empresa.clazz.name=="Exhibidor" && (DdjjExhibidor.findByExhibidor(empresa) || PagoRegistry.findByEmpresa(empresa) || Sala.findByExhibidor(empresa)) 
			|| empresa.clazz.name=="Productor" && (Pelicula.findByProductor(empresa) || ){
            flash.message = "No se pudo eliminar la Persona Física por pertenecer a alguna empresa o persona jurídica."
            render view:"show", model:[personaFisicaInstance:person]
        } else {
            person.delete()
            flash.message = "Persona Fisica eliminada"
            redirect action:"list"
        }
*/			
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
			def map = ["id":it.id, "codigo": it.codigo]
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

	def controlPagos = {
		def results = Empresa.controlPagos(params.desde, params.hasta)
		def map = [:]
		map.aaData = results.values()
		map.sEcho = null
		map.iTotalRecords = results.size()
        map.iTotalDisplayRecords = map.iTotalRecords			
		render map as JSON
	}
	
	def controlPagosList = {
		render view:"controlPagos"
	}

	def revalidas = {
        def results = Empresa.controlRevalidas()
        def map = [:]
        map.aaData = results
        map.sEcho = null
        map.iTotalRecords = results.size()
        map.iTotalDisplayRecords = map.iTotalRecords
        render map as JSON
	}

	def revalidasList = {
		render view:"controlRevalidas"
	}

	def sendRevalidasByMail = {
		sendMail {
    	    to "nosotros@4bites.com.ar", "germadevanesa@gmail.com", "javier.iseruk@gmail.com", "julio@tuozzo.com.ar", "diego.rossotti@citi.com", "gabrielmarcos2001@gmail.com"
        	subject "Reválidas de empresas vencidas o próximas a vencer"
        	body( view:"mailTemplate", model:[empresas:Empresa.controlRevalidas()])
//			html Empresa.controlRevalidas()
		}
		render "Enviado" 
	}
 		

}
