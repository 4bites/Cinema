package cinema

class Empresa {
    Integer codigo
	String cuit
    Date fechaInicioActividad
    Date fechaFinActividad
    Date fechaUltimaRevalida
    static belongsTo = [personaFisica:PersonaFisica, personaJuridica:PersonaJuridica]

    static constraints = {
        codigo(unique:true)
        fechaInicioActividad()
        fechaFinActividad()
        fechaUltimaRevalida()
    }
}
