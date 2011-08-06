package cinema
import java.io.File

class DdjjExhibidorController {
    def scaffold = true
    
	def index = { }
    def save = {
		def ddjj = new DdjjExhibidor()
		ddjj.properties = params.findAll{it.key != "file" && it.key != "exhibidora"}
		ddjj.exhibidora = (params["exhibidor.id"]?Exhibidor.get(params.int("exhibidor.id")):null)
		ddjj.fecha = new Date()
		println "params:${params}"
		println "properties:${ddjj.properties}--fin properties"
		def file = request.getFile("file")
		File dest = new File("${grailsApplication.config.ddjjUploadDir}/ddjj_ex${params["exhibidor.id"]}_${System.currentTimeMillis()}")
		file.transferTo(dest)
		ddjj.file = dest.getPath()
		//println file.inputStream.text
		def valid = true
        DdjjExhibidor.withTransaction { status ->
//			if(ddjj.validate()){
//				ddjj.save()
//			}
			def ddjjRegs = []
			dest.eachLine { line ->
				String[] fd = line.split(',')
				def registry
				if(fd.length != 20){
					registry = new DdjjExhibidorRegistry()
				} else {
					def map = [periodoFiscal:fd[0], mes:fd[1], anio:fd[2],
                                        exhibidor:Exhibidor.findByCodigo(fd[3]),
                                        sala:Sala.findByCodigo(fd[4]),
                                        renglon:fd[5], dia:fd[6], hora:fd[7],
                                        pelicula:Pelicula.findByCodigo(fd[8]),
                                        tipoFuncion:fd[9],
                                        distribuidor:Distribuidor.findByCodigo(fd[11]),
                                        serieBOC:fd[13], numeroInicialBOC:fd[14], precioBasico:fd[15],
                                        impuesto:fd[16], precioVenta:fd[17], cantidadEntradas:fd[18],
                                        impuestoTotal:fd[19], registry: fd, ddjj:ddjj]
					registry = new DdjjExhibidorRegistry(map)
				}
				if(fd.length != 20){
					valid = valid & false
					registry.errors.reject("ddjjExhibidorRegistry.invalid")
					ddjjRegs << registry	
				}else if(registry.validate()){
					valid = valid && true 
					ddjj.addToDdjjExhibidorRegs(registry)
				}else{
					valid = valid && false
				 	registry.errors.each {
		 	        	println it
   				 	}
					ddjjRegs << registry	
				}
			}
			def map = [ddjjExhibidorInstance:ddjj]
			if(ddjj.validate() && valid){
				ddjj.save()
				def rep = DdjjExhibidorRegistry.executeQuery("select d.dia, d.mes, d.anio, d.hora, d.sala, count(*) from DdjjExhibidorRegistry d where d.ddjj=${ddjj.id} group by d.dia, d.mes, d.anio, d.hora, d.sala having count(*) > 1")
				println "REPETIDOS:${rep.size}, ${rep.class.simpleName}"
				if(rep){
					def c = DdjjExhibidorRegistry.createCriteria()
					def bugs = c.list{
						and {
							eq 'ddjj', ddjj
							or{ println rep.class
								rep.each{ println "${it} ${it.class}" 
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
					map.ddjjRegs = bugs
					ddjj.errors.reject("ddjjExhibidor.repetitiveRows")
					status.setRollbackOnly()
					ddjj.file = file.getOriginalFilename()
	                ddjj.exhibidora = (params["exhibidor.id"]?Exhibidor.get(params.int("exhibidor.id")):null)
					render(view:"create", model:map)
					return
				}
	        	redirect action:"show", id:ddjj.id
			}else{
				map.ddjjRegs = ddjjRegs
				ddjj.file = file.getOriginalFilename()
				ddjj.exhibidora = (params["exhibidor.id"]?Exhibidor.get(params.int("exhibidor.id")):null)
				status.setRollbackOnly()
				render(view:"create", model:map)
			}
	    }	
    }

}
