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

/*	static transients = ['file']

	String getFilePath(){
		file.getPath()
	}*/
}
