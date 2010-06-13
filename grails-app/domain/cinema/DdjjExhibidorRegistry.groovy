package cinema

class DdjjExhibidorRegistry {
	Integer periodoFiscal
	Integer dia
	Integer mes
	Integer anio
	String hora
	Integer renglon
	String tipoFuncion
	Sala sala
	Pelicula pelicula
	String serieBOC
	Integer numeroInicialBOC
	Integer precioBasico
	Integer impuesto
	Integer precioVenta
	Integer cantidadEntradas
	Integer impuestoTotal
	static belongsTo = [ddjjExhibidor:DdjjExhibidor]
    static constraints = {
		periodoFiscal(blank:false,range:1..4)
		dia(range:1..31)
		mes(range:1..12)
		anio(nullable:false)
		hora(matches:"(([0]?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]))")
		renglon(nullable:false)
		tipoFuncion(inList:["BASE","DEVO"])
		sala(nullable:false,validator:{ val, obj -> 
			val.exhibidor.codigo == obj.properties['ddjjExhibidor'].exhibidora.codigo }) 
		pelicula(nullable:false)
		
	}
}

