package cinema

class Localidad {

	String name

	static belongsTo = [ provincia: Provincia ]
    static constraints = {
    }
}
