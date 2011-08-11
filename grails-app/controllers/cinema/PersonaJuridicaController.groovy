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
		def allPeopleOk = false

		PersonaJuridica.withTransaction { status ->
//		if(p.validate()){
//				p.save()
				p.pJuridicaPFisicas.each{
					PJuridicaPFisica.unlink(it.pFisica, p)
				}	
			    params.list("pJuridicaPFisicas.personaFisica").eachWithIndex{ pf,i ->
					println "ENTRO AL LOOP!!! $i"
					if(pf){
						def cuit = pf.split(" cuit:")[1]?.trim()
						def pFisica = PersonaFisica.findByCuit(cuit)
						if(pFisica){
							def fj = PFisicaPJuridica.link(pFisica, p, params.list("pJuridicaPFisicas.cargo").get(i))
							println "personafisica $i, $fj?.personaFisica.nombre"
							allPeopleOk = (i==0 ? allPeopleOk || (fj != null && !fj.hasErrors()): allPeopleOk && (fj != null && !fj.hasErrors()))
							if(fj?.hasErrors()){
								fj.errors.allErrors.each {
									println "errores de $i, $it.code"
									p.errors.reject(it.code, "Errores en persona física")
								}
							}
						}
					}
				}
				println "ACA TENGO PFISICAPJURIDICAS: ${p.pJuridicaPFisicas.size()}"
//		}
		if(p.validate() && allPeopleOk){
			p.save()
			p.pJuridicaPFisicas.each{ it.save() }
			redirect action:"show", id: p.id
		}else{
/*			params.list("pJuridicaPFisicas.personaFisica").eachWithIndex{ pf,i ->
        	    if(pf && !unlessOnePerson){
            	    def cuit = pf.split(" cuit:")[1]
					def desc = pf.split(" cuit:")[0]
                	def pFisica = new PersonaFisica(nombre:desc.split(" ")[0],apellido:desc.split(" ")[1],cuit:cuit)
                	def pfj = new PFisicaPJuridica(personaFisica:pFisica, cargo:params.list("pJuridicaPFisicas.cargo").get(i))
                	p.pJuridicaPFisicas << pfj
					println "PORQUE DUPLICA!!! $i"
            	}
        	}*/
			if(!allPeopleOk){
				p.errors.reject("personaJuridica.unlessOnePerson")
			}
			print "personaJuridicaInstance.pJuridicaPFisicas:"+p.pJuridicaPFisicas
			def map = [personaJuridicaInstance: p, status: status]
			render(view:"create", model: map)
//			status.setRollbackOnly()
		}
		}
	}	

	def update = {
		save()
	}

	def edit = {
        def pj = PersonaJuridica.get(params.id)
        render view:"create", model:[personaJuridicaInstance:pj]
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
		render dataToRender as JSON*/
	}
	
}
