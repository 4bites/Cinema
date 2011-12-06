package cinema

class Productor extends Empresa{
	static auditable = true

    static hasMany = [peliculas:Pelicula]
    static constraints = {
		personaFisica(validator:{ val, obj ->
			if(val && Productor.countByPersonaFisica(val) > 0)
				return "unique"
		})
		personaJuridica(validator:{ val, obj ->
            if(val && Productor.countByPersonaJuridica(val) > 0)
                return "unique"
        })
    }

    static mapping = {
        peliculas cascade: 'none'
    }

}
