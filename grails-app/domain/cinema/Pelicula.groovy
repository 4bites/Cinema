package cinema

class Pelicula {
    Integer codigo
    String titulo
    Date fechaEstreno
    static hasMany = [distribuidores:Distribuidor]
    static belongsTo = [productor:Productor] 
    static constraints = {
        codigo(nullable:false, maxLength:14, size:1..14)
        titulo(nullable:false, maxLength:70, size:1..70)
        fechaEstreno()
    }
}
