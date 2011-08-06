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
			if(ddjj.validate()){
				//ddjj.save()
			}
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
				/**TODO validateHourZero union validateRepetitions union ddjjRegs (puedo filtrar ddjjRegs por los que tienen error) **/
				if(fd.length != 20){
					valid = valid & false
					registry.errors.reject("ddjjExhibidorRegistry.invalid")
//					ddjjRegs << registry	
				}else if(registry.validate()){
					valid = valid && true 
					ddjj.addToDdjjExhibidorRegs(registry)
					println "valido: ${registry.id}"
				}else{
					valid = valid && false
					println "invalido: ${registry.id}"
				 	registry.errors.each {
		 	        	println "ERROR: $it"
   				 	}
//					ddjjRegs << registry	
				}
				ddjjRegs << registry
			}
			def map = [ddjjExhibidorInstance:ddjj]
			if(!ddjj.hasErrors() && valid ){
				ddjj.save()
				valid = valid && !ddjj.hasErrors() & ddjj.validateHourZero(ddjjRegs)
				valid = valid & ddjj.validateRepetitions(ddjjRegs)
			}
			if(valid){
	        	redirect action:"show", id:ddjj.id
			}else{
				ddjjRegs.findAll{it.hasErrors()}.each{ it.errors.each{ reg -> println reg}} 
				map.ddjjRegs = ddjjRegs.findAll{it.hasErrors()}
				ddjj.file = file.getOriginalFilename()
				ddjj.exhibidora = (params["exhibidor.id"]?Exhibidor.get(params.int("exhibidor.id")):null)
				status.setRollbackOnly()
				render(view:"create", model:map)
			}
	    }	
    }

}
