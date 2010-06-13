package cinema

class Pago {
    static belongsTo = [videoClub:VideoClub, exhibidor:Exhibidor]
    static constraints = {
    }
}
