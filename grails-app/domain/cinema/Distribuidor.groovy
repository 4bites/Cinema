package cinema

class Distribuidor extends Empresa{
	static auditable = true

    static hasMany = [peliculas:Pelicula]
    static belongsTo = Pelicula  
    static constraints = {
        personaFisica(validator:{ val, obj ->
            if(val && Distribuidor.countByPersonaFisica(val) > 0)
                return "unique"
        })
        personaJuridica(validator:{ val, obj ->
            if(val && Distribuidor.countByPersonaJuridica(val) > 0)
                return "unique"
        })
    }

	static mapping = {
		peliculas cascade: 'none'
	}
}
