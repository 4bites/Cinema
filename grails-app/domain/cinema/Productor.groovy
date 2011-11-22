package cinema

class Productor extends Empresa{
	static auditable = true

    static hasMany = [peliculas:Pelicula]
    static constraints = {
		personaFisica(unique:true)
		personaJuridica(unique:true)
    }

    static mapping = {
        peliculas cascade: 'none'
    }

}
