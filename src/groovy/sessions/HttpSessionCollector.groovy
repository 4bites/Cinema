package sessions

import javax.servlet.http.*

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

	public static void invalidateUser(String userName){
		sessions.each { k, v ->
			if(v.gsecUsername == userName){
				v.invalidate()
			}
		}
	}
}
