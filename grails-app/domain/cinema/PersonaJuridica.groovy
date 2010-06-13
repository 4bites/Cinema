package cinema

class PersonaJuridica {
    String RazonSocial
    String cuit
    String tipoSociedad
    String condicionIVA
    String direccion
    String codigoPostal
    String provincia
    String localidad
    String telefono
    String email
    static hasMany = [personas:PersonaFisica]
    static belongsTo = PersonaFisica

    static constraints = {
        RazonSocial(nullable:false)
	cuit(nullable:false, unique:true)
	tipoSociedad(nullable:false)
	condicionIVA(nullable:false)
	direccion(nullable:false)
	codigoPostal(nullable:false)
	provincia(nullable:false)
	localidad(nullable:false)
	telefono(nullable:false)
	email(email:true)
	
    }

    toString(){
        "Persona Juridica"
    }
}
