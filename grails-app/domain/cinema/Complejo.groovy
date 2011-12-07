package cinema

class Complejo {
	static auditable = true

	Integer codigo
	String denominacion
	Date fechaApertura
	static hasMany = [salas:Sala]

    static constraints = {
		codigo(unique:true, max:999999999)
		denominacion(blank:false, size:1..100)
    }

	static def show_columns = {
		["codigo","denominacion","fechaApertura"]
	}
}
