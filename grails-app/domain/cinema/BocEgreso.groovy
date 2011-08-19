package cinema

class BocEgreso {
	Integer desde
    Integer hasta
	Integer cantidad = 0
    String serie
    Date fecha
	String tipo

	static mapping = {
      cantidad formula: 'HASTA - DESDE + 1'
    }

    static belongsTo = [exhibidor:Exhibidor]
    static constraints = {
        desde(blank:false, validator: {val, obj -> !obj.hasta || val < obj.hasta})
        hasta(blank:false, validator: {val, obj -> !obj.desde || val > obj.desde})
		serie(nullable:false, matches:"A|B|C|D|E|Z")
		tipo(inList:['ENTREGA','DEVOLUCION'])
		exhibidor(nullable: true, validator: { val, obj, errors ->
			if(obj.tipo	== 'DEVOLUCION' && !val){
				errors.rejectValue("exhibidor", "exhibidor", null, "El exhibidor es obligatorio cuando se trata de una devolución")
			}
		})
    }

	static def show_columns = {
        ["desde", "hasta","serie","cantidad","exhibidor.to_string", "tipo"]
    }

}
