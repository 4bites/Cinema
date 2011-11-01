package cinema

class Boc {
    Integer desde
    Integer hasta
    String serie
    Date fechaAlta = new Date()
    Integer cantidad
	String accion
   	static transients = ['accion'] 
    static mapping = {
      cantidad formula: 'HASTA - DESDE + 1'
    }
    static belongsTo = [exhibidor:Exhibidor]
    static constraints = {
        desde(blank:false, validator: {val, obj -> 
			val < obj.hasta
		})
        serie(nullable:false, matches:"A|B|C|D|E|Z")
//      cantidad(max: 9999, validator: {val, obj -> val == obj.hasta - obj.desde + 1})  
        exhibidor(nullable:true, validator:{ val, obj, errors ->
			if(val == null && (obj.accion == 'entrega' || obj.accion=='devolucion')){
				errors.rejectValue("exhibidor","exhibidor",["${obj.accion}"] as Object[],"El exhibidor no puede ser nulo con esta accion [{0}]")
			} else if(val != null && (obj.accion == 'alta' || obj.accion=='baja')){
                errors.rejectValue("exhibidor","exhibidor",["${obj.accion}"] as Object[],"El exhibidor debe ser nulo con esta accion [{0}]")
			}
		})	
    }


	def alta = { 
//		def results = Boc.executeQuery("select desde from Boc where serie=? and (desde <=? and hasta >=? or desde <=? and hasta>=?)", serie, desde, desde+0, hasta, hasta+0)
		def results = Boc.executeQuery("select desde from Boc where serie=? and (desde >? or hasta <?)", serie, hasta, desde)
		println "${results.size()} == ${Boc.findAllBySerie(serie).size()}"
		if(results.size()==Boc.findAllBySerie(serie).size()){
//		if(!results){
			save()
		} else {
			errors.reject("ya existen")
			false
			print "ya existen"
		}
	}

	def baja = {
		if(id){
			delete()
		//	return
		} else {
		def results = Boc.executeQuery("select desde, hasta, serie from Boc where serie=? and desde <=? and hasta >=? and exhibidor is null", serie, desde, hasta)
		if(results && results.size() == 1){
			results.each {
				def boc = [desde:it[0], hasta:it[1], serie:it[2]]
				if(boc.desde < desde){
					new Boc(desde:boc.desde, hasta: desde - 1, serie: serie, fechaAlta: new Date()).save()
					//delete()	
					Boc.executeUpdate("delete from Boc where serie=? and desde=? and hasta=?", boc.serie, boc.desde, boc.hasta)
				}
				if(boc.hasta > hasta) {
					new Boc(desde: hasta+1, hasta: boc.hasta, serie:serie, fechaAlta: new Date()).save()
					//delete()
					Boc.executeUpdate("delete from Boc where serie=? and desde=? and hasta=?", boc.serie, boc.desde, boc.hasta)
					
				}
			}
		} else {
			errors.reject("no se pueden dar de baja porque no existen o existen, pero estan asignados")
			false
			print "no se pueden dar de baja porque no existen o existen, pero estan asignados"
		}
		}
				
	}

	def entrega = {
        def results = Boc.executeQuery("select desde, hasta, serie from Boc where serie=? and desde <=? and hasta >=? and exhibidor is null", serie, desde, hasta)
        if(results && results.size() == 1){
            results.each {
				def boc = [desde:it[0], hasta:it[1], serie:it[2]]
                if(boc.desde < desde){
					Boc.executeUpdate("delete from Boc where serie=? and desde=? and hasta=?", boc.serie, boc.desde, boc.hasta)
                    new Boc(desde:boc.desde, hasta: desde - 1, serie: serie, fechaAlta: new Date()).save()
                }
                if(boc.hasta > hasta) {
					Boc.executeUpdate("delete from Boc where serie=? and desde=? and hasta=?", boc.serie, boc.desde, boc.hasta)
                    new Boc(desde: hasta+1, hasta: boc.hasta, serie:serie, fechaAlta: new Date()).save()
                }
				if(boc.hasta == hasta && boc.desde == desde) {
					Boc.executeUpdate("delete from Boc where serie=? and desde=? and hasta=?", boc.serie, boc.desde, boc.hasta)
				}
            }
			save()
        } else {
            print "no se pueden entregar porque no existen o existen, pero estan asignados"
			errors.reject("no se pueden entregar porque no existen o existen, pero estan asignados")
			false
        }
        
    }

	def devolucion = {
		if(id){
			exhibidor = null
			save()
			return
		}
		def results = Boc.executeQuery("select desde, hasta, serie from Boc where serie=? and desde <=? and hasta >=? and exhibidor=?", serie, desde, hasta, exhibidor)
		 if(results && results.size() == 1){
			results.each {
				def boc = [desde:it[0], hasta:it[1], serie:it[2]]
                if(boc.desde < desde){
					print "boc.desde < desde"
					Boc.executeUpdate("delete from Boc where serie=? and desde=? and hasta=?", boc.serie, boc.desde, boc.hasta)
                    new Boc(desde:boc.desde, hasta: desde - 1, serie: serie, exhibidor: exhibidor, fechaAlta: new Date()).save()
                }
                if(boc.hasta > hasta) {
					print "boc.hasta > hasta"
                    new Boc(desde: hasta+1, hasta: boc.hasta, serie:serie, exhibidor: exhibidor, fechaAlta: new Date()).save()
					Boc.executeUpdate("delete from Boc where serie=? and desde=? and hasta=?", boc.serie, boc.desde, boc.hasta)
                }
            }
			accion = 'alta'
			exhibidor = null
            save()
			true
        } else {
            print "no se pueden devolver porque esa serie no estaba en poseción de ese exhibidor"
			errors.reject("no se pueden devolver porque esa serie no estaba en poseción de ese exhibidor")
			false
        }

	}
	
	static def show_columns = {
        ["fechaAlta", "desde", "hasta","serie","cantidad","exhibidor.to_string"]
    }

}
