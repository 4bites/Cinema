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
        videoClub()
		periodo()
		cantidadTotalVenta()
		precioTotalVenta()
		gravamenTotalVenta()
		cantidadTotalAlquiler()
		precioTotalAlquiler()
		gravamenTotalAlquiler()
    }

	static def show_columns = {
		["periodo", "videoClub.to_string", "cantidadTotalVenta", "precioTotalVenta", "gravamenTotalVenta", "cantidadTotalAlquiler", "precioTotalAlquiler", "gravamenTotalAlquiler"]
	}
}
