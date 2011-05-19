package cinema

class Provincia {


	String name
    static constraints = {
    }

	static hasMany = [localidades: Localidad]

}
