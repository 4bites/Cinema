package cinema
import java.io.File

class PagoController {
	def scaffold = true	
    def index = { }

	def save = {
		def pago = new Pago()
        pago.properties = params.findAll{it.key != "file"}
        pago.fecha = new Date()
        println "params:${params}"
        def file = request.getFile("file")
        File dest = new File("${grailsApplication.config.afipUploadDir}/pagos_${System.currentTimeMillis()}")
        file.transferTo(dest)
        pago.file = dest.getPath()
		def valid = true
		Pago.withTransaction { status ->
            pago.validate()
            if(dest.size() == 0){
                pago.errors.rejectValue("file","file","Debe ingresar un archivo válido")
            }

            def pagos = []
            dest.eachLine { line, fila ->
                String[] fd = line.split(',')
                def registry
                if(fd.length != 14){
                    registry = new PagoRegistry(fila:fila, registry: fd)
                } else {
					def empresa = Exhibidor.findByPersona(fd[0])
					empresa = (empresa ? empresa : VideoClub.findByPersona(fd[0]))
                    def map = [fila:fila, 
								empresa:empresa, 
								codigoImpuesto:fd[2],
                                anio:fd[4],
                                mes:fd[5], cuota:fd[6], tipoIngreso:fd[9],
                                importeAbonado:fd[13], registry: fd, pago:pago]
                    registry = new PagoRegistry(map)
                }
				if(fd.length != 14){
                    valid = valid & false
                    registry.errors.reject("pagoRegistry.invalid")
				}else if(registry.validate()){
                    valid = valid && true
                    pago.addToPagoRegs(registry)
                    println "valido: ${registry.id}"
                }else{
                    valid = valid && false
                    println "invalido: ${registry.id}"
                    registry.errors.each {
                        println "ERROR: $it"
                    }
                }
                pagos << registry
			}
			def map = [pagoInstance:pago]
            if(!pago.hasErrors() & valid & pago.validateUniqueness(pagos)){
                pago.save()
                redirect action:"show", id:pago.id
            }else{
                pagos.findAll{it.hasErrors()}.each{ it.errors.each{ reg -> println reg}}
                map.pagoRegs = pagos.findAll{it.hasErrors()}
                pago.file = file.getOriginalFilename()
                status.setRollbackOnly()
                render(view:"create", model:map)
            }
		}	
	
	}

	def search = {
        searcher(params)
    }
	
	def edit = {
		def pago = Pago.get(params.int("id"))
		render view:"create", model:[pagoInstance: pago, pagoRegs: pago.pagoRegs]
	}

}
