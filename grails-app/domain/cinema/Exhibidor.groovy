package cinema

class Exhibidor extends Empresa{
    static hasMany = [salas:Sala, pagos:Pago, bocs:Boc]
/*	static mapping = {
		salas cascade:'none'
		pagos cascade:'none'
		bocs  cascade: 'none'
	}*/	
    static constraints = {
    }
}
