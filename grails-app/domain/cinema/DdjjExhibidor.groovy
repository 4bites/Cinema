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
	
	def validateRepetitions = {  
		def rep = DdjjExhibidorRegistry.executeQuery("select d.dia, d.mes, d.anio, d.hora, d.sala, count(*) from DdjjExhibidorRegistry d where d.ddjj=${id} group by d.dia, d.mes, d.anio, d.hora, d.sala having count(*) > 1")
        if(rep){
            def c = DdjjExhibidorRegistry.createCriteria()
            def rep = c.list{
                and {
                    eq 'ddjj', this
                    or{ println rep.class
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
			return rep		
		}        
    }


	def validateHourZero = { obj ->
		def rep = DdjjExhibidorRegistry.executeQuery("select d.dia, d.mes, d.anio, d.sala, count(*) from DdjjExhibidorRegistry d where exists ( select 1 from DdjjExhibidorRegistry r where r.ddjj=d.ddjj and r.hora=0) group by d.dia, d.mes, d.anio, d.sala having count(*) > 1")
	}

/*	static transients = ['file']

	String getFilePath(){
		file.getPath()
	}*/
}
