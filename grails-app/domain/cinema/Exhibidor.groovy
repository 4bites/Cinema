package cinema

class Exhibidor extends Empresa{
    static hasMany = [salas:Sala, pagos:Pago, bocs:Boc, ddjjs:DdjjExhibidor]
	static mapping = {
		salas cascade: 'none'
		pagos cascade: 'none'
		bocs  cascade: 'none'
		ddjjs cascade: 'none'
	}	
    static constraints = {
    }
}
