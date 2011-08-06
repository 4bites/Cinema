package cinema

class BocIngreso {
    Integer desde
    Integer hasta
    String serie
    Date fechaAlta
    public Integer getCantidad(){
		return hasta - desde + 1
	}
    
	static transients = ['cantidad']

    static belongsTo = [exhibidor:Exhibidor]
    static constraints = {
		desde(blank:false, validator: {val, obj -> val < obj.hasta}) 
		hasta()
		serie(nullable:false, matches:"A|B|C|D|E|Z")
//		cantidad(max: 9999, validator: {val, obj -> val == obj.hasta - obj.desde + 1})	
		exhibidor(nullable:true)	
    }
}
