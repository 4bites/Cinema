package cinema

class Empresa {
    Integer codigo
    Date fechaInicioActividad
    Date fechaFinActividad
    Date fechaUltimaRevalida
    static belongsTo = [personaFisica:PersonaFisica, personaJuridica:PersonaJuridica]
	static mapping = {
        personaFisica lazy: false
		personaJuridica lazy: false
    }
    static constraints = {
        codigo(unique:true)
        fechaInicioActividad()
        fechaFinActividad(nullable:true, blank: true)
        fechaUltimaRevalida()
		personaJuridica(nullable:true, validator: {val, obj -> val == null && obj.personaFisica != null || val != null && obj.personaFisica == null})
		personaFisica(nullable:true, validator: {val, obj -> val == null && obj.personaJuridica != null || val != null && obj.personaJuridica == null})
    }

	def desc = {
		personaFisica? "${personaFisica.nombre} ${personaFisica.apellido} cuit:${personaFisica.cuit}" : "${personaJuridica?.razonSocial} cuit:${personaJuridica?.cuit}"
	}

	static def show_columns = {
		["codigo", "personaFisica", "personaJuridica"]
	}
}
