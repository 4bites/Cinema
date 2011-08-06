package cinema
import grails.converters.*

class PersonaJuridicaController {
    def scaffold = true
/*	static navigation = [
		group:'menu', 
		order:3, 
		action:'create',
		subItems: [
			[action:'create',order:1, title:'Alta'],
			[action:'update',order:2, title:'Modificar'],
			[action:'list',order:3, title:'Listar']
		]
	]*/
    def index = { }

	def save = {
		print params
		def p 
		if(params.id){
			p = PersonaJuridica.get(params.id)
			p.properties=params.findAll{ it.key != "pJuridicaPFisicas.personaFisica" && it.key != "pJuridicaFisicas.cargo"}
		}else{
			p = new PersonaJuridica(params.findAll{ it.key != "pJuridicaPFisicas.personaFisica" && it.key != "pJuridicaPFisicas.cargo"})
		}
		if(p.validate()){
			p.save()
//			p.pJuridicaPFisicas.each{
			PFisicaPJuridica.findAllByPersonaJuridica(p)?.each{
				print "eliminando... $it.personaFisica.apellido"
				PFisicaPJuridica.unlink(it.personaFisica, p)
			}
		    params.list("pJuridicaPFisicas.personaFisica").eachWithIndex{ pf,i ->
				if(pf){
					def cuit = pf.split(" cuit:")[1]
					def pFisica = PersonaFisica.findByCuit(cuit)
					//def pFisica = PersonaFisica.findByNombreAndApellido(pf.split(" ")[0],pf.split(" ")[1])
					if(pFisica){
						println pFisica.nombre + " " + params.list("pJuridicaPFisicas.cargo").get(i)
						def fj = PFisicaPJuridica.link(pFisica, p, params.list("pJuridicaPFisicas.cargo").get(i))
						println fj.personaFisica?.cuit + " " + fj.personaJuridica?.cuit + " " + fj.id
					}
				}
			}
//			p.save()	 		
			redirect action:"show", id: p.id
		}else{
			println "Invalido!!!"
			params.list("pJuridicaPFisicas.personaFisica").eachWithIndex{ pf,i ->
        	    if(pf){
            	    def cuit = pf.split(" cuit:")[1]
					def desc = pf.split(" cuit:")[0]
                	def pFisica = new PersonaFisica(nombre:desc.split(" ")[0],apellido:desc.split(" ")[1],cuit:cuit)
                	def pfj = new PFisicaPJuridica(personaFisica:pFisica, cargo:params.list("pJuridicaPFisicas.cargo").get(i))
                	p.pJuridicaPFisicas << pfj
            	}
        	}
			print "personaJuridicaInstance.pJuridicaPFisicas:"+p.pJuridicaPFisicas
			def map = [personaJuridicaInstance: p]
			render(view:"create", model: map)
		}
	}	

	def update = {
		save()
	}

	def edit = {
        def pj = PersonaJuridica.get(params.id)
        render view:"edit", model:[personaJuridicaInstance:pj]
    }

	def autocomplete = {
	    def p = PersonaJuridica.createCriteria()
        def pJuridicas = p.list {
            ilike('razonSocial', params.term + '%')
        }
        render pJuridicas as JSON
	}

	def search = {
		searcher(params) //search(params)
/*		def dataToRender = [:]
    	dataToRender.sEcho = params.sEcho
	    dataToRender.aaData=[]                
    	dataToRender.iTotalRecords = PersonaJuridica.count()
	    dataToRender.iTotalDisplayRecords = dataToRender.iTotalRecords
		def criteria = PersonaJuridica.createCriteria()
		def results = criteria.list {
			if(params.sSearch){
				or{
					params.findAll{it.key.startsWith("mDataProp_")}.each { 
						def prop = it.value.replaceAll("aaData.","")
						if(prop.tokenize(".").size()==1){ 
							like prop, params.sSearch+"%"
						}
					}
				}
			} else {
				and {
					params.findAll{it.key.startsWith("mDataProp_")}.eachWithIndex {  param, i ->
                        def prop = param.value.replaceAll("aaData.","").tokenize(".")
                        if(params["sSearch_$i"]) {
                            like prop[0], params["sSearch_$i"]+"%"
                        }
                    }
				}
			}
			maxResults(params.int('iDisplayLength'))
		    firstResult(params.int('iDisplayStart'))
			params.findAll{it.key.startsWith("iSortCol_")}.eachWithIndex { param, i ->
        	    def prop = params["mDataProp_${param.value}"].replaceAll("aaData.","")
				def sortDir = params["sSortDir_$i"]
				println "${param.value} ${params["mDataProp_${param.value}"]} $prop $sortDir}"
                if(prop.tokenize(".").size()==1){
                	order prop, sortDir
                }
           	}

		}

		dataToRender.aaData = results

		render dataToRender as JSON*/
	}
	
}
