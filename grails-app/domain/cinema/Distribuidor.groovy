package cinema

class Distribuidor extends Empresa{
	static auditable = true

    static hasMany = [peliculas:Pelicula]
    static belongsTo = Pelicula  
    PersonaFisica personaFisica
    PersonaJuridica personaJuridica
    static constraints = {
        personaFisica(validator:{ val, obj ->
            if(!(val != null ^ obj.personaJuridica != null)){
                return "onlyone"
            }
            if(!obj.id && val && Distribuidor.countByPersonaFisica(val) > 0)
                return "unique"
        })
        personaJuridica(validator:{ val, obj ->
            if(!(val != null ^ obj.personaFisica != null)){
                return "onlyone"
            }
            if(!obj.id && val && Distribuidor.countByPersonaJuridica(val) > 0)
                return "unique"
        })
    }

	static mapping = {
		peliculas cascade: 'none'
	}
}
