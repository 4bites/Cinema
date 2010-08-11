package cinema
import java.io.File

class DdjjExhibidorController {
    def scaffold = true
	static navigation = [
		group:'menu', 
		order:10, 
		action:'create',
		subItems: [
			[action:'create',order:1, title:'Alta'],
			[action:'update',order:2, title:'Modificar'],
			[action:'list',order:3, title:'Listar']
		]
	]
    def index = { }
    def save = {
		def ddjj = new DdjjExhibidor()
		ddjj.properties = params
		println "params:${params}"
		println "properties:${ddjj.properties}--fin properties"
		def file = request.getFile("file")
		File dest = new File("/home/ubuntu6500/Cinema/upload")
		file.transferTo(dest)
		//println file.inputStream.text
		dest.eachLine { line ->
			String[] fd = line.split(',')
			def registry = new DdjjExhibidorRegistry(periodoFiscal:fd[0], mes:fd[1], anio:fd[2],
										exhibidor:Exhibidor.findByCodigo(fd[3]), 
										sala:Sala.findByCodigo(fd[4]),
										renglon:fd[5], dia:fd[6], hora:fd[7], 
										pelicula:Pelicula.findByCodigoAndTitulo(fd[8],fd[10]),
										tipoFuncion:fd[9],
										distribuidor:Distribuidor.findByCodigoAndCuit(fd[11], fd[12]), 
										serieBOC:fd[13], numeroInicialBOC:fd[14], precioBasico:fd[15], 
										impuesto:fd[16], precioVenta:fd[17], cantidadEntradas:fd[18],
										impuestoTotal:fd[19] )
			if(registry.validate()){
				println "valido"
				ddjj.addToDdjjExhibidorRegs(registry)
			}else{
				 registry.errors.each {
		 	        println it
   				 }
			}

		}
		def map = [ddjjExhibidorInstance:ddjj]
		if(!ddjj.hasErrors()){
			ddjj.save()
	        render(view:"show", model:map)
		}else{
			render(view:"create", model:map)
		}
    }
}
