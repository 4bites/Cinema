package cinema
import grails.converters.*

class PersonaJuridicaController {
    def scaffold = true
    def index = { }
	
	def show_mini = {
    	def p = PersonaJuridica.get(params.id)
		render view:"show_include", model:[personaJuridicaInstance:p]
	}

	def save_old = {
		print params
		def p 
		if(params.id){
			p = PersonaJuridica.get(params.id)
			p.properties=params.findAll{ it.key != "pJuridicaPFisicas.personaFisica" && it.key != "pJuridicaFisicas.cargo"}
		}else{
			p = new PersonaJuridica(params.findAll{ it.key != "pJuridicaPFisicas.personaFisica" && it.key != "pJuridicaPFisicas.cargo"})
		}
//		def allPeopleOk = false
//		PersonaJuridica.withTransaction { status ->
//		if(p.validate()){
//				p.save()
				if(params.id){
//					PFisicaPJuridica.findAllByPersonaJuridica(p)?.each{
//						PFisicaPJuridica.unlink(it.personaFisica, p)
//					}
				}
				def duplicates = [:]	
				params.list("pJuridicaPFisicas.personaFisica").findAll{it}.each{
					def countRep = params.list("pJuridicaPFisicas.personaFisica").count(it)
					if(countRep > 1){
						duplicates[it]=countRep
					}
				}
				def pfpj = []
			    params.list("pJuridicaPFisicas.personaFisica").eachWithIndex{ pf,i ->
					println "ENTRO AL LOOP!!! $i"
					if(pf){
						def cuit = pf.split(" cuit:")[1]?.trim()
							def pFisica = PersonaFisica.findByCuit(cuit)
							if(pFisica){
								def fj = PFisicaPJuridica.link(pFisica, p, params.list("pJuridicaPFisicas.cargo").get(i))
								pfpj << fj
								if(fj.hasErrors()){
									fj.errors.allErrors.each {
						                println "pfpj ERRORsss: $it"
            						}
								}	
								println "personafisica $i, ${fj?.personaFisica.nombre}"
							}
					}
				}
				println "ACA TENGO PFISICAPJURIDICAS: ${p.pJuridicaPFisicas.size()}"
//		}
		if( p.validate() && pfpj.findAll{it.hasErrors()}.size() == 0 && pfpj.size() > 0 && duplicates.size()==0 ){
			println "no hay duplicados supuestamente"
//		if( p.validate() && p.pJuridicaPFisicas.size() > 0 && duplicates.size()==0){
			if(params.id){
				PFisicaPJuridica.findAllByPersonaJuridica(p)?.each{
//					if(!(it.personaFisica.cuit in pfpj.collect{it.personaFisica.cuit})){
//					if(!(it.personaFisica in p.pJuridicaPFisicas.collect{it.personaFisica})){
	            		PFisicaPJuridica.unlink(it.personaFisica, p)
						print "Elliminando $it"
//					}
            	}
			}
			p.save()
//			p.pJuridicaPFisicas.each{ 
			pfpj.each{
				it.personaFisica?.addToPFisicaPJuridicas(it)
				it.personaJuridica?.addToPJuridicaPFisicas(it) 
 
				it.save() }
			redirect action:"show", id: p.id
		}else{
			println "HAY ERRORES!!! como graba??"
			if(pfpj.size()==0){
				print "PORQUE NO MOSTRAS EL ERROR HIJO DE PUTA"
//			if(p.pJuridicaPFisicas.size() == 0){
				p.errors.rejectValue("razonSocial","personaJuridica.unlessOnePerson",null,"una persona!!")
			} 
			duplicates.each{key, val ->
				println "La persona [${key}] se encuentra mas de una vez [${val}]"
				p.errors.rejectValue("razonSocial","repetidas",[key, val] as Object[], "La persona [{0}] se encuentra mas de una vez [{1}]")
			}
			println "quedan en pfpj ${pfpj.size()}"	
			//p.pJuridicaPFisicas=pfpj
			def map = [personaJuridicaInstance: p, pfPjs:pfpj]//, status: status]
			p.errors.allErrors.each {
        		println "ERRORsss: $it"
		    }
			println "quedan en pfpj ${p.pJuridicaPFisicas.size()}"

			render view:"create", model: map
//			status.setRollbackOnly()
		}
//		} 
	}	

