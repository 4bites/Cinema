package cinema

class VideoClub extends Empresa{
    static hasMany = [locales:Local, ddjjs:DdjjVideo, pagos:PagoRegistry]
	PersonaFisica personaFisica;
	PersonaJuridica personaJuridica;
	static mapping = {
		locales cascade: 'none'
		ddjjs   cascade: 'none'
	 	pagos   cascade: 'none'
	}	
    static constraints = {
    }
}
