package poly.interceptor;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import poly.service.impl.UserService;

public class RememberMeInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(RememberMeInterceptor.class);

    @Inject
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	try {
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("logout", "0");
        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        String session_key = loginCookie.getValue();
        System.out.println("쿠키를 불러옴" + loginCookie);
        if (loginCookie != null){
        	System.out.println("쿠키가 존재해서 회원정보를 불러옴");
            String stu_no = userService.checkLoginBefore(session_key);
            if (stu_no.length() > 0) {
                httpSession.setAttribute("stu_no", stu_no);
            }else {
            	httpSession.setAttribute("logout", "1");
            }
        }
        return true;
    	}catch(NullPointerException e) {
    		return true;
    	}
    }
}
