package cinema

class BocEgreso {
	Integer desde
    Integer hasta
    String serie
    Date fechaAlta
    Integer cantidad

    static belongsTo = [exhibidor:Exhibidor]
    static constraints = {
        desde(blank:false, validator: {val, obj -> val < obj.hasta})
        hasta()
        serie(nullable:false, matches:"[A..Z]")
        cantidad(max: 9999)
    }

}
