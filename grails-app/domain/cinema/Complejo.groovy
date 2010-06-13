package cinema

class Complejo {
	Integer codigo
	String denominacion
	String domicilio
	Date fechaApertura
	static hasMany = [salas:Sala]

    static constraints = {
		codigo(unique:true)
		denominacion(blank:false)
		domicilio(blank:false)
		fechaApertura(min:new Date())
    }
}
