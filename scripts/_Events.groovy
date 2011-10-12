import groovy.xml.StreamingMarkupBuilder

eventWebXmlEnd = { String tmpfile ->
	def root = new XmlSlurper().parse(webXmlFile)
  	root.appendNode {
    	'listener' { 
      		'listener-class' (
        	'sessions.HttpSessionCollector'
      		) 
    	}
  	}
	webXmlFile.text = new StreamingMarkupBuilder().bind {
    	mkp.declareNamespace(
      		"": "http://java.sun.com/xml/ns/j2ee")
    	mkp.yield(root) 
  	}
    print "Estoy en el evento de generacion del web.xml!!!" 
}
