package cinema
import java.io.File

class DdjjExhibidorController {
    def scaffold = true
/*	static navigation = [
		group:'menu', 
		order:10, 
		action:'create',
		subItems: [
			[action:'create',order:1, title:'Alta'],
			[action:'update',order:2, title:'Modificar'],
			[action:'list',order:3, title:'Listar']
		]
	]*/
    def index = { }
    def save = {
		def ddjj = new DdjjExhibidor()
		ddjj.properties = params.findAll{it.key != "file" && it.key != "exhibidor"}
		println "params:${params}"
		println "properties:${ddjj.properties}--fin properties"
		def file = request.getFile("file")
		File dest = new File("${grailsApplication.config.ddjjUploadDir}/ddjj_ex${params["exhibidor.id"]}_${System.currentTimeMillis()}")
		file.transferTo(dest)
		ddjj.file = dest.getPath()
		//println file.inputStream.text
		def valid = true
        DdjjExhibidor.withTransaction { status ->
			def ddjjRegs = []
			dest.eachLine { line ->
				String[] fd = line.split(',')
				def registry = new DdjjExhibidorRegistry(periodoFiscal:fd[0], mes:fd[1], anio:fd[2],
										exhibidor:Exhibidor.findByCodigo(fd[3]), 
										sala:Sala.findByCodigo(fd[4]),
										renglon:fd[5], dia:fd[6], hora:fd[7], 
										pelicula:Pelicula.findByCodigo(fd[8]),
										tipoFuncion:fd[9],
										distribuidor:Distribuidor.findByCodigo(fd[11]), 
										serieBOC:fd[13], numeroInicialBOC:fd[14], precioBasico:fd[15], 
										impuesto:fd[16], precioVenta:fd[17], cantidadEntradas:fd[18],
										impuestoTotal:fd[19] )
				if(registry.validate()){
					valid = valid && true 
					ddjj.addToDdjjExhibidorRegs(registry)
				}else{
					valid = valid && false
				 	registry.errors.each {
		 	        	println it
   				 	}
				}
				ddjjRegs << registry
			}
			def map = [ddjjExhibidorInstance:ddjj]
			if(!ddjj.hasErrors() && valid){
				ddjj.save()
	        	render(view:"show", model:map)
			}else{
				map.ddjjRegs = ddjjRegs
				ddjj.file = file.getOriginalFilename()
				status.setRollbackOnly()
				render(view:"create", model:map)
			}
	    }	
    }

}
