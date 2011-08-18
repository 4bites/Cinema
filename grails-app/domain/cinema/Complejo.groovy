package cinema

class Complejo {
	Integer codigo
	String denominacion
	Date fechaApertura
	static hasMany = [salas:Sala]

    static constraints = {
		codigo(unique:true)
		denominacion(blank:false)
		fechaApertura(nullable:false)
    }

	static def show_columns = {
		["codigo","denominacion","fechaApertura"]
	}
}
