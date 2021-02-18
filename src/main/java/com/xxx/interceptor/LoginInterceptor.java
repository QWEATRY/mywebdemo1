package com.xxx.interceptor;

import com.xxx.domain.User;
import com.xxx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String username=(String)request.getSession().getAttribute("username");
        String password=(String)request.getSession().getAttribute("psw");

        if(username!=null&&password!=null) {

            User user=userService.selectUserByName(username);
            String pp=user.getUserPassword();
            Integer id=user.getUserId();

            if (pp.equals(password)) {
                request.getSession().setAttribute("userId",id);
                return true;
            }
        }

        // 如果用户已登陆也放行
        Cookie[] cookies=request.getCookies();
        int flag=0;
        if(cookies!=null){
            for(Cookie cookie:cookies){
                String cookieName=cookie.getName();
                String cookieValue=cookie.getValue();
                if("username".equals(cookieName)&&!cookieValue.isEmpty()) {
                    flag++;
                    request.getSession().setAttribute("username",cookieValue);
                    User user1=userService.selectUserByName(cookieValue);
                    Integer userId=user1.getUserId();
                    request.getSession().setAttribute("userId",userId);
                }
                else if("psw".equals(cookieName)&&!cookieValue.isEmpty()) {
                    flag++;
                    request.getSession().setAttribute("psw",cookieValue);
                }
            }
            if(flag==2) return true;
            return false;
        }

        // 用户没有登陆跳转到登陆页面
        request.getSession().setAttribute("error","用户名或密码错误");
        request.getRequestDispatcher("/user/toLogin");
        return false;
    }
}
