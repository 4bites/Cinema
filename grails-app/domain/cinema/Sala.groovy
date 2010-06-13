package cinema

class Sala {
    Integer codigo
    String nombre
    String domicilio
    String codigoPostal
    String provincia
    String localidad
    String email
    Date fechaInicioActividad
    String tipo
    String frecuencia
    Date fechaRenovacion
    String sistemaProyeccion
    Integer capacidad
    static belongsTo = [exhibidor:Exhibidor, complejo:Complejo]
    static hasMany = [diasExhibicion:Dia, ddjjSalas:DdjjSala]
   
    static constraints = {
		codigo(nullable:false, min:1, max:999999)
		nombre(nullable:false)
		domicilio(nullable:false)
		codigoPostal(nullable:false)
		provincia(nullable:false)
		localidad(nullable:false)
		email(email:true)
		fechaInicioActividad(min:new Date())
		tipo(nullable:false)
		frecuencia(nullable:false)
		fechaRenovacion()
		sistemaProyeccion()
		capacidad(min:1, nullable:false)
	
    }
}
