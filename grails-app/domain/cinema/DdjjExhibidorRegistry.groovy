package cinema
import java.math.BigDecimal

class DdjjExhibidorRegistry {
	Integer periodoFiscal
	Integer dia
	Integer mes
	Integer anio
	String hora
	Integer renglon
	String tipoFuncion
	Sala sala
	Exhibidor exhibidor
	Pelicula pelicula
	Distribuidor distribuidor
	String serieBOC
	String numeroInicialBOC
	BigDecimal precioBasico
	BigDecimal impuesto
	BigDecimal precioVenta
	Integer cantidadEntradas
	BigDecimal impuestoTotal
	static belongsTo = DdjjExhibidor
	//static transients = ['exhibidor','sala','distribuidor']
    static constraints = {
		periodoFiscal(blank:false,range:1..4)
		dia(range:1..31)
		mes(range:1..12)
		anio(nullable:false)
		hora(matches:"(([0]?[0-9]|1[0-9]|2[0-3]):[0-5][0-9])")
		renglon(nullable:false)
		tipoFuncion(inList:["BASE","DEVO"])
		// el codigo de la sala pertenece al exhibidor que presenta la ddjj
		//sala(nullable:false,validator:{ val, obj -> 
		//	val.exhibidor.codigo == obj.properties['ddjjExhibidor'].exhibidora.codigo })
		// el codigo de exhibidor es igual al exhibidor que presenta la ddjj
		//ddjjExhibidor(nullable:false, validator:{val, obj ->
		//	val.exhibidora.codigo == obj.properties['exhibidor'].codigo })
		 
		//pelicula(nullable:false)
		
	}

	public DdjjExhibidorRegistry(){
		DdjjExhibidorRegistry.metaClass.pepe = ""
	}

	void validateSala(){
		if(sala.exhibidor.codigo != ddjjExhibidor.exhibidora.codigo){
			this.errors.rejectValue("sala", "error.message.code", "La sala no pertenece al exhibidor")
		}
	}

	void validateExhibidor(){
		if(exhibidor.codigo != ddjjExhibidor.exhibidora.codigo){
			this.errors.rejectValue("exhibidor", "error.message.code", "El codigo de exhibidor no corresponde al que presenta la ddjj")
		}
	}

}

