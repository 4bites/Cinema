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
    
}
