package cinema

class Productor extends Empresa{
	static auditable = true

    static hasMany = [peliculas:Pelicula]
    PersonaFisica personaFisica
    PersonaJuridica personaJuridica
    static constraints = {
		personaFisica(validator:{ val, obj ->
            if(!(val != null ^ obj.personaJuridica != null)){
                return "onlyone"
            }
			if(!obj.id && val && Productor.countByPersonaFisica(val) > 0)
				return "unique"
		})
		personaJuridica(validator:{ val, obj ->
            if(!(val != null ^ obj.personaFisica != null)){
                return "onlyone"
            }
            if(!obj.id && val && Productor.countByPersonaJuridica(val) > 0)
                return "unique"
        })
    }

    static mapping = {
        peliculas cascade: 'none'
    }

}
