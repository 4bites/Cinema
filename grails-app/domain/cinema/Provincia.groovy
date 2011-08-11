package cinema

class Provincia {


	String name
    static constraints = {
    }

	static hasMany = [localidades: Localidad]
	
	static def select = {
		Provincia.list().collect{"['${it.name}','${it.name}']"}.join(",")
	}
	
	public String toString(){
        name
    }

	static def show_columns = {
		["name"]
	}
}
