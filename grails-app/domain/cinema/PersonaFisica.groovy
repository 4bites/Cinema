package cinema

class PersonaFisica {
    String nombre
    String apellido
    String cuit
    DocumentType tipoDocumento
    Integer numeroDocumento
    Gender sexo
    String domicilio
    String codigoPostal
    Provincia provincia
    Localidad localidad
    String telefono
    String email
    String condicionIVA
//    static hasMany = [personasJuridicas:PersonaJuridica]
//	List pFisicaPJuridicas
	static hasMany = [pFisicaPJuridicas:PFisicaPJuridica]
    static constraints = {
        cuit(unique:true, blank:false, matches:/^[0-9]{2}-[0-9]{8}-[0-9]$/)
        nombre(blank:false)
        apellido(blank:false)
        tipoDocumento(blank:false)
        numeroDocumento(nullable:false)
        sexo(blank:false)
        domicilio(blank:false)
        codigoPostal(blank:false)
        provincia(nullable:false, validator: {
            return (it.id != 0)
    	})
        localidad(nullable:false, validator: {
            return (it.id != 0)
    	})
        telefono(nullable:false, blank:false)
        email(email:true, blank:false)
        condicionIVA(nullable:false, validator: {
			return (it != '0')
		})
    }

	public String toString(){
		"$nombre $apellido"
	}
}
