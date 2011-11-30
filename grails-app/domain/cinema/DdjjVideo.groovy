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
		periodo()
		cantidadTotalVenta(range:0..99999999)
		precioTotalVenta(min:0)
		gravamenTotalVenta()
		cantidadTotalAlquiler(range:0..99999999)
		precioTotalAlquiler(min:0)
		gravamenTotalAlquiler()
    }

	static def show_columns = {
		["periodo", "videoClub.to_string", "cantidadTotalVenta", "precioTotalVenta", "gravamenTotalVenta", "cantidadTotalAlquiler", "precioTotalAlquiler", "gravamenTotalAlquiler"]
	}
}
