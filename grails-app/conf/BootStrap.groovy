import cinema.*
import grails.converters.*
import groovy.lang.ExpandoMetaClass
//import org.springframework.web.context.request.RequestContextHolder as RCH
import org.codehaus.groovy.grails.commons.DomainClassArtefactHandler

class BootStrap {

	def grailsApplication
	
    def init = { servletContext ->
/*		new File("${servletContext.getRealPath('/provincias.txt')}").eachLine {
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
*/
		ExpandoMetaClass.enableGlobally()
/*		Complejo.metaClass.afterUpdate = {
//		de.ppi.grails.gsec.GsecUser.metaClass.afterUpdate = {
			print "afterUpdate!!!!"
			sessions.HttpSessionCollector.invalidateAll()		
		}
*/
		JSON.registerObjectMarshaller(Date, 10) {
            return it?.format("dd/MM/yyyy")
        }

		JSON.registerObjectMarshaller(new json.PoweredDomainClassMarshaller(false), 10)
		
		Provincia.metaClass.encodeAsHTML = { -> delegate.name }
		Localidad.metaClass.encodeAsHTML = { -> delegate.name }

	
		String.metaClass.humanField = { ->
			(delegate.capitalize().split("(?=\\p{Upper})") as List).findAll{it.size()>0}.join(" ")
		}	

		String.metaClass.decapitalize = { ->
			delegate.replaceFirst(/^./, delegate.getAt(0).toLowerCase())
		}	

		grailsApplication.getArtefacts("Domain")*.clazz.each{ domain ->
//			domain.metaClass.'static'.methodMissing = { String name, args ->  null }
			domain.metaClass.getValueFrom = { String field -> 
												def b = new Binding()
												b.setVariable("field",field.replaceAll("\\.","?."))
												b.setVariable("delegate",delegate)
												def shell = new GroovyShell(b)
												return shell.evaluate("try{delegate.${field}} catch(Exception e){''}") }

			domain.metaClass.static.filter = { ->
				def filter = []
		        try{
        	        domain.show_columns().each { field ->
                    	def domainDescriptor = grailsApplication.getArtefact(DomainClassArtefactHandler.TYPE, domain.name)
                    	def property = domainDescriptor.getPropertyByName(field.tokenize(".")[0])
                    	def type = property.getType()
						println type.name
                    	if(type.name == "java.util.Date"){
                        	filter << "{type:\"date-range\"}"
                    	} else if( type.name == "java.lang.Integer" || type.name=="java.lang.Long"){
                        	filter << "{type:\"number-range\"}"
	                    } else if(type.isEnum() || type.name in ["cinema.Provincia"]){
    	                    def values = type.select()
        	                filter << "{type:\"select\", values:[${values}]}"
            	        } else if(type.name == "java.lang.String"){
                	        filter << "{type:\"text\"}"
                    	} else if (grailsApplication.getDomainClass(type.name) != null){
                        	filter << "{type:\"text\"}"
	                    } else {
    	                    filter << "null"
                   	 	}
                	}
                	filter.join(",")
		        } catch (Exception e){}   

			}	
		}
		
		def evalRestriction = { restriction, iter ->
			def b = new Binding()
            def shell = new GroovyShell(this.class.classLoader, b)
			b.setVariable("it", iter)
			return shell.evaluate("import cinema.*; $restriction")	
		}

		grailsApplication.getArtefacts("Controller")*.clazz.each{ controller ->
//			new org.codehaus.groovy.grails.commons.DefaultGrailsControllerClass(controller).registerMapping("search")
			controller.metaClass.searcher = { params, restrictions -> 
//				def params = RCH.currentRequestAttributes().params
				def domain = params.dom? grailsApplication.classLoader.loadClass("cinema.${params.dom}") :
										grailsApplication.getDomainClass(controller.name.replaceAll("Controller","")).clazz
				def sep = params.sRangeSeparator
	        	def dataToRender = [:]
    	    	dataToRender.sEcho = params.sEcho
        		dataToRender.aaData=[]
        		dataToRender.iTotalRecords = domain.count()
		        dataToRender.iTotalDisplayRecords = dataToRender.iTotalRecords
				if(!params.sEcho){
					dataToRender.aaData = domain.list()
					def restrictionsString = restrictions?.collect{"($it)"}.join(" && ")
					println "restrictions: $restrictionsString"
					if(restrictionsString){
						dataToRender.aaData =  dataToRender.aaData.findAll{ evalRestriction(restrictionsString, it)}
					}
					render dataToRender as JSON
					return 
				}
    		    def criteria = domain.createCriteria()
        		def results = criteria.list {
	        	    if(params.sSearch){
    	        	    or{
        	        	    params.findAll{it.key.startsWith("mDataProp_")}.each {
            	        	    def prop = it.value.replaceAll("aaData.","")
                	        	if(prop.tokenize(".").size()==1){
                    	        	like prop, params.sSearch+"%"
                        		}
	                    	}
    	            	}
	        	    } else {
    	        	    and {
        	        	    params.findAll{it.key.startsWith("mDataProp_")}.eachWithIndex {  param, i ->
            	        	    def prop = param.value.replaceAll("aaData.","").tokenize(".")
								def property = prop[0]
								println "PROPERTY: $property"
                	        	if(params["sSearch_$i"]) {
									def type = domain.metaClass.properties.find{it.name==property}.type
									println "TYPE OF PROP: $type"
									try{

									if(type.name == "java.util.Date" || type.name == "java.lang.Integer" || type.name=="java.lang.Long"){
										def from = params["sSearch_$i"].tokenize(sep)[0]
										def to = params["sSearch_$i"].tokenize(sep)[1]
										if(from && to){
		                    	        	between property, new Date().parse("dd/MM/yyyy", from), new Date().parse("dd/MM/yyyy", to)
										}else if(from){
											greaterThanEquals property,  new Date().parse("dd/MM/yyyy", from)
										} else if(to){
											lessThanEquals property, new Date().parse("dd/MM/yyyy", to)
										}
									} else if(type.isEnum()){
										eq property, type.valueOf(params["sSearch_$i"])
									} else if(grailsApplication.getDomainClass(type.name) != null){
										if(prop.size > 1){
											inList property, type."findAllBy${prop[1].capitalize()}ILike"(params["sSearch_$i"]+"%")
										}else{
											ilike property, type.get(params["sSearch_$i"])
										}
									}else if(type == "java.lang.String"){
										ilike property, params["sSearch_$i"]+"%"
									}	
									} catch(Exception e){
										println "TYPE OF PROP: ${type}"
										e.printStackTrace()
									}	
                        		}
                    		}
                		}
            		}
            		maxResults(params.int('iDisplayLength'))
	            	firstResult(params.int('iDisplayStart'))
	    	        params.findAll{it.key.startsWith("iSortCol_")}.eachWithIndex { param, i ->
		                def prop = params["mDataProp_${param.value}"]?.replaceAll("aaData.","")
						if(prop){
    		            	def sortDir = params["sSortDir_$i"]
//        		        	println '${param.value} ${params["mDataProp_${param.value}"]} $prop $sortDir'
            		    	if(prop.tokenize(".").size()==1){
                		    	order prop, sortDir
                			}
						}
            		}

        		}

	        	dataToRender.aaData = results
    	    	render dataToRender as JSON
    		}

     	}

		
	}

	def destroy = {
    }


} 
