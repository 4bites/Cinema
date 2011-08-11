package cinema

class Localidad {

	String name

	static belongsTo = [ provincia: Provincia ]
    static constraints = {
    }

	public String toString(){
        name
    }

	static def show_columns = {
        ["name"]
    }

}
