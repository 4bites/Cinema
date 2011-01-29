package cinema

class Boc {
    Integer desde
    Integer hasta
    String serie
    Date fecha
    String accion
    static belongsTo = [exhibidor:Exhibidor]
    static constraints = {
		accion(nullable:false, inList:["DEVOLUCION5","PEDIDO"])
		serie(nullable:false, matches:"[A..Z]")
		
    }
}
