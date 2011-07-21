package cinema

class Local {
	String codigo
	String nombre
	String Domicilio
	String codigoPostal
	Provincia provincia
	Localidad localidad
	String telefono
	String email
	Date fechaApertura	
    static belongsTo = [video:VideoClub] 
    static constraints = {
		codigo(unique:true)
    }
}
