package cinema

class Pelicula {
    long codigo
    String titulo
	Date fechaEstreno
    Productor productor
	Distribuidor distribuidor
    static constraints = {
        codigo(max:99999999999999)
        titulo(maxLength:70)
        fechaEstreno(nullable:false)
    }
}
