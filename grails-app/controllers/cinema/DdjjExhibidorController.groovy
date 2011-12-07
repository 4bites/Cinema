package cinema
import java.io.File
import org.krysalis.barcode4j.impl.code39.Code39Bean

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
		println "File: ${dest.size()}" 
		def valid = true
        DdjjExhibidor.withTransaction { status ->
			ddjj.validate()
			if(dest.size() == 0){
    	        ddjj.errors.rejectValue("file","file","Debe ingresar un archivo valido")
	        }

			def ddjjRegs = []
			dest.eachLine { line, fila ->
				String[] fd = line.split(',')
				def registry
				if(fd.length != 20){
					registry = new DdjjExhibidorRegistry(fila:fila)
				} else {
					def map = [fila:fila, periodoFiscal:fd[0], mes:fd[1], anio:fd[2],
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
			if(ddjj.validateRepetitionsAndZeros(ddjjRegs) & !ddjj.hasErrors() & valid ){
				ddjj.save()
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

	def search = {
		searcher(params)
	}

	def pdf = {
		def ddjj = DdjjExhibidor.get(params.id)
		render view:"pdf", model:[ddjjExhibidorInstance:ddjj]
//		renderPdf template:"pdf", model:[ddjjExhibidorInstance:ddjj], controller: this
	}

	def barcode = {
		def barcodeValue = params.id
        renderBarcodePng("code39Generator", barcodeValue)

	}

	def sessions = {
		sessions.HttpSessionCollector.invalidateAll()
	}
}
