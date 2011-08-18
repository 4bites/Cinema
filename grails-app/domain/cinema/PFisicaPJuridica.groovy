package cinema

class PFisicaPJuridica {
	
	String cargo
	static belongsTo = [personaFisica: PersonaFisica, personaJuridica: PersonaJuridica]	
    static constraints = {
		personaFisica(unique:['personaJuridica'])
		cargo(blank:false)
    }
	static mapping = {
//		personaJuridica lazy:false
	}
	static PFisicaPJuridica link(pFisica, pJuridica, cargo) {
//		def pp = pJuridica.id?PFisicaPJuridica.findByPersonaFisicaAndPersonaJuridica(pFisica, pJuridica):null
//		if (!pp)
//		{
			def pp = new PFisicaPJuridica()
		
			pp.cargo = cargo
			pp.personaFisica = pFisica
			pp.personaJuridica = pJuridica
//			pFisica?.addToPFisicaPJuridicas(pp)
//			pJuridica?.addToPJuridicaPFisicas(pp) 
			pp.validate()
//		}
		return pp
	}
	
	static def show_columns = {
        ["personaFisica", "cargo"]
    }
	
	static void unlink(pFisica, pJuridica) {
		def pp = PFisicaPJuridica.findByPersonaFisicaAndPersonaJuridica(pFisica, pJuridica)
		if (pp)
		{
			pFisica?.removeFromPFisicaPJuridicas(pp)
			pJuridica?.removeFromPJuridicaPFisicas(pp)
			pp.delete(flush:true)
		}
	}
}
