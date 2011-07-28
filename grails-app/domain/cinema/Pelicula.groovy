package cinema

class Pelicula {
    Long codigo
    String titulo
	Date fechaEstreno
    Productor productor
	Distribuidor distribuidor
    static constraints = {
        codigo(max:99999999999999)
        titulo(maxLength:70, blank:false)
        fechaEstreno(nullable:false)
    }
}
