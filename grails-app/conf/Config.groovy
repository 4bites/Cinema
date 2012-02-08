// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
jqueryUi.minified=false
jqueryDataTables.minified=false
grails.json.legacy.builder=false
migrations.enabled = false
migrations.changelogs = ['migrations/changelog.xml']
ddjjUploadDir = "/cinema/ddjj"
afipUploadDir = "/cinema/afip"
grails.app.context = "/"
grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]
// The default codec used to encode data with ${}
grails.views.javascript.library="jquery"
grails.views.default.codec="none" // none, html, base64
grails.views.gsp.encoding="UTF-8"
grails.converters.encoding="UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder=false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable fo AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []

// set per-environment serverURL stem for creating absolute links
environments {
    production {
        grails.serverURL = "http://www.changeme.com"
    }
    development {
        grails.serverURL = "http://localhost:8080/${appName}"
    }
    test {
        grails.serverURL = "http://localhost:8080/${appName}"
    }

}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console
    // appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}


    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
	       'org.codehaus.groovy.grails.web.pages', //  GSP
	       'org.codehaus.groovy.grails.web.sitemesh', //  layouts
	       'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
	       'org.codehaus.groovy.grails.web.mapping', // URL mapping
	       'org.codehaus.groovy.grails.commons', // core / classloading
	       'org.codehaus.groovy.grails.plugins', // plugins
	       'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
	       'org.springframework',
	       'org.hibernate',
           'net.sf.ehcache.hibernate'

    warn   'org.mortbay.log'
}

auditLog {
  actorClosure = { request, session ->
      session.gsecUsername
  } 
}

gsec {
    //Default-Values. No one must be set.
    isEnabled = true    //Only in development you can set it to false in all other environment it is non relevant 
    nullMustBeAuthenticated = false    //true if the user must be authenticated if the controllername is null 
    publicControllers = ['public','auth','registration', 'passwordManagement','localidad']//, 'gsecPermission','gsecUser','gsecRole','sala', 'personaJuridica', 'personaFisica', 'localidad', 'empresa', 'exhibidor', 'distribuidor', 'productor', 'local', 'ddjjExhibidor', 'ddjjVideo', 'pelicula', 'videoClub', 'bocIngreso', 'bocEgreso', 'pago'] //list of controllernames without any security-checks
    maxLoginFailed = 10 //nr of failed logins before a user is disabled.
    gsec.rememberMeCryptKey='No Public Default' //String which is used as key for the rememberMe encryption.
    gsec.loginView = 'login' //defines the gsp for login, which has the model:[username, rememberMe, token]
                             //The gsp must be in the folder views/auth
                             //furthermore you must send back the parameter password. The button should be
                             //<gti:actionSubmit class="signIn" action="signIn" messageCode="login.login" />
    //Configuration-Options for registration and resetPassword:
    allowSelfRegistration = true //true if the user can register himself.
    allowResetPassword = true //true if the user can reset his password.
    gsec.expireTime = 24 * 60 // time how long the registration is stored without confirmation in minutes. Default: 24h
    gsec.allowedMailadresses = ''//List (separates by ',', ';' or <spaces>) of mail-adresses defined via regular-expression, 
                                 //which are allowed for registration. Allowed mail-adresses can't be forbidden. Default: Empty-List
    gsec.forbiddenMailadresses = '' //List (separates by ',', ';' or <spaces>) of mail-adresses defined via regular-expression, 
                                    //which are forbidden for registration. Default: Empty-List
    gsec.defaultRole="guest" //name of the defaultrole each user get.

    gsec.replyAdress=null //Email-Adress for confirmation-reply.
    gsec.bccAdress=null //Email-Adress for bcc of all registrations and resetPassword.
    htmlMail = false //Send HTML-Mail or not. Notice true implied http://jira.codehaus.org/browse/GRAILSPLUGINS-1885

}

     
