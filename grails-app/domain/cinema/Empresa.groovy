package cinema
import java.text.SimpleDateFormat

class Empresa {
	static SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy")
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

	static def show_columns = {
		["codigo", "personaFisica.to_string", "personaJuridica.razonSocial"]
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

}
