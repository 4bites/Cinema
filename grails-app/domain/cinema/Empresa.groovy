package cinema

class Empresa {
    Integer codigo
    Date fechaInicioActividad
    Date fechaFinActividad
    Date fechaUltimaRevalida
    static belongsTo = [personaFisica:PersonaFisica, personaJuridica:PersonaJuridica]

    static constraints = {
        codigo(unique:true)
        fechaInicioActividad()
        fechaFinActividad(nullable:true)
        fechaUltimaRevalida()
		personaJuridica(nullable:true, validator: {val, obj -> val == null && obj.personaFisica != null || val != null && obj.personaFisica == null})
		personaFisica(nullable:true, validator: {val, obj -> val == null && obj.personaJuridica != null || val != null && obj.personaJuridica == null})
    }
}
