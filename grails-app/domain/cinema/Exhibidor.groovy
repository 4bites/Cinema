package cinema

class Exhibidor extends Empresa{
    static hasMany = [salas:Sala, pagos:Pago]
    static constraints = {
    }
}
