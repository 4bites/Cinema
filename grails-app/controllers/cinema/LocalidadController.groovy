package cinema
import grails.converters.JSON

class LocalidadController {
	def scaffold = true

    def index = { }

	def options = {
		def locs = Provincia.get(Long.parseLong(params.id))?.localidades?.sort{it.name}
		render locs as JSON
	}
}
