package cinema

class PFisicaPJuridica {
	
//	PersonaFisica personaFisica
//	PersonaJuridica personaJuridica
	String cargo
	static belongsTo = [personaFisica: PersonaFisica, personaJuridica: PersonaJuridica]	
    static constraints = {
    }

	static PFisicaPJuridica link(pFisica, pJuridica, cargo) {
		def pp = PFisicaPJuridica.findByPersonaFisicaAndPersonaJuridica(pFisica, pJuridica)
		if (!pp)
		{
			pp = new PFisicaPJuridica()
			pp.cargo = cargo
//			pp.personaFisica = pFisica
//			pp.personaJuridica = pJuridica
			pFisica?.addToPFisicaPJuridicas(pp)
			pJuridica?.addToPJuridicaPFisicas(pp) 
			pp.save()
		}
		return pp
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
