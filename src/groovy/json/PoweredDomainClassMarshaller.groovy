package json

import org.codehaus.groovy.grails.web.converters.marshaller.json.DomainClassMarshaller
import org.codehaus.groovy.grails.web.json.JSONWriter
import grails.converters.JSON
import org.codehaus.groovy.grails.commons.GrailsDomainClass
import org.codehaus.groovy.grails.commons.GrailsDomainClassProperty
import org.codehaus.groovy.grails.support.proxy.EntityProxyHandler
import org.codehaus.groovy.grails.web.converters.exceptions.ConverterException
import org.codehaus.groovy.grails.support.proxy.DefaultProxyHandler
import org.codehaus.groovy.grails.support.proxy.ProxyHandler

class PoweredDomainClassMarshaller extends DomainClassMarshaller{
//	private ProxyHandler proxyHandler;

	public PoweredDomainClassMarshaller(boolean includeVersion) {
        super(includeVersion)
//		this.proxyHandler = new DefaultProxyHandler()
    }

  	protected void asShortObject(Object refObj, JSON json,
               GrailsDomainClassProperty idProperty,
               GrailsDomainClass referencedDomainClass) throws ConverterException {
        Object idValue
/*
        if(proxyHandler instanceof EntityProxyHandler) {
            idValue = ((EntityProxyHandler) proxyHandler).getProxyIdentifier(refObj);
            if(idValue == null) {
                idValue = extractValue(refObj, idProperty);
            }

        }
        else {*/
        idValue = extractValue(refObj, idProperty);
//        }
		def includes = []
        if(refObj.metaClass.hasProperty(refObj, 'show_columns')){
            includes = refObj.show_columns()
        }
        JSONWriter writer = json.getWriter()
        writer.object()
		includes.each {
			def value
			if(refObj."${it.tokenize(".")[0]}" instanceof Date){
				value = refObj."${it.tokenize(".")[0]}".format("dd/MM/yyyy")
			} else {
				value = refObj."${it.tokenize(".")[0]}"
			}
			writer.key(it.tokenize(".")[0]).value(value)
        }
        writer.key("class").value(referencedDomainClass.getName())
		writer.key("to_string").value(refObj.toString())
        writer.key("id").value(idValue)
        writer.endObject()
  	}
/*
	public void marshalObject(Object value, JSON json) throws ConverterException {
		super.marshalObject(value, json)
        JSONWriter writer = json.getWriter()
		writer.key("to_string").value(value.toString())
	}
*/



}