	def update = {
		save()
	}

	def edit = {
        def pj = PersonaJuridica.get(params.id)
        render view:"create", model:[personaJuridicaInstance:pj, pfPjs:pj?.pJuridicaPFisicas]
    }

	def autocomplete = {
	    def p = PersonaJuridica.createCriteria()
        def pJuridicas = p.list {
            ilike('razonSocial', params.term + '%')
        }
		if(params.empresa){
			pJuridicas = pJuridicas.findAll{ grailsApplication.getDomainClass("cinema.$params.empresa").clazz.findByPersonaJuridica(it)==null }
		}
		render pJuridicas as JSON
	}

	def save = {
		def p
        if(params.id){
			println "ID: $params.id"
            p = PersonaJuridica.get(params.id)
            p.properties=params.findAll{ it.key != "pJuridicaPFisicas.personaFisica" && it.key != "pJuridicaFisicas.cargo"}
        }else{
            p = new PersonaJuridica(params.findAll{ it.key != "pJuridicaPFisicas.personaFisica" && it.key != "pJuridicaPFisicas.cargo"})
        }
		PersonaJuridica.withTransaction { status ->
			def pfpj = []
//			if(p.validate()){
				println "juridica valida"
				if(params.id){
					println "pf: $p.pJuridicaPFisicas.size()"	
					PFisicaPJuridica.findAllByPersonaJuridica(p).each {
					//p.pJuridicaPFisicas.each {
						println "delete $it.personaFisica.cuit"

						it.personaFisica.removeFromPFisicaPJuridicas(it)
           				p.removeFromPJuridicaPFisicas(it)
           
						it.delete()
					}
				}
				def valid = true
				if(p.validate()){
					try{
						p.save()
					}catch(Exception e){
						p.errors.reject("personaJuridica.denied",null,
						"Los datos ingresados no matchean con los permisos [ ${session.restrictions['personaJuridica'].collect{'('+it.replaceAll('it\\.','')+')'}.join(' and ')} ]")
					}
				}
				//def pfpj = []
				params.list("pJuridicaPFisicas.personaFisica").eachWithIndex{ pf,i ->

					if(pf){
                        def cuit = pf.split(" cuit:")[1]?.trim()
						println "CUIT: $cuit"
                        def pFisica = PersonaFisica.findByCuit(cuit)
						println "PFISICA: $pFisica.nombre"
                        if(pFisica){
                            def fj = PFisicaPJuridica.link(pFisica, p, params.list("pJuridicaPFisicas.cargo").get(i))
							valid = valid && !fj.hasErrors()		
							pfpj << fj			
                        }
    	            }
				}
			//	p.validate()
				if(pfpj.size()==0){
//          if(p.pJuridicaPFisicas.size() == 0){
					valid = false	
    	            p.errors.reject("personaJuridica.unlessOnePerson",null,"una persona!!")
	            }

				if(p.hasErrors() || !valid){
//					pJuridica?.removeFromPJuridicaPFisicas(pp)
           			//p.pJuridicaPFisicas = null
					println "ROLLBACK!!!!!!"	 
					status.setRollbackOnly()
        	
					//p.provincia.merge()
					p.provincia?.localidades.each{it.read()}
					if(!params.id) p.id = null
					render view:"create", model: [personaJuridicaInstance:p, pfPjs:pfpj]	
				}else{
//					p.save()
					flash.message = "Persona juridica guardada satisfactoriamente."
					redirect action:"show", id: p.id
				}
/*			}else{
				println "juridica invalida"
				status.setRollbackOnly()
				p.provincia.localidades.each{it.read()}
				render view:"create", model: [personaJuridicaInstance:p]
			}	*/
		}
	}

	def search = {
		searcher(params, session.restrictions["personaJuridica"]) 
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
