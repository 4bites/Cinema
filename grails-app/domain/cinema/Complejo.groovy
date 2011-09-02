package cinema

class Complejo {
	Integer codigo
	String denominacion
	Date fechaApertura
	static hasMany = [salas:Sala]

    static constraints = {
		codigo(unique:true)
		denominacion(blank:false, size:1..100)
    }

	static def show_columns = {
		["codigo","denominacion","fechaApertura"]
	}
}
