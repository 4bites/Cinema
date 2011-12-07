package cinema

class PersonaJuridica {
	static auditable = true

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
	//List pJuridicaPFisicas
    //static hasMany = [personas:PersonaFisica]
	static hasMany = [pJuridicaPFisicas: PFisicaPJuridica]
    //static belongsTo = PersonaFisica
    static mapping = {
//      pJuridicaPFisicas lazy:false
    }

    static constraints = {
		cuit(unique:true, blank:false, matches:/^[0-9]{2}-[0-9]{8}-[0-9]$/, maxSize:13)
		razonSocial(unique:true, blank:false, nullable:false, maxSize:255)
		tipoSociedad(blank:false)
		domicilio(blank:false, maxSize:255)
		codigoPostal(blank:false, maxSize:10)
        provincia(nullable:false, validator: {
            return (it.id != null)
        })
        localidad(nullable:false, validator: {
            return (it.id != null)
        })

		telefono(blank:false, maxSize: 255)
		email(blank:false,email:true, maxSize:255)
		condicionIVA(blank:false, validator: {
            return (it != '0')
        })
/*		pJuridicaPFisicas(validator: { pjpf ->
			pjpf.every { it.validate() }	
		})*/
    }

	public String toString(){
		razonSocial
	}
	
	static def show_columns = {
		["cuit","razonSocial","codigoPostal", "telefono", "tipoSociedad.name", "provincia.name"]
	}
}
