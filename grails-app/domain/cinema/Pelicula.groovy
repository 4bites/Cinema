package cinema

class Pelicula {
	static auditable = true

    Long codigo
    String titulo
	Date fechaEstreno
    Productor productor
	Distribuidor distribuidor
    static constraints = {
        codigo(max:99999999999999, unique:true)
        titulo(maxLength:70, blank:false)
        fechaEstreno(nullable:false)
    }
	
	static def show_columns(){
		["codigo", "titulo", "fechaEstreno", "productor.to_string", "distribuidor.to_string"]
	}	
}
