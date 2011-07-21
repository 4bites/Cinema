package cinema

class DdjjVideo {
    String periodo
    Integer cantidadTotalVenta
    Integer precioTotalVenta
    Integer gravamenTotalVenta
    Integer cantidadTotalAlquiler
    Integer precioTotalAlquiler
    Integer gravamenTotalAlquiler

    static belongsTo = [videoClub:VideoClub]
    static hasMany = [peliculas:Pelicula]
    static constraints = {
        videoClub(nullable:true)
		periodo(nullable:false)
		cantidadTotalVenta()
		precioTotalVenta()
		gravamenTotalVenta()
		cantidadTotalAlquiler()
		precioTotalAlquiler()
		gravamenTotalAlquiler()
    }
}
