package cinema

class PersonaJuridica {
    String razonSocial
    String cuit
    SocietyType tipoSociedad
    String condicionIVA
    String domicilio
    String codigoPostal
    Provincia provincia
    Localidad localidad
    String telefono
    String email
	List pJuridicaPFisicas
    //static hasMany = [personas:PersonaFisica]
	static hasMany = [pJuridicaPFisicas: PFisicaPJuridica]
    static belongsTo = PersonaFisica

    static constraints = {
		cuit(unique:true, blank:false, matches:/^[0-9]{2}-[0-9]{8}-[0-9]$/)
		razonSocial(unique:true, blank:false, nullable:false)
		tipoSociedad(nullable:false)
		domicilio(nullable:false)
		codigoPostal(nullable:false)
		provincia(nullable:false)
		localidad(nullable:true)
		telefono(nullable:false)
		email(email:true)
		condicionIVA(nullable:false)	
    }

	public String toString(){
		razonSocial
	}

}
