package cinema

class Pago {
	Date fecha
	String file
		
	static hasMany = [pagoRegs: PagoRegistry]
    static constraints = {
    }

	static def show_columns = {
		["fecha", "file"]
	}

	def validateUniqueness = { pagoRegs ->
		def map = [:]
		def valid = true
		pagoRegs.each {
			if(map[[it.registry[0], it.codigoImpuesto, it.anio, it.mes, it.cuota]]){
				map[[it.registry[0], it.codigoImpuesto, it.anio, it.mes, it.cuota]] << it
			} else {
				map[[it.registry[0], it.codigoImpuesto, it.anio, it.mes, it.cuota]] = [it]
			}
		}
		map.each{ key, value ->
			if(value.size > 1){
				value.each {
					it.errors.reject("uniqueness",[it.registry[0], it.codigoImpuesto, it.anio, it.mes, it.cuota] as Object[], 
						"La combinación CUIT [{0}] / Código de Impuesto [{1}] / Año [{2}]/ Mes [{3}] / Cuota [{4}] debe ser única" )
				}
				valid = false
			}
		}	
		valid
	}
}
