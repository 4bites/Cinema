package cinema

class Sala {
    Integer codigo
    String nombre
    String domicilio
    String codigoPostal
    Provincia provincia
    Localidad localidad
    String email
    Date fechaInicioActividad
    String tipo
    String frecuencia
    Date fechaRenovacion
    String sistemaProyeccion
    Integer capacidad
    static belongsTo = [exhibidor:Exhibidor, complejo:Complejo]
    static hasMany = [diasExhibicion:Dia]
   
    static constraints = {
		//Inicio modificacion Gabriel Marcos
		//codigo(nullable:false, min:1, max:999999)
		codigo(unique: true, nullable:false, maxLength:11, size:1..11)
		
		//nombre(nullable:false)
		nombre(nullable:false, maxLenght:80, size:1..80)
		
		domicilio(nullable:false, maxLenght:80, size:1..80)
		codigoPostal(nullable:false, maxLenght:8, size:1..8)
		provincia(nullable:false, validator: {
            return (it.id != 0)
    	})
		localidad(nullable:false, validator: {
			return (it.id != 0)
		})
		//localidad(nullable:false)
		//Fin modificacion Gabriel Marcos
		
		email(email:true, maxLenght:60, size:1..60)
		//fechaInicioActividad(min:new Date())
		fechaInicioActividad(nullable:false)
		
		tipo(nullable:false, inList:["Comercial", "No Comercial", "Ambulante Comercial", "Ambulante No Comercial"])
		frecuencia(nullable:false)
		fechaRenovacion(validator:{ val, obj, errors ->
			if( val < obj.fechaInicioActividad){
				errors.rejectValue("fechaRenovacion", "fechaRenovacion", [Empresa.dateFormat.format(val), Empresa.dateFormat.format(obj.fechaInicioActividad)] as Object[], "la fecha de renovación de certificado [{0}] debe ser mayor o igual a la fecha de inicio de actividad [{1}]")
			}	
 		})
		sistemaProyeccion()
		capacidad(min:1, nullable:false)
		complejo(nullable: true)
    }
	
	public String toString(){
		"${nombre} (Código: ${codigo})"
	}
	static def show_columns = {
		["codigo", "nombre", "provincia.name", "localidad.name", "capacidad", "complejo.denominacion", "tipo"]
	}
	
}
