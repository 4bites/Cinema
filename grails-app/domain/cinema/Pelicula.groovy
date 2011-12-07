package cinema

class Pelicula {
	static auditable = true

    Integer codigo
    String titulo
	Date fechaEstreno
    Productor productor
	Distribuidor distribuidor
    static constraints = {
        codigo(max:999999999, unique:true)
        titulo(maxSize:70, blank:false)
        fechaEstreno(nullable:false)
    }
	
	static def show_columns(){
		["codigo", "titulo", "fechaEstreno", "productor.to_string", "distribuidor.to_string"]
	}	
}
