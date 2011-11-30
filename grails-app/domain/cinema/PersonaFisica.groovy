package cinema

class PersonaFisica {
 	static auditable = true	

    String nombre
    String apellido
    String cuit
    DocumentType tipoDocumento
    Integer numeroDocumento
    Gender sexo
    String domicilio
    String codigoPostal
    Provincia provincia
    Localidad localidad
    String telefono
    String email
    String condicionIVA
//    static hasMany = [personasJuridicas:PersonaJuridica]
//	List pFisicaPJuridicas
	static mapping = {
//        pFisicaPJuridicas batchSize:10
    }

	static hasMany = [pFisicaPJuridicas:PFisicaPJuridica]
    static constraints = {
        cuit(unique:true, blank:false, matches:/^[0-9]{2}-[0-9]{8}-[0-9]$/, validator:{ val, obj ->
			def c = PersonaFisica.calculateCuit(obj.sexo.toString(), obj.numeroDocumento)
			c && val == c
		})
        nombre(blank:false, size:2..255)
        apellido(blank:false, size: 2..255)
        tipoDocumento(blank:false)
        numeroDocumento(nullable:false)
        sexo(blank:false)
        domicilio(blank:false, size:2..255)
        codigoPostal(blank:false, size:1..10)
        provincia(nullable:false, validator: {
            return (it.id != 0)
    	})
        localidad(nullable:false, validator: {
            return (it.id != 0)
    	})
        telefono(nullable:false, blank:false, size:8..255)
        email(email:true, blank:false, size: 5..254)
        condicionIVA(blank:false, validator: {
			return (it != '0')
		})
    }

	public String toString(){
		"$nombre $apellido"
	}
	
	static def show_columns = {
        ["cuit","nombre","apellido","provincia.name","localidad.name","email"]
    }
 
	static def calculateCuit = { sexo, documento ->
		println "que le pasa al doc: $documento"
		if(documento == null || documento == [] || !"${documento}".isNumber()){
			return "" 
		}	
        def multi = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2]
        def numDoc = "${documento}".padLeft(8,"0")
        def sexNum = (sexo=='MASCULINO'?'20':'27')
        def doc = (sexNum+numDoc).toList()
        doc.eachWithIndex { obj,i ->
            multi[i] = Integer.valueOf(obj)*multi[i]
        }
        def resto = multi.sum()%11
        def verif
        if(resto == 0){
            verif = 0
        } else if(resto == 1){
            verif = (sexNum == '27' ? 4 : 9)
            sexNum = '23'
        } else {
            verif = 11- multi.sum()%11
        }
        "$sexNum-$numDoc-$verif"
    }

}
