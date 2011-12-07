package cinema

class Local {
	static auditable = true

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
		nombre(blank:false, maxSize: 40)
		domicilio(blank:false, maxSize:255)
		codigoPostal(blank:false, maxSize:10)
		telefono(blank:false, maxSize:255)
		email(email:true, maxSize:255)
		provincia(nullable:false, validator: {
            return (it.id != null)
        })
        localidad(nullable:false, validator: {
            return (it.id != null)
        })
    }

	static def show_columns = {
		["codigo", "nombre", "codigoPostal", "provincia.name", "fechaApertura"]
	}
}
