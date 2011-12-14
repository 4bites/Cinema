package cinema
import grails.converters.*

class ComplejoController {
    def scaffold = true
    
    def index = { }

	def save = {
		def complejo
		if(params.id){
			complejo = Complejo.get(params.id)
		} else {
			complejo = new Complejo()
		}
		complejo.properties = params
		complejo.fechaApertura = (params.fechaApertura ? Empresa.dateFormat.parse(params.fechaApertura):null)
		complejo.clearErrors()
		println complejo.fechaApertura
		if(complejo.validate()){
			complejo.save()
			flash.message = "Complejo guardado satisfactoriamente."
			redirect action:"show", id: complejo.id
		} else {
			render view:"create", model:[complejoInstance:complejo]
		}
	}

	def update = {
		save()
	}
	
	def edit = {
        def complejo = Complejo.get(params.id)
        render view:"create", model:[complejoInstance:complejo]
    }

	def autocomplete = {
		def complejos
/*		def c = List.createCriteria(); 
		results = c { 
        	rlike("name", "^[0123456789].*") 
		} */
		if(params.term == "*"){
			complejos = Complejo.list()
		} else {
        	complejos = Complejo.findAllByDenominacionRlike(params.term)
        }
        render complejos as JSON
    }

	def search = {
        searcher(params)
    }



}
