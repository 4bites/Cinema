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
		def p 
		if(params.id){
			p = PersonaJuridica.get(params.id)
			p.properties=params.findAll{ it.key != "pJuridicaPFisicas.personaFisica" && it.key != "pJuridicaFisicas.cargo"}
		}else{
			p = new PersonaJuridica(params.findAll{ it.key != "pJuridicaPFisicas.personaFisica" && it.key != "pJuridicaPFisicas.cargo"})
		}
		if(p.save()){
			p.pJuridicaPFisicas.each{
				print "eliminando... $it.personaFisica.apellido"
				PFisicaPJuridica.unlink(it.personaFisica, p)
			}
		    params.list("pJuridicaPFisicas.personaFisica").eachWithIndex{ pf,i ->
				if(pf){
					println "pf:$pf"
					def cuit = pf.split(" cuit:")[1]
					def pFisica = PersonaFisica.findByCuit(cuit)
					//def pFisica = PersonaFisica.findByNombreAndApellido(pf.split(" ")[0],pf.split(" ")[1])
					if(pFisica){
						def fj = PFisicaPJuridica.link(pFisica, p, params.list("pJuridicaPFisicas.cargo").get(i))
						println fj.personaFisica.cuit + " " + fj.personaJuridica.cuit + " " + fj.id
					}
				}
			} 		
			redirect(action:"show", model: [personaJuridicaInstance:p])
		}else{
			def map = [personaJuridicaInstance: p]
			render(view:"create", model: map)
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
	
}
