package cinema

class Pelicula {
    Integer codigo
    String titulo
    Date fechaEstreno
    static hasMany = [distribuidores:Distribuidor]
    static belongsTo = [productor:Productor] 
    static constraints = {
        codigo()
        titulo()
        fechaEstreno()
    }
}
