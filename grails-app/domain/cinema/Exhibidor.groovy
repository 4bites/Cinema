package cinema

class Exhibidor extends Empresa{
	static auditable = true

    static hasMany = [salas:Sala, pagos:Pago, bocs:Boc, ddjjs:DdjjExhibidor]
    PersonaFisica personaFisica
    PersonaJuridica personaJuridica
	static mapping = {
		salas cascade: 'none'
		pagos cascade: 'none'
		bocs  cascade: 'none'
		ddjjs cascade: 'none'
	}	
    static constraints = {
    	personaFisica(validator:{ val, obj ->
           	if(!(val != null ^ obj.personaJuridica != null)){
                return "onlyone"
            }
            if(!obj.id && val && Exhibidor.countByPersonaFisica(val) > 0)
                return "unique"
        })
        personaJuridica(validator:{ val, obj ->
            if(!(val != null ^ obj.personaFisica != null)){
                return "onlyone"
            }
            if(!obj.id && val && Exhibidor.countByPersonaJuridica(val) > 0)
                return "unique"
        })
	}
}
