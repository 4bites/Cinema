package cinema

class VideoClub extends Empresa{
	static auditable = true

    static hasMany = [locales:Local, ddjjs:DdjjVideo, pagos:PagoRegistry]
	PersonaFisica personaFisica;
	PersonaJuridica personaJuridica;
	static mapping = {
		locales cascade: 'none'
		ddjjs   cascade: 'none'
	 	pagos   cascade: 'none'
	}	
    static constraints = {
        personaFisica(validator:{ val, obj ->
			if(!(val != null ^ obj.personaJuridica != null)){
				return "onlyone"
			}	
            if(!obj.id && val && VideoClub.countByPersonaFisica(val) > 0)
                return "unique"
        })
        personaJuridica(validator:{ val, obj ->
			if(!(val != null ^ obj.personaFisica != null)){
                return "onlyone"
            }
            if(!obj.id && val && VideoClub.countByPersonaJuridica(val) > 0)
                return "unique"
        })
    }
}
