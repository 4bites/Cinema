package json

import grails.web.*

class JSONSerializer {

    def target
	def grailsApplication

    String getJSON() {

        Closure jsonFormat = {   

            object = {
                // Set the delegate of buildJSON to ensure that missing methods called thereby are routed to the JSONBuilder
                buildJSON.delegate = delegate
                buildJSON(target)
            }
        }        

        def json = new JSONBuilder().build(jsonFormat)
        return json.toString(true)
    }

    private buildJSON = {obj ->
		println obj
		def includes = []	
		if(obj.metaClass && obj.metaClass.respondsTo(obj, 'show_columns')){
			includes = obj.class.show_columns()
		}
		def obj_properties = (obj instanceof Map ? obj : obj.properties)
        obj_properties.each {propName, propValue ->

            if (!['class', 'metaClass','constraints','hasMany'].contains(propName) && (includes?includes.contains(propName):true)) {

                if (isSimple(propValue)) {
					println "$propName  : $propValue simple"
                    // It seems "propName = propValue" doesn't work when propName is dynamic so we need to
                    // set the property on the builder using this syntax instead
                    setProperty(propName, propValue)
                } else {
					println "$propName  : $propValue complex"
                    // create a nested JSON object and recursively call this function to serialize it
                    Closure nestedObject = {
                    	buildJSON(propValue)
                    }
                    setProperty(propName, nestedObject)
                }
            }
        }
    }

   /**
     * A simple object is one that can be set directly as the value of a JSON property, examples include strings,
     * numbers, booleans, etc.
     *
     * @param propValue
     * @return
     */
    private boolean isSimple(propValue) {
        // This is a bit simplistic as an object might very well be Serializable but have properties that we want
        // to render in JSON as a nested object. If we run into this issue, replace the test below with an test
        // for whether propValue is an instanceof Number, String, Boolean, Char, etc.
        (propValue instanceof Serializable || propValue == null) && !(propValue && grailsApplication.isDomainClass(propValue.class)) && !(propValue instanceof List)
    }
}
