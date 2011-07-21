package cinema

class VideoClub extends Empresa{
    static hasMany = [locales:Local, ddjjs:DdjjVideo, pagos:Pago]
	PersonaFisica personaFisica;
	PersonaJuridica personaJuridica;
    static constraints = {
    }
}
