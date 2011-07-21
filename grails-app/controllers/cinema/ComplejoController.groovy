package cinema
import grails.converters.*

class ComplejoController {
    def scaffold = true
    
    def index = { }

	  def autocomplete = {
        def complejos = Complejo.findAllByDenominacionIlike(params.term+'%')
        
        render complejos as JSON
    }

}
