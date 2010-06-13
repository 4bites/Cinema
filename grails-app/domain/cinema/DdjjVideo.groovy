package cinema

class DdjjVideo {
    Date fecha
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
	fecha(nullable:false, min:new Date())
	cantidadTotalVenta()
	precioTotalVenta()
	gravamenTotalVenta()
	cantidadTotalAlquiler()
	precioTotalAlquiler()
	gravamenTotalAlquiler()
    }
}
