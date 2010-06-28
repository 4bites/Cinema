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
/*	static transients = ['file']

	String getFilePath(){
		file.getPath()
	}*/
}
