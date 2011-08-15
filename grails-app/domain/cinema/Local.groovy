package cinema

class Local {
	String codigo
	String nombre
	String domicilio
	String codigoPostal
	Provincia provincia
	Localidad localidad
	String telefono
	String email
	Date fechaApertura	
    static belongsTo = [video:VideoClub] 
    static constraints = {
		codigo(unique:true, blank:false)
		nombre(blank:false)
		domicilio(blank:false)
		codigoPostal(blank:false)
		telefono(blank:false)
		email(email:true)
		provincia(nullable:false, validator: {
            return (it.id != 0)
        })
        localidad(nullable:false, validator: {
            return (it.id != 0)
        })
    }

	static def show_columns = {
		["codigo", "nombre", "codigoPostal", "provincia.name", "fechaApertura"]
	}
}
