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
	String[] registry
	static belongsTo = [ddjj:DdjjExhibidor]
	static transients = ['registry']
    static constraints = {
		periodoFiscal(blank:false,range:1..4, validator:{ val, obj, errors ->
			def dias = []
			switch (val){
				case 1:
					if(obj.dia < 1 || obj.dia > 7)
						dias = [1,7] 
				case 2:
					if(obj.dia < 8 || obj.dia > 15)
						dias = [8,15]
				case 3:
        	        if(obj.dia < 16 || obj.dia > 22)
            	        dias = [16, 22]
				case 4:
                    if(obj.dia < 22)
                        dias = [22, 'fin del mes']
			}
			if(dias.size > 0)
				errors.rejectValue("periodoFiscal","periodoFiscal",["${val}"]+dias as Object[],"El período fiscal [{0}] debe corresponder con los días del mes [{1}] al [{2}]")
		})
		dia(range:1..31, validator:{val, obj, errors -> 
			def formatValid
				try{
					def dateParser = new java.text.SimpleDateFormat("d.M.yyyy")
					dateParser.lenient = false	
					dateParser.parse("${val}.${obj.mes}.${obj.anio}")
					formatValid = true
					if(obj.hora == '0'){
						return
					}
					dateParser = new java.text.SimpleDateFormat("d.M.yyyy HH:mm")
					if(dateParser.parse("${val}.${obj.mes}.${obj.anio} ${obj.hora}") >= new Date())
						errors.rejectValue("dia","fechaFutura",["${val}/${obj.mes}/${obj.anio} ${obj.hora}","${dateParser.format(new Date())}"] as Object[],"La fecha [{0}] es mayor a la fecha actual [{1}]")
				} catch(Exception e){
					e.printStackTrace()
					if(!formatValid)
						errors.rejectValue("dia","fecha",["${val}/${obj.mes}/${obj.anio}",""] as Object[],"La fecha [{0}] formada por los valores de día, mes y año del registro es inválida")
				}
		})
		mes(range:1..12)
		anio(nullable:false)
		hora(validator: { val, obj, errors -> 
			try{
				if(val == '0'){
					return
				}
				def dateParser = new java.text.SimpleDateFormat("HH:mm")
                dateParser.lenient = false
				dateParser.parse("${val}")
				true
			}catch(Exception e){
				e.printStackTrace()
				errors.rejectValue("hora","hora",["${val}"] as Object[],"La hora [{0}] es inválida")
			}
		})
		renglon(nullable:false)
		tipoFuncion(inList:["BASE","DEVO"])
		impuesto(validator:{val, obj, errors ->
			if(obj.hora == '0' && val != 0){
				errors.rejectValue("impuesto","impuesto",["${val}"] as Object[],"El impuesto [{0}] debe ser 0 dado que la hora es 0") 
				return
			}
			def mc = new java.math.MathContext( 2 )					
			println "${val.multiply(10.0, mc)}, ${obj.precioBasico.add(0.0, mc)}"	
			if(val.multiply(10.0, mc) != obj.precioBasico.add(0.0, mc)){
				errors.rejectValue("impuesto","impuesto",["${val}","${obj.precioBasico}"] as Object[],"El impuesto [{0}] no es equivalente al 10% del precio básico [{1}]")
			}
		})
		impuestoTotal(validator: {val, obj, errors -> 
			if(obj.hora == '0' && val != 0){
                errors.rejectValue("impuestoTotal","impuestoTotal",["${val}"] as Object[],"El impuesto total [{0}] debe ser 0 dado que la hora es 0")                 
                return
            }
			def mc= new java.math.MathContext( 2 )
			println "${val},  ${obj.impuesto.multiply((obj.cantidadEntradas+0.0), mc)}"	
			if(val != obj.impuesto.multiply(obj.cantidadEntradas)){
				errors.rejectValue("impuestoTotal","impuestoTotal",["${val}","${obj.cantidadEntradas}","${obj.impuesto}"] as Object[],"El impuesto total [{0}] no es equivalente a la cantidad de entradas [{1}] multiplicado por el impuesto [{2}]")
			}
		})
		serieBOC(validator:{val, obj, errors ->
			if(obj.hora == '0' && val != '0'){
                errors.rejectValue("serieBOC","serieBOC",["${val}"] as Object[],"El serie de BOC [{0}] debe ser 0 dado que la hora es 0")
            }
		})
		numeroInicialBOC(validator:{val, obj, errors ->
            if(obj.hora == '0' && val != '0'){
                errors.rejectValue("numeroInicialBOC","numeroInicialBOC",["${val}"] as Object[],"El número de primer BOC [{0}] debe ser 0 dado que la hora es 0")
            }
        })
       	precioBasico(validator:{val, obj, errors ->
            if(obj.hora == '0' && val != 0){
                errors.rejectValue("precioBasico","precioBasico",["${val}"] as Object[],"El precio básico [{0}] debe ser 0 dado que la hora es 0")
            }
        })
		precioVenta(validator:{val, obj, errors ->
            if(obj.hora == '0' && val != 0){
                errors.rejectValue("precioVenta","precioVenta",["${val}"] as Object[],"El precio de venta [{0}] debe ser 0 dado que la hora es 0")
            }
        })
       	cantidadEntradas(validator:{val, obj, errors ->
            if(obj.hora == '0' && val != 0){
                errors.rejectValue("cantidadEntradas","cantidadEntradas",["${val}"] as Object[],"La cantidad de entradas [{0}] debe ser 0 dado que la hora es 0")
            }
        })
		tipoFuncion(inList:['BASE','DEVO'], validator:{val, obj, errors ->
            if(obj.hora == '0' && val != 'BASE'){
                errors.rejectValue("tipoFuncion","tipoFuncion",["${val}"] as Object[],"El tipo de funcion [{0}] debe ser BASE dado que la hora es 0")
            }
        })
		pelicula(nullable: true,validator:{val, obj, errors ->
			if(obj.hora == '0'){
				if(obj.registry[8]!='99999999'){
					errors.rejectValue("pelicula","pelicula",["${obj.registry[8]}"] as Object[],"El codigo de película [{0}] debe ser 99999999 dado que la hora es 0")
				}
			}else if(val == null){
				errors.rejectValue("pelicula","pelicula",["${obj.registry[8]}"] as Object[],"El codigo de película [{0}] no corresponde a ninguna película válida")
			} 
				
		})
		distribuidor(nullable: true,validator:{val, obj, errors ->
            if(obj.hora == '0'){
                if(obj.registry[8]!='99999999'){
                    errors.rejectValue("distribuidor","distribuidor",["${obj.registry[11]}"] as Object[],"El codigo de distribuidor [{0}] debe ser 99999999 dado que la hora es 0")
                }
            }else if(val == null){
                errors.rejectValue("distribuidor","distribuidor",["${obj.registry[11]}"] as Object[],"El codigo de distribuidor [{0}] no corresponde a ningun distribuidor valido")
            }else if(val != obj.pelicula.distribuidor){
				errors.rejectValue("distribuidor","distribuidor",["${obj.registry[11]}","${obj.registry[8]}"] as Object[],"El distribuidor [{0}] no es el distribuidor de la película [{1}]")
			}

        })
		sala(validator:{val, obj, errors ->
			if(val.exhibidor != obj.exhibidor){
				errors.rejectValue("sala","sala",["${obj.sala.codigo}","${obj.distribuidor.codigo}"] as Object[],"La sala [{0}] no pertenece al exhibidor [{1}]")
			}
		})
		exhibidor(validator:{ val, obj, errors ->
			if(val != obj.ddjj.exhibidora){
				errors.rejectValue("exhibidor","exhibidor",["${val.codigo}","${obj.ddjj.exhibidora.codigo}"] as Object[],"El exhibidor [{0}] difiere del exhibidor [{1}] que presenta la ddjj")
			}	
		})
		// el codigo de la sala pertenece al exhibidor que presenta la ddjj
		//sala(nullable:false,validator:{ val, obj -> 
		//	val.exhibidor.codigo == obj.properties['ddjjExhibidor'].exhibidora.codigo })
		// el codigo de exhibidor es igual al exhibidor que presenta la ddjj
		//ddjjExhibidor(nullable:false, validator:{val, obj ->
		//	val.exhibidora.codigo == obj.properties['exhibidor'].codigo })
		 
		//pelicula(nullable:false)
		
	}

	static def cols(){
		["periodoFiscal", "mes", "anio", "exhibidor","sala","renglon","dia","hora","pelicula","tipoFuncion","pelicula_titulo","distribuidor","distribuidor_cuit","serieBOC","numeroInicialBOC","precioBasico","impuesto","precioVenta","cantidadEntradas","impuestoTotal"]
	}

    static def show_columns(){
        ["periodoFiscal", "dia", "mes", "anio", "hora", "sala.codigo","tipoFuncion","pelicula.titulo","distribuidor.codigo","precioBasico","impuesto","precioVenta","cantidadEntradas","impuestoTotal"]
    }

	def original_value = { prop ->
		registry[cols().indexOf(prop)]
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

