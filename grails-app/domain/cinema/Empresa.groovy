package cinema
import java.text.SimpleDateFormat

class Empresa {
	static SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy")
	static SimpleDateFormat periodFormat = new SimpleDateFormat("yyyyMM")
    Integer codigo
    Date fechaInicioActividad
    Date fechaFinActividad
    Date fechaUltimaRevalida
    static belongsTo = [personaFisica:PersonaFisica, personaJuridica:PersonaJuridica]
	static mapping = {
        personaFisica lazy: false
		personaJuridica lazy: false
    }
    static constraints = {
        codigo(unique:true)
        fechaInicioActividad()
        fechaFinActividad(nullable:true, blank: true, validator:{ val, obj, errors ->
			if(val && val < obj.fechaInicioActividad){
				errors.rejectValue("fechaFinActividad","fechaFinActividad", [dateFormat.format(val), dateFormat.format(obj.fechaInicioActividad)] as Object[],
						"La fecha de fin de actividad [{0}] debe ser mayor o igual a la fecha de inicio de actividad [{1}]")
			}
		})
        fechaUltimaRevalida( validator:{ val, obj, errors ->
			if(val){
				if(val < obj.fechaInicioActividad){
					errors.rejectValue("fechaUltimaRevalida","fechaUltimaRevalida", [dateFormat.format(val), dateFormat.format(obj.fechaInicioActividad)] as Object[],
                        "La fecha de última reválida [{0}] debe ser mayor o igual a la fecha de inicio de actividad [{1}]")
				}
				if(obj.fechaFinActividad && val > obj.fechaFinActividad){
					errors.rejectValue("fechaUltimaRevalida","fechaUltimaRevalida", [dateFormat.format(val), dateFormat.format(obj.fechaFinActividad)] as Object[],
                        "La fecha de última reválida [{0}] debe ser menor o igual a la fecha de fin de actividad [{1}]")
				}
/*				def hoy = new Date() 
				if(val > hoy){
                    errors.rejectValue("fechaUltimaRevalida","fechaUltimaRevalida", [dateFormat.format(val), dateFormat.format(hoy)] as Object[],
                        "La fecha de última reválida [{0}] debe ser menor o igual a la fecha de hoy [{1}]")
                }
*/
			}
		})
		personaJuridica(nullable:true, validator: {val, obj -> val != null ^ obj.personaFisica != null
		})
		personaFisica(nullable:true, validator: {val, obj -> val != null ^ obj.personaJuridica != null })
    }

	def desc = {
//		personaFisica? "${personaFisica.nombre} ${personaFisica.apellido} cuit:${personaFisica.cuit}" : "${personaJuridica?.razonSocial} cuit:${personaJuridica?.cuit}"
		(personaFisica? "${personaFisica.nombre} ${personaFisica.apellido}" : "${personaJuridica?.razonSocial}") + " (Código: ${codigo})"
	}

	public String toString() {
		return desc()
	}

	def cuit = {
		personaFisica?personaFisica.cuit:personaJuridica.cuit
	}

	def denominacion = {
		personaFisica? "${personaFisica.nombre} ${personaFisica.apellido}" : personaJuridica?.razonSocial
	}
	static def show_columns = {
		["codigo", "personaFisica.to_string", "personaJuridica.razonSocial", "fechaUltimaRevalida"]
	}

	static def findByPersona = { cuit ->
		def c = delegate.createCriteria()
        def empresa = c.get {
	        or{	
    	        personaFisica{
        	        eq "cuit", cuit
                }
                personaJuridica{
                    eq "cuit", cuit
                }
            }
			maxResults 1
        }
	}

	static def controlPagos = { desde, hasta ->
		use( [groovy.time.TimeCategory] ){ 
			desde = desde?desde:periodFormat.format(new Date()-1.month)
			hasta = hasta?hasta:periodFormat.format(new Date()-1.month)
		}
		print "desde: $desde, hasta: $hasta"

		def results = DdjjExhibidorRegistry.executeQuery("select d.periodo, d.exhibidor.personaFisica.cuit as empresax, sum(d.impuestoTotal) as impuestoDeclarado from DdjjExhibidorRegistry d where d.periodo between '${desde}' and '${hasta}' group by d.periodo, d.exhibidor.personaFisica.cuit union all select d.periodo, d.exhibidor.personaJuridica.cuit as empresax, sum(d.impuestoTotal) as impuestoDeclarado from DdjjExhibidorRegistry d where d.periodo between '${desde}' and '${hasta}' group by d.periodo, d.exhibidor.personaJuridica.cuit union all select d.periodo, d.videoClub.personaJuridica.cuit as empresax, sum(d.gravamenTotalVenta+d.gravamenTotalAlquiler) as impuestoDeclarado from DdjjVideo d where d.periodo between '${desde}' and '${hasta}' group by d.periodo, d.videoClub.personaJuridica.cuit union all select d.periodo, d.videoClub.personaFisica.cuit as empresax, sum(d.gravamenTotalVenta+d.gravamenTotalAlquiler) as impuestoDeclarado from DdjjVideo d where d.periodo between '${desde}' and '${hasta}' group by d.periodo, d.videoClub.personaFisica.cuit")
/*		def response = []
		results.each { res ->
			response << [periodo: res[0], empresa: res[1], impuestoTotal:res[2], impuestoDeclarado: res[3], diferencia: res[4]]
		}
		response
*/
		def resp = [:]
		results.each { res ->
			resp[[res[0], res[1]]] = [periodo: res[0], empresa: res[1], impuestoTotal:res[2], impuestoDeclarado:0, diferencia:res[2]]
		} 

		def pagos = PagoRegistry.executeQuery("select p.periodo, p.empresa.personaJuridica.cuit as empresax, sum(p.importeAbonado) as impuestoAbonado from PagoRegistry p  where p.periodo between '${desde}' and '${hasta}' group by p.periodo, p.empresa.personaJuridica.cuit union all select p.periodo, p.empresa.personaFisica.cuit as empresax, sum(p.importeAbonado) as impuestoAbonado from PagoRegistry p where p.periodo between '${desde}' and '${hasta}' group by p.periodo, p.empresa.personaFisica.cuit")

		pagos.each { pago ->
			if(resp[[pago[0], pago[1]]]){
				resp[[pago[0], pago[1]]].impuestoDeclarado = pago[2]
				resp[[pago[0], pago[1]]].diferencia = resp[[pago[0],pago[1]]].impuestoTotal - pago[2]
			} else {
				resp[[pago[0],pago[1]]] = [periodo: pago[0], empresa: pago[1], impuestoTotal: 0, impuestoDeclarado: pago[2], diferencia: -pago[2] ]
			}
		}	
		resp
	}

	static def controlRevalidas = {
		use( groovy.time.TimeCategory ){
			def vencidas = new Date()-4.year
			def porVencer = vencidas+1.month
			def vencidasOPorVencer = Empresa.findAllByFechaUltimaRevalidaLessThan(porVencer)
			def results = []
			vencidasOPorVencer.each {
				results << [empresa: it, revalida_status : it.fechaUltimaRevalida < vencidas ? "VENCIDA":"PROXIMA A VENCER" ]
			}
			results
		}
	}


}
