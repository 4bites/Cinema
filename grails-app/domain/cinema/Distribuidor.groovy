package cinema

class Distribuidor extends Empresa{
	static auditable = true

    static hasMany = [peliculas:Pelicula]
    static belongsTo = Pelicula  
    static constraints = {
		personaFisica(unique:true)
		personaJuridica(unique_:true)
    }

	static mapping = {
		peliculas cascade: 'none'
	}
}
