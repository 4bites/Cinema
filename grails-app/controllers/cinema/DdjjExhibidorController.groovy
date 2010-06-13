package cinema
import java.util.File;

class DdjjExhibidorController {
    def scaffold = true
    def index = { }
    def save = {
		File file = request.getFile("file")
		println file.inputStream.text
		file.eachLine { line ->
			String[] fields = line.split(';')
			def registry = new DdjjExhibidorRegistry(periodoFiscal:fields[0], mes:fields[1], anio:fields[2],
													sala:Sala.findByCodigo(fields[3]))	
		}
		f.transferTo("/home/jiseruk/Cinema/upload")
		render(view:"show")
    }
}
