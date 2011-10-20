package cinema

class Distribuidor extends Empresa{
    static hasMany = [peliculas:Pelicula]
    static belongsTo = Pelicula  
    static constraints = {
    }

	static mapping = {
		peliculas cascade: 'none'
	}
}
