import org.krysalis.barcode4j.impl.code39.Code39Bean
import sessions.*
import org.codehaus.groovy.grails.orm.hibernate.HibernateEventListeners
// Place your Spring DSL code here
beans = {

   localeResolver(org.springframework.web.servlet.i18n.SessionLocaleResolver) {
      defaultLocale = new Locale("es","")
      java.util.Locale.setDefault(defaultLocale)
   }

	mailSender(org.springframework.mail.javamail.JavaMailSenderImpl) {
	    host = 'smtp.gmail.com'
    	port = 465
    	username = 'javier.iseruk@gmail.com'
    	password = 'nicolas2008'
    	javaMailProperties = ['mail.smtp.auth': 'true',
            'mail.smtp.socketFactory.port': '465',
            'mail.smtp.socketFactory.class': 'javax.net.ssl.SSLSocketFactory',
            'mail.smtp.socketFactory.fallback': 'false']
	}
	
    code39Generator(Code39Bean) {
        height = 10
    }

	sessionPostUpdateEventListener(SessionPostUpdateEventListener)

	hibernateEventListeners(HibernateEventListeners) {
    	listenerMap = ['post-update':sessionPostUpdateEventListener]
   	}
    
}
