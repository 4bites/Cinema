package cinema

class PagoRegistry {
	Integer fila
	Empresa empresa
	Integer codigoImpuesto
	Integer anio
	Integer mes
	Integer cuota
	String tipoIngreso
	BigDecimal importeAbonado	
	String[] registry
    static belongsTo = [pago:Pago]
    static transients = ['registry','codigoConcepto','tasaPercepcion']	
	String periodo
	String codigoConcepto
	Integer tasaPercepcion

    static mapping = {
        periodo formula: "concat(convert(anio,char(4)),  right(concat('0',convert(mes,char(2)) ),2) )"
    }

    static constraints = {
		empresa(nullable:true, validator:{ val, obj, errors ->
			if(val == null || !val instanceof Exhibidor && !val instanceof VideoClub){
				errors.rejectValue("empresa","empresa",[registry[0]] as Object[], "El codigo de empresa [{0}] no pertenece a un video club o a un exhibidor")
			}
		})
		codigoImpuesto(inList:[304, 305], validator:{ val, obj, errors ->
			if(obj.empresa instanceof Exhibidor && val != 304 || obj.empresa instanceof VideoClub && val != 305){
				errors.rejectValue("codigoImpuesto", "codigoImpuesto", [val, obj.empresa.class.simpleName] as Object[], 
					"El código de impuesto [{0}] no corresponde con el tipo de empresa [{1}]")
			}	
		})
		anio(range:2000..9999)
		mes(range:1..12)
		cuota(range:0..4, unique:['empresa','anio','mes','tipoIngreso']) 
		tipoIngreso(validator:{ val, obj, errors ->
			if(obj.empresa instanceof Exhibidor && val != '02' || obj.empresa instanceof VideoClub && !(val in ['00','01'])){
				errors.rejectValue("tipoIngreso", "tipoIngreso", [obj.empresa.class.simpleName, val] as Object[], "El tipo de empresa [{0}] no acepta el valor [{1}] como tipo de ingreso")
			}
		})
		importeAbonado(min:0.1)
		codigoConcepto(inList:["019"])
		tasaPercepcion(inList:[10])
    }

	static def show_columns = {
		["anio", "mes", "cuota", "empresa", "codigoImpuesto", "tipoIngreso", "importeAbonado"]
	}
}
