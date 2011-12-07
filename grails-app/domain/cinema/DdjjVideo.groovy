package cinema

class DdjjVideo {
	static auditable = true

    String periodo
    Integer cantidadTotalVenta
    Integer precioTotalVenta
    BigDecimal gravamenTotalVenta
    Integer cantidadTotalAlquiler
    Integer precioTotalAlquiler
    BigDecimal gravamenTotalAlquiler

    static belongsTo = [videoClub:VideoClub]

	static mapping = {
    	gravamenTotalVenta formula: 'precio_total_venta * 0.1'
		gravamenTotalAlquiler formula: 'precio_total_alquiler * 0.1'
 	}
 
    static constraints = {
        videoClub()
		periodo(size:6..7)
		cantidadTotalVenta(range:0..999999999)
		precioTotalVenta(range:0..999999999)
		gravamenTotalVenta()
		cantidadTotalAlquiler(range:0..99999999)
		precioTotalAlquiler(range:0..999999999)
		gravamenTotalAlquiler()
    }

	static def show_columns = {
		["periodo", "videoClub.to_string", "cantidadTotalVenta", "precioTotalVenta", "gravamenTotalVenta", "cantidadTotalAlquiler", "precioTotalAlquiler", "gravamenTotalAlquiler"]
	}
}
