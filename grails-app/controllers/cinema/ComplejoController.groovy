package cinema
import grails.converters.*

class ComplejoController {
    def scaffold = true
    
    def index = { }

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
