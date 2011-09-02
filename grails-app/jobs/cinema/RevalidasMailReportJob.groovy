package cinema


class RevalidasMailReportJob {
	static triggers = {
    	cron name: 'mailTrigger', cronExpression: "0 0 10 * * ?"
  	}

    def execute() {
 		sendMail {
    	    to "nosotros@4bites.com.ar", "germadevanesa@gmail.com", "javier.iseruk@gmail.com", "julio@tuozzo.com.ar", "diego.rossotti@citi.com", "gabrielmarcos2001@gmail.com"
            subject "Reválidas de empresas vencidas o próximas a vencer"
            body( view:"/empresa/mailTemplate", model:[empresas:Empresa.controlRevalidas()])
        }
       
    }
}
