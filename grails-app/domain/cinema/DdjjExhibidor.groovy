package cinema
import java.io.File

class DdjjExhibidor {
    Date fecha
    String file
    static belongsTo = [exhibidora:Exhibidor]
	static hasMany = [ddjjExhibidorRegs:DdjjExhibidorRegistry]
    static constraints = {
        fecha()
		file()
	}
	
	def validateRepetitions = { ddjjRegs ->
		println "validate repetitions: ${this.id}, ${ddjjRegs}" 
		def rep = DdjjExhibidorRegistry.executeQuery("select d.dia, d.mes, d.anio, d.hora, d.sala, count(*) from DdjjExhibidorRegistry d where d.ddjj=${this.id} group by d.dia, d.mes, d.anio, d.hora, d.sala having count(*) > 1")
        if(rep){
            def c = DdjjExhibidorRegistry.createCriteria()
            def results = c.list{
                and {
                    eq 'ddjj', this
                    or{ 
                        rep.each{ 
                            def fila = it
                            and{
                                eq 'dia', fila[0]
                                eq 'mes', fila[1]
                                eq 'anio', fila[2]
                                eq 'hora', fila[3]
                                eq 'sala', fila[4]
                            }
                        }
                    }
                }
            }
			ddjjRegs.each{
                if(it.id in results.collect{reg -> reg.id}){
                	it.errors.rejectValue("hora","repetido",["${it.dia}/${it.mes}/${it.anio} ${it.hora}",it.sala.codigo] as Object[],"Existen otros registros de la misma fecha, hora[{0}] y sala [{1}]")
				}
			}
			println "validate repetidos results: $results.size"
			//return results.size == 0		
		}      
		return rep.size == 0 
    }


	def validateHourZero = { ddjjRegs ->
	try{
		println "validate hora zero: ${this.id}, ${ddjjRegs}"
		def zero = DdjjExhibidorRegistry.executeQuery("select d.dia, d.mes, d.anio, d.sala, count(*) from DdjjExhibidorRegistry d where d.ddjj=${this.id} and exists ( select 1 from DdjjExhibidorRegistry r where r.ddjj=d.ddjj and r.hora='0') group by d.dia, d.mes, d.anio, d.sala having count(*) > 1")
		if(zero){
            def c = DdjjExhibidorRegistry.createCriteria()
            def results = c.list{
                and {
                    eq 'ddjj', this
                    or{ 
                        zero.each{ 
                            def fila = it
                            and{
                                eq 'dia', fila[0]
                                eq 'mes', fila[1]
                                eq 'anio', fila[2]
                                eq 'sala', fila[3]
                            }
                        }
                    }
                }
            }
			ddjjRegs.each{
				if(it.id in results.collect{reg -> reg.id}){
					if(it.hora == '0'){
						it.errors.rejectValue("hora","horaZero",["${it.dia}/${it.mes}/${it.anio}"] as Object[],"Existen otros registros de la misma fecha [{0}] con horario distinto de cero")
					} else {
						it.errors.rejectValue("hora","horaZero",["${it.dia}/${it.mes}/${it.anio}"] as Object[],"Existen otros registros de la misma fecha [{0}] con horario en cero")
					}
				}
				println "validate zero results: $results.size"
			}
            //return results.size == 0

		}
		return zero.size == 0
		}catch(Exception e){
			e.printStackTrace()
			return false
		}
	}

	def validateRepetitionsAndZeros = { ddjjRegs ->
		def valid = true
		def map = [:]
		def hora = [:]
		def map2 = [:]

		ddjjRegs.each {
		    if(map[[it.dia, it.mes, it.anio, it.sala]]) {
        		map[[it.dia, it.mes, it.anio, it.sala]] << it
		    } else {
        		map[[it.dia, it.mes, it.anio, it.sala]] = [it]
    		} 
			if(it.hora != '0'){	
	            if(map2[[it.dia, it.mes, it.anio, it.hora, it.sala, it.precioBasico]]) {
    	            map2[[it.dia, it.mes, it.anio, it.hora, it.sala, it.precioBasico]] << it
        	    } else {
            	    map2[[it.dia, it.mes, it.anio, it.hora, it.sala, it.precioBasico]] = [it]
            	}
         	}
		}
    	println "MAP: ${map}" 
		map.each{ key, value ->
			def zero = value.findAll{ it.hora == '0'}
			def nonZero = value.findAll{ it.hora != '0'}
			println "${zero}, ${nonZero}"
		    if(zero.size > 0 && nonZero.size > 0){
				valid = false
				zero.each {
					it.errors.rejectValue("hora","horaZero",["${it.dia}/${it.mes}/${it.anio}"] as Object[],
											"Existen otros registros de la misma fecha [{0}] con horario distinto de cero")
				}
        		nonZero.each{
					it.errors.rejectValue("hora","horaZero",["${it.dia}/${it.mes}/${it.anio}"] as Object[],
											"Existen otros registros de la misma fecha [{0}] con horario en cero")
				}
    		}
		}
		map2.each { key, value ->
			def base = value.findAll{ it.tipoFuncion == 'BASE' }
			def devo = value.findAll{ it.tipoFuncion == 'DEVO' }
			def baseTotal = base.sum {it.cantidadEntradas}
			def devoTotal = devo.sum{it.cantidadEntradas}
			if(baseTotal < devoTotal){
				base.each {
					it.errors.rejectValue("cantidadEntradas","cantidadEntradas",["${baseTotal}","${devoTotal}"] as Object[],
                                          "La cantidad de entradas vendidas [{0}] de la función es menor a la cantidad devuelta [{1}]")
				}
				devo.each {
                    it.errors.rejectValue("cantidadEntradas","cantidadEntradas",["${devoTotal}","${baseTotal}"] as Object[],
                                          "La cantidad de entradas devueltas [{0}] de la función es mayor a la cantidad vendida [{1}]")
                }
				valid = false
			}
		}
		valid
	}

	static def show_columns = {
		["fecha", "file", "exhibidora.to_string"]
	}
/*
		    value.each{
        		if(hora[it.hora]){
            		hora[it.hora] << it
        		} else {
            		hora[it.hora] = [it]    
        		}            
    		}
    		hora.each{ k, v ->
        		if(v.size > 1){
					v.each {
            			it.errors.rejectValue("hora","repetido",["${it.dia}/${it.mes}/${it.anio} ${it.hora}",it.sala?.codigo] as Object[],
											 	"Existen otros registros de la misma fecha, hora[{0}] y sala [{1}]")
					}
					valid = false
        		}
    		}
*/
		
/*	static transients = ['file']

	String getFilePath(){
		file.getPath()
	}*/
}
