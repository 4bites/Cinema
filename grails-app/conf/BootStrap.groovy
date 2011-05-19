import cinema.Provincia
import cinema.Localidad

class BootStrap {

     def init = { servletContext ->
		new File("${servletContext.getRealPath('/provincias.txt')}").eachLine {
			println it
			def line = it.tokenize(",")
			def p = Provincia.findByName(line[0])
			if(p == null){
				p = new Provincia(name: line[0])
				p.save()
			}
			def l = new Localidad(name: line[1])
			if(p.localidades.findAll{ it.name == l.name}.size() == 0){
				l.save()
				p.addToLocalidades(l)
			}
		}
     }

     def destroy = {
     }
} 
