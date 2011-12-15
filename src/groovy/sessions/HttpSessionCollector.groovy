package sessions

import javax.servlet.http.*
import de.ppi.grails.gsec.*

public class HttpSessionCollector implements HttpSessionListener {
    private static final Map<String, HttpSession> sessions = new HashMap<String, HttpSession>()

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        HttpSession session = event.getSession()
        sessions.put(session.getId(), session)
    }


    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        sessions.remove(event.getSession().getId())
    }

    public static HttpSession find(String sessionId) {
        return sessions.get(sessionId)
    }

	public static void invalidateAll(){
		print sessions.size()
		sessions.each { k, v ->
			v.invalidate()
		}
	}

	public static void updateUsers(){
		def authenticationService = new AuthenticationService()
		sessions.each { k, v ->
			def user = GsecUser.get(v.gsecUserid)
			println "user: $user"
/*			if(v.gsecUsername == userName){
				v.invalidate()
			}*/
			if(user && user.enabled){
				authenticationService.setSessionParameters(user, v)
				v.roles.each{println "role: $it"}
        		v.gsecPermissions.each{println "permiso: $it"}
			}else{
				v.invalidate()	
			}
		}
	}
}
