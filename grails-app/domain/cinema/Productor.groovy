package cinema

class Productor extends Empresa{
    static hasMany = [peliculas:Pelicula]
    static constraints = {
    }
}
