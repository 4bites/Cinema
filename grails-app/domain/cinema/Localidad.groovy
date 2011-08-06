package cinema

class Localidad {

	String name

	static belongsTo = [ provincia: Provincia ]
    static constraints = {
    }

	static def show_columns = {
        ["name"]
    }

}
