package cinema

class Pago {
	Date fecha
	String file
		
	static hasMany = [pagoReg: PagoRegistry]
    static constraints = {
    }
}
